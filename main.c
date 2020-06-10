/*
 * main.c
 *
 *  Created on: Apr 3, 2020
 *      Author: ammarreda
 */
/*
 * main.c
 *
 *  Created on: Mar 28, 2020
 *      Author: ammarreda
 */
/*
 * "Hello World" example.
 *
 * This example prints 'Hello from Nios II' to the STDOUT stream. It runs on
 * the Nios II 'standard', 'full_featured', 'fast', and 'low_cost' example
 * designs. It runs with or without the MicroC/OS-II RTOS and requires a STDOUT
 * device in your system's hardware.
 * The memory footprint of this hosted application is ~69 kbytes by default
 * using the standard reference design.
 *
 * For a reduced footprint version of this template, and an explanation of how
 * to reduce the memory footprint for a given application, see the
 * "small_hello_world" template.
 *
 */

#include <stdio.h>
#include "system.h"
#include "alt_types.h"
#include "io.h"
#include "sys/alt_irq.h"
#include "sys/alt_timestamp.h"

/* register offset definitions */
#define MAT_A_WR_OFT   		0         //WRITE OP
#define MAT_B_WR_OFT   		1		  //WRITE OP
#define STRT_REG_OFT  		2		  //WRITE OP
#define WRT_C_READ_OFT      3         //READ OP BUT NEEDS TO PERFROM WRITE OP WITH INDEX TO READ BY WRT_C_ADDR_OFT
#define REDY_REG_OFT   		4         //READ OP
#define DONE_REG_OFT   		5         //READ/WRITE OP
#define WRT_C_ADDR_OFT  	6		  //WRITE MAT C OFFSET ADDRESS TO READ FROM

static void mat_mult_isr(void* context, alt_u32 id);
void mat_mult_software(alt_u32 *mat_a, alt_u32 *mat_b);
void mat_mult_hardware(alt_u32 *mat_a, alt_u32 *mat_b);


alt_u32 c_hw[9];
alt_u32 c_sw[9];

int main()
{

	/***If you want to compare the speed between SW & HW implemntation comment the following 4 lines (isr will not be used)***/
	alt_u32 a[9] = {241,255,255, 255,255,255 ,255,255,255};
	alt_u32 b[9] = {255,255,255, 255,255,255 ,255,255,255};
    alt_irq_register(AVALON_MAT_MULT_0_IRQ, 0, mat_mult_isr);
	mat_mult_hardware(a, b);



	/***if you want to compare the speed between SW & HW implemntation un-comment the following lines***/
	/*
	srand(300);
	for(int i =0; i<=10000; i++){
		for(int j=0; j<9; j++){

			a[j] =  (rand() % (255 - 0 + 1));
			b[j] =  (rand() % (255 - 0 + 1));
		};

		mat_mult_hardware(a, b);
		mat_mult_software(a, b);

		for(int i=0; i<9; i++){
			if(c_hw[i] != c_sw[i]){
				printf ("Inconsistency \n");
					for(int i=0; i<9; i++){
						printf("a(%u):  %u \n",i ,a[i]);
						printf("b(%u):  %u \n",i ,b[i]);
						printf("c_hw(%u):  %u \n",i ,c_hw[i]);
						printf("c_sw(%u):  %u \n",i ,c_sw[i]);
					};
				}
			}
		printf("%d \n", i);
	};
	printf("Test Done \n");
	*/



  return 0;
}

static void mat_mult_isr(void* context, alt_u32 id){s

	printf("isr .. \n");
	for(int i=0; i<9; i++){
		IOWR(AVALON_MAT_MULT_0_BASE, WRT_C_ADDR_OFT, i);
		printf("c(%d):  %u \n", i, IORD(AVALON_MAT_MULT_0_BASE, WRT_C_READ_OFT));
	}
	/* clear done-tick register */
	IOWR(AVALON_MAT_MULT_0_BASE, DONE_REG_OFT, 1);
}



void mat_mult_software(alt_u32 *mat_a, alt_u32 *mat_b){

	int n = 0;
	int j = 0;
	int x = 0;
	int k;
	alt_u32 c[9] = {0,0,0 ,0,0,0 ,0,0,0};

    for(int i=0; i<9; i++){
    	k=0;
    	while(k<=2){
    		c[i]= c[i] + (*(mat_a+(k+x))) * (*(mat_b+(j+k)));;
    		k= k+1;
    	}
    	j=j+3;
    	if(j==9){
    		x=x+3;
    		j=0;
    	}
    }

    for(int i=0; i<9; i++)
		c_sw[i] = c[i];
}

void mat_mult_hardware(alt_u32 *mat_a, alt_u32 *mat_b){

	alt_u32 ready;
	int done;
	
	/* wait until the mat mult accelerator is ready */
	while(1) {
		ready = IORD(AVALON_MAT_MULT_0_BASE , REDY_REG_OFT) & 0x00000001;
		if (ready==1)
		break;
	}

	for(alt_u32 i=0; i<9; i++){
		IOWR(AVALON_MAT_MULT_0_BASE, MAT_A_WR_OFT, (*(mat_a+i)) | (i<<8));
		IOWR(AVALON_MAT_MULT_0_BASE, MAT_B_WR_OFT, (*(mat_b+i)) | (i<<8));
	}

	/* generate a 1—pulse */
	IOWR(AVALON_MAT_MULT_0_BASE, STRT_REG_OFT, 1);


	/*** comment the following lines in case you will use isr***/
	/*
	while(1) {
		done = IORD(AVALON_MAT_MULT_0_BASE , DONE_REG_OFT) & 0x0000001;
		if (done==1)
		break;
	}

	for(int i=0; i<9; i++){
		IOWR(AVALON_MAT_MULT_0_BASE, WRT_C_ADDR_OFT, i);
		*(c_hw + i) = IORD(AVALON_MAT_MULT_0_BASE, WRT_C_READ_OFT);
		//printf("c(%d):  %u \n", i, );
	}

	//printf("ticks hw=  %u \n",  *clks);

	IOWR(AVALON_MAT_MULT_0_BASE, DONE_REG_OFT, 1);
	*/
}
