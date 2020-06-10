library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mat_mult_toplevel is
	  port(clk ,rst ,start, mat_a_wr, mat_b_wr: in std_logic;  		
		a_addr, b_addr: in std_logic_vector(3 downto 0);
		mat_a_in, mat_b_in: in std_logic_vector(7 downto 0);
		mat_c_r_addr: in std_logic_vector(3 downto 0);
		mat_c_out: out std_logic_vector(17 downto 0);
		done, ready: out std_logic);
end mat_mult_toplevel;

architecture rtl of mat_mult_toplevel is

component mat_mult_fsm is
	port (clk, rst, start, fin_i, fin_k, fin_j : in std_logic;
		clr, en_i, en_k, en_j, en_x, c_wr, k_rst, j_rst, mux_c_sel, sdone, ready: out std_logic);
end component;

component mult_8bit is   --IntMultiplier_UsingDSP_8_8_16_unsigned_F400_uid2--
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Y : in  std_logic_vector(7 downto 0);
          R : out  std_logic_vector(15 downto 0));
end component;

component ram_9x8bit is 
	port(clk, wr : in std_logic; 
		data_in_addr : in std_logic_vector(3 downto 0);
		data_out_addr : in std_logic_vector(3 downto 0); 
		din : in std_logic_vector(7 downto 0);
		dout : out std_logic_vector(7 downto 0));
end component;
	
component ram_9x18bit_rst is 
	port(clk, wr, rst : in std_logic; 
		addr : in std_logic_vector(3 downto 0); 
		din : in std_logic_vector(17 downto 0);
		dout : out std_logic_vector(17 downto 0));	
end component; 

component counter_x is
	port (clk, rst, en: in std_logic;
		count_out: out std_logic_vector(2 downto 0));
end component;

component counter_n is
	port (clk, rst, en: in std_logic;
		fin: out std_logic;
		count_out: out std_logic_vector(3 downto 0));
end component;

component counter_k is
	port (clk, rst, clr, en: in std_logic;
		fin: out std_logic;
		count_out: out std_logic_vector(2 downto 0));
end component;

component counter_j is
	port (clk, rst, clr, en: in std_logic;
		fin: out std_logic;
		count_out: out std_logic_vector(2 downto 0));
end component;

component adder_18bit is
	port(a : in std_logic_vector (17 downto 0);
		b : in std_logic_vector (15 downto 0);
		sum : out std_logic_vector (17 downto 0);
		cout: out std_logic);
end component;

component adder_3bit is
	port(a ,b : in std_logic_vector (2 downto 0);
		sum : out std_logic_vector (3 downto 0));
end component;

component mux2_1 is 
port(sel : in std_logic;
    fsmd_addr, master_addr: in std_logic_vector(3 downto 0);
	addr_out : out std_logic_vector(3 downto 0));
end component;

signal clr_int, en_i_int, fin_i_int, en_k_int, fin_k_int, en_j_int, fin_j_int, en_x_int, mat_c_wr, cout_adder
			,k_rst_int, j_rst_int, mux_c_sel_int, ready_int : std_logic;
signal mat_a_out, mat_b_out : std_logic_vector(7 downto 0);
signal mat_a_addr, mat_b_addr, mat_c_addr, i_int: std_logic_vector(3 downto 0); 
signal x_int, j_int, k_int: std_logic_vector(2 downto 0);
signal mult_out: std_logic_vector(15 downto 0);
signal mat_c_out_int, adder_18bit_out: std_logic_vector(17 downto 0);
signal reset : std_logic;


begin 
	reset <= rst or clr_int;

	mux: mux2_1 port map (mux_c_sel_int, i_int, mat_c_r_addr, mat_c_addr);
	c: ram_9x18bit_rst port map(clk, mat_c_wr, clr_int, mat_c_addr, adder_18bit_out, mat_c_out_int);
	
	adder_18: adder_18bit port map(mat_c_out_int, mult_out, adder_18bit_out, cout_adder);
	
	fsm: mat_mult_fsm port map(clk, rst, start, fin_i_int, fin_k_int, fin_j_int,
		clr_int, en_i_int, en_k_int, en_j_int, en_x_int, mat_c_wr, k_rst_int, j_rst_int, mux_c_sel_int, done, ready_int);
	
	i : counter_n port map (clk, reset, en_i_int, fin_i_int, i_int);
	k : counter_k port map (clk, reset, k_rst_int, en_k_int, fin_k_int, k_int);
	j : counter_j port map (clk, reset, j_rst_int, en_j_int, fin_j_int, j_int);
	x : counter_x port map (clk, reset, en_x_int, x_int);
	
	x_k_add: adder_3bit port map (x_int, k_int, mat_a_addr);
	j_k_add: adder_3bit port map (j_int, k_int, mat_b_addr);
		
	mat_a : ram_9x8bit port map(clk, mat_a_wr, a_addr, mat_a_addr, mat_a_in, mat_a_out);
	mat_b : ram_9x8bit port map(clk, mat_b_wr, b_addr, mat_b_addr, mat_b_in, mat_b_out);
		
	multiplier: mult_8bit port map(clk, reset, mat_a_out, mat_b_out, mult_out);

	ready <= ready_int;
	mat_c_out <= mat_c_out_int;
end architecture rtl;

