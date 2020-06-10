library ieee;
use ieee.std_logic_1164. all;

entity avalon_mat_mult is
    port(
    -- to be connected to Avalon clock input interface
    clk, reset: in std_logic;
    --  to be connected to Avalon MM slave interface    
    mat_mult_address: in std_logic_vector(2 downto 0);
    mat_mult_chipselect: in std_logic;
    mat_mult_write: in std_logic;
    mat_mult_writedata: in std_logic_vector(31 downto 0);
	mat_mult_readdata: out std_logic_vector(31 downto 0);
	-- to be connected to Avalon interrupt sender interface
	mat_mult_irq: out std_logic
	);
end avalon_mat_mult;


architecture arch of avalon_mat_mult is

    signal mat_mult_start, mat_mult_ready: std_logic;
    signal done_tick_reg: std_logic;
    signal set_done_tick, clr_done_tick: std_logic;
    signal mat_a_wr_int, mat_b_wr_int, mat_c_wr_int: std_logic;
    signal a_addr_int, b_addr_int, mat_c_r_addr_int: std_logic_vector(3 downto 0);
    signal mat_c_out_int: std_logic_vector(17 downto 0);
    signal mat_a_in_int, mat_b_in_int: std_logic_vector(7 downto 0);
    signal wr_en: std_logic;
    
begin

-----------------------------------------------------
------------------- instantiation -------------------
--------instantiate matrix multiplier circuit-------- 
-----------------------------------------------------

mat_mult_unit :  entity work.mat_mult_toplevel
    port map(clk=> clk, rst=> reset, start=> mat_mult_start,
            mat_a_wr=> mat_a_wr_int, 
            mat_b_wr=> mat_b_wr_int,
            a_addr=> a_addr_int,
            b_addr=> b_addr_int,
            mat_a_in=> mat_a_in_int, 
            mat_b_in=> mat_b_in_int,
            mat_c_r_addr => mat_c_r_addr_int,
            mat_c_out => mat_c_out_int,
            done => set_done_tick, ready=> mat_mult_ready
    );

-----------------------------------------------------
------------------- Registers maps ------------------
-----------------------------------------------------

process (clk, reset)
begin
    if reset = '1' then
        done_tick_reg <= '0';                         
        mat_c_r_addr_int <= (others => '0');
        a_addr_int <= (others => '0');
        mat_a_in_int <= (others => '0');
        b_addr_int <= (others =>'0');
        mat_b_in_int <= (others =>'0');
	elsif (clk'event and clk= '1') then
        if mat_a_wr_int = '1' then
            a_addr_int  <= mat_mult_writedata(11 downto 8);
            mat_a_in_int <= mat_mult_writedata(7 downto 0);
		end if;
		if mat_b_wr_int = '1' then
            b_addr_int  <= mat_mult_writedata(11 downto 8);
            mat_b_in_int <= mat_mult_writedata(7 downto 0);
        end if;
        if mat_c_wr_int ='1' then
            mat_c_r_addr_int <= mat_mult_writedata(3 downto 0);
        end if;
		if (set_done_tick = '1') then
			done_tick_reg <= '1';
		elsif (clr_done_tick = '1') then
			done_tick_reg <= '0';
		end if;
	end if;
end process;

-----------------------------------------------------
-------------- write decoding logic -----------------
-----------------------------------------------------

wr_en <= '1' when mat_mult_write = '1' and mat_mult_chipselect = '1' else '0';
mat_a_wr_int <= '1' when mat_mult_address = "000" and wr_en = '1' else '0';
mat_b_wr_int <= '1' when mat_mult_address = "001" and wr_en = '1' else '0';
mat_mult_start <= '1' when mat_mult_address = "010" and wr_en = '1' else '0';
clr_done_tick <= '1' when mat_mult_address = "101" and wr_en = '1' else '0';
mat_c_wr_int <= '1' when mat_mult_address = "110" and wr_en = '1' else '0';

-----------------------------------------------------
-------------- read multiplexing logic --------------
-----------------------------------------------------
mat_mult_readdata <=
    X"000"&"00"&mat_c_out_int when mat_mult_address = "011" else
	X"0000000"&"000"&mat_mult_ready when mat_mult_address = "100" else
	X"0000000"&"000"&done_tick_reg;

--------------------------------------------------------
------------- interrupt request signal -----------------
--------------------------------------------------------

mat_mult_irq <= done_tick_reg;
end arch;