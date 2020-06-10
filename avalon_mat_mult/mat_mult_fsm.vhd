library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mat_mult_fsm is

port (clk, rst, start, fin_i, fin_k, fin_j : in std_logic;
		clr, en_i, en_k, en_j, en_x, c_wr, k_rst, j_rst, mux_c_sel, sdone, ready: out std_logic);
end mat_mult_fsm;

architecture rtl of mat_mult_fsm is
type state_type is (s_idle, s_1, s_2, s_3, s_4, s_5, s_done);
signal current_state, next_state: state_type;

begin
process (start, fin_i, fin_k, fin_j, current_state)
begin
case current_state is

when s_idle =>
	ready <= '1';

	en_i <= '0';
	en_k <= '0';
	en_j <= '0';
	en_x <= '0';
	
	c_wr <= '0';
	
	k_rst <= '0';
	j_rst <= '0';
	sdone <= '0';
	
if (start = '1') then
	clr <= '1';
	mux_c_sel <= '0';   -----Master CAN NOT read from matrix c when it starts a new operation (when start =1)
	next_state <= s_1;

else	
	clr <= '0';
	mux_c_sel <= '1';   -----Master can read from matrix c only if it the fsmd finishs the operation (Return back from sdone to sinit)
	next_state <= s_idle;
end if;

when s_1 => 
	clr <= '0';
	ready <='0';

	mux_c_sel <= '0';

	en_i <= '0';
	en_k <= '0';
	en_j <= '0';
	en_x <= '0';
	
	c_wr <= '0';
	
	k_rst <= '0';
	j_rst <= '0';
	sdone <= '0';
		
if (fin_k = '1') then
	next_state <= s_3;   
else
	next_state <= s_2;   
end if;

when s_2 => 
	clr <= '0';
	ready <='0';

	mux_c_sel <= '0';

	en_i <= '0';
	en_k <='1';   
	en_j <= '0';
	en_x <= '0';
	
	c_wr <= '1';
	
	k_rst <= '0';
	j_rst <= '0';
	sdone <= '0';
	
	next_state <= s_1;

when s_3=>               
	clr <= '0';
	ready <='0';

	mux_c_sel <= '0';

	en_i <= '1';
	en_k <= '0';
	en_j <= '1';               
	en_x <= '0';
	
	c_wr <= '0';
	
	k_rst <= '1';
	j_rst <= '0';
	sdone <= '0';
	
	next_state <= s_4;
	
	
when s_4 =>    
	clr <= '0';
	ready <='0';

	mux_c_sel <= '0';

	en_i <= '0';  
	en_k <= '0';
	en_j <= '0';
	en_x <= '0';
	
	c_wr <= '0';
	
	k_rst <= '0';
	j_rst <= '0';
	sdone <= '0';

if (fin_j = '1') then
	next_state <= s_5;
else if(fin_i = '1') then
	next_state <= s_done;
else
	next_state <= s_1;
end if;
end if;
	
	
when s_5 =>
	clr <= '0';
	ready <='0';

	mux_c_sel <= '0';

	en_i <= '0';
	en_k <= '0';
	en_j <= '0';
	en_x <= '1';
	
	c_wr <= '0';
	
	k_rst <= '0';
	j_rst <= '1';
	sdone <= '0';

	if(fin_i = '1') then
		next_state <= s_done;
	else
		next_state <= s_1;
	end if;

when s_done =>
	clr <= '0';
	ready <='0';

	mux_c_sel <= '1';

	en_i <= '0';
	en_k <= '0';
	en_j <= '0';
	en_x <= '0';
	
	c_wr <= '0';
	
	k_rst <= '0';
	j_rst <= '0';
	sdone <= '1';
	
	next_state <= s_idle;
	
when others =>
	clr <= '0';
	ready <='0';

	mux_c_sel <= '0';

	en_i <= '0';
	en_k <= '0';
	en_j <= '0';
	en_x <= '0';
	
	c_wr <= '0';
	
	k_rst <= '0';
	j_rst <= '0';
	sdone <= '0';

	next_state <= s_idle;
end case;
end process;

process (rst, clk)
begin
	if (rst = '1') then
		current_state <= s_idle;
	elsif (rising_edge(clk)) then
		current_state <= next_state;
	end if;
end process;
end rtl;