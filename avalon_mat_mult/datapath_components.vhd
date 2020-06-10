--------------------------------------------------------------------------------                                                                          --      
--       This File contains all the datapath components of the desgin         --  
--        			4 Counters, 2 Adders, 2 Rams, 1 mux                       --
--	You can find The Multipler (flopoco multiplier) in (mult_8bit.vhd)        --
--------------------------------------------------------------------------------

--------------------------------------------------------------------
--                          Counters                             ---
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity counter_j is
	port (clk, rst, clr, en: in std_logic;
		fin: out std_logic;
		count_out: out std_logic_vector(2 downto 0));
end entity counter_j;

architecture rtl of counter_j is
	signal count_temp: unsigned(3 downto 0);
begin

	process (rst, clk, clr)
	begin
		if ((rst or clr) = '1') then
			count_temp <= (others =>'0');
		elsif (rising_edge(clk)) then
			if(en='1') then
				count_temp <= count_temp + 3;
			end if;
		end if;
	end process;
	
	count_out <= std_logic_vector(count_temp(2 downto 0));
	fin <= '1' when count_temp =9 else '0';
end architecture rtl;
--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity counter_k is
	port (clk, rst, clr, en: in std_logic;
		fin: out std_logic;
		count_out: out std_logic_vector(2 downto 0));
end entity counter_k;

architecture rtl of counter_k is
	signal count_temp: unsigned(2 downto 0);
begin

	process (rst, clk, clr)
	begin
		if ((rst or clr) = '1') then
			count_temp <= (others =>'0');
		elsif (rising_edge(clk)) then
			if(en='1') then
				count_temp <= count_temp + 1;
			end if;
		end if;
	end process;

	fin <= '1' when count_temp =3 else '0';
	count_out <= std_logic_vector(count_temp);
end architecture rtl;

--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity counter_n is
	port (clk, rst, en: in std_logic;
		fin: out std_logic;
		count_out: out std_logic_vector(3 downto 0));
end entity counter_n;

architecture rtl of counter_n is
	signal count_temp: unsigned(3 downto 0);
begin

	process (rst, clk)
	begin
		if (rst = '1') then
			count_temp <= (others =>'0');
		elsif (rising_edge(clk)) then
			if(en='1') then
				count_temp <= count_temp + 1;
			end if;
		end if;
	end process;

	fin <= '1' when count_temp =9 else '0';
	count_out <= std_logic_vector(count_temp);
end architecture rtl;

--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity counter_x is
	port (clk, rst, en: in std_logic;
		count_out: out std_logic_vector(2 downto 0));
end entity counter_x;

architecture rtl of counter_x is
	signal count_temp: unsigned(2 downto 0);
begin

	process (rst, clk)
	begin
		if (rst = '1') then
			count_temp <= (others =>'0');
		elsif (rising_edge(clk)) then
			if(en='1') then
				count_temp <= count_temp + 3;
			end if;
		end if;
	end process;

	count_out <= std_logic_vector(count_temp);
end architecture rtl;
--------------------------------------------------------------------
--                             Adders                             --
--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity full_adder is
	port (a, b, cin: in std_logic;
		cout, sum: out std_logic);
end full_adder ;

architecture rtl of full_adder is
begin
	sum <= a xor b xor cin;
	cout <= (a and cin) or (b and cin) or (a and b);
end rtl;
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity adder_3bit is
	port(a ,b : in std_logic_vector (2 downto 0);
		sum : out std_logic_vector (3 downto 0));
end adder_3bit;


architecture rtl of adder_3bit is

component full_adder is
	port (a, b, cin: in std_logic;
		cout, sum: out std_logic);
end component;	

	signal c: std_logic_vector (1 downto 0);
	signal s_int: std_logic_vector (2 downto 0);
	signal cout: std_logic;

begin 

inst_0: full_adder port map (a(0), b(0), '0', c(0), s_int(0));
inst_1: full_adder port map (a(1), b(1), c(0), c(1), s_int(1));
inst_2: full_adder port map (a(2), b(2), c(1), cout, s_int(2));


sum <= cout&s_int;
	
end architecture rtl;
-------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity adder_18bit is
	port(a : in std_logic_vector (17 downto 0);
		b : in std_logic_vector (15 downto 0);
		sum : out std_logic_vector (17 downto 0);
		cout: out std_logic);
end adder_18bit;


architecture rtl of adder_18bit is

component full_adder is
	port (a, b, cin: in std_logic;
		cout, sum: out std_logic);
end component;	

	signal c: std_logic_vector (16 downto 0);
	signal s_int: std_logic_vector (17 downto 0);

begin 

inst_0: full_adder port map (a(0), b(0), '0', c(0), s_int(0));
inst_1: full_adder port map (a(1), b(1), c(0), c(1), s_int(1));
inst_2: full_adder port map (a(2), b(2), c(1), c(2), s_int(2));
inst_3: full_adder port map (a(3), b(3), c(2), c(3), s_int(3));
inst_4: full_adder port map (a(4), b(4), c(3), c(4), s_int(4));
inst_5: full_adder port map (a(5), b(5), c(4), c(5), s_int(5));
inst_6: full_adder port map (a(6), b(6), c(5), c(6), s_int(6));
inst_7: full_adder port map (a(7), b(7), c(6), c(7), s_int(7));
inst_8: full_adder port map (a(8), b(8), c(7), c(8), s_int(8));
inst_9: full_adder port map (a(9), b(9), c(8), c(9), s_int(9));
inst_10: full_adder port map (a(10), b(10), c(9), c(10), s_int(10));
inst_11: full_adder port map (a(11), b(11), c(10), c(11), s_int(11));
inst_12: full_adder port map (a(12), b(12), c(11), c(12), s_int(12));
inst_13: full_adder port map (a(13), b(13), c(12), c(13), s_int(13));
inst_14: full_adder port map (a(14), b(14), c(13), c(14), s_int(14));
inst_15: full_adder port map (a(15), b(15), c(14), c(15), s_int(15));
inst_16: full_adder port map (a(16), '0', c(15), c(16), s_int(16));
inst_17: full_adder port map (a(17), '0', c(16), cout, s_int(17));

sum <= s_int;
end architecture rtl;

--------------------------------------------------------------------
--                     Ram For input matrix A and B              ---
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity ram_9x8bit is 
port(clk, wr : in std_logic; 
	data_in_addr : in std_logic_vector(3 downto 0);
	data_out_addr : in std_logic_vector(3 downto 0); 
	din : in std_logic_vector(7 downto 0);
	dout : out std_logic_vector(7 downto 0));
end ram_9x8bit; 

architecture rtl of ram_9x8bit is

type ram_type is array (0 to 8) of std_logic_vector(7 downto 0); 


signal program : ram_type := (
"00000000",
"00000000",
"00000000",
"00000000", 
"00000000",
"00000000",
"00000000", 
"00000000", 
"00000000"); 

begin

	process(clk) 
	begin 
		if (rising_edge(clk)) then 
			if (wr = '1') then 
				program(conv_integer(unsigned(data_in_addr))) <= din;
			end if;
		end if;
	end process;
	dout <=program(conv_integer(8)) when (unsigned(data_out_addr)>= 8) else program(conv_integer(unsigned(data_out_addr)));
end rtl;

--------------------------------------------------------------------
--                Ram For output matrix c , with rst signal       --
--------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ram_9x18bit_rst is 
port(clk, wr, rst : in std_logic; 
	addr : in std_logic_vector(3 downto 0); 
	din : in std_logic_vector(17 downto 0);
	dout : out std_logic_vector(17 downto 0));
end ram_9x18bit_rst; 

architecture rtl of ram_9x18bit_rst is

type ram_type is array (0 to 8) of std_logic_vector(17 downto 0); 

signal program : ram_type := (
"000000000000000000",
"000000000000000000",
"000000000000000000",
"000000000000000000", 
"000000000000000000",
"000000000000000000",
"000000000000000000", 
"000000000000000000", 
"000000000000000000"); 

begin
	process(clk,rst) 
	begin 
		if (rst = '1') then
			program(0) <= "000000000000000000";
			program(1) <= "000000000000000000";
			program(2) <= "000000000000000000";
			program(3) <= "000000000000000000";
			program(4) <= "000000000000000000";
			program(5) <= "000000000000000000";
			program(6) <= "000000000000000000";
			program(7) <= "000000000000000000";
			program(8) <= "000000000000000000";

		elsif (rising_edge(clk)) then 
			if (wr = '1') then 
				program(conv_integer(unsigned(addr))) <= din;
			end if;
		end if;
	end process;

 	dout <=program(conv_integer(8)) when addr="1001" else program(conv_integer(unsigned(addr)));
end rtl;

--------------------------------------------------------------------
--          Mux 2to1 For selecting input address for matrix c     --
--------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mux2_1 is 
port(sel : in std_logic;
    fsmd_addr, master_addr: in std_logic_vector(3 downto 0);
	addr_out : out std_logic_vector(3 downto 0));
end mux2_1; 

architecture rtl of mux2_1 is

begin
	addr_out <= fsmd_addr when sel = '0' else
			master_addr;
end rtl;