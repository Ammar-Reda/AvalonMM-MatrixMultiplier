--------------------------------------------------------------------------------
--                     SmallMultTableP3x3r6XuYu_F400_uid7
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin (2007-2012)
--------------------------------------------------------------------------------
library ieee; 
use ieee.std_logic_1164.all;
library work;
entity SmallMultTableP3x3r6XuYu_F400_uid7 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(5 downto 0);
          Y : out  std_logic_vector(5 downto 0)   );
end entity;

architecture arch of SmallMultTableP3x3r6XuYu_F400_uid7 is
signal TableOut :  std_logic_vector(5 downto 0);
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
  with X select TableOut <= 
   "000000" when "000000",
   "000000" when "000001",
   "000000" when "000010",
   "000000" when "000011",
   "000000" when "000100",
   "000000" when "000101",
   "000000" when "000110",
   "000000" when "000111",
   "000000" when "001000",
   "000001" when "001001",
   "000010" when "001010",
   "000011" when "001011",
   "000100" when "001100",
   "000101" when "001101",
   "000110" when "001110",
   "000111" when "001111",
   "000000" when "010000",
   "000010" when "010001",
   "000100" when "010010",
   "000110" when "010011",
   "001000" when "010100",
   "001010" when "010101",
   "001100" when "010110",
   "001110" when "010111",
   "000000" when "011000",
   "000011" when "011001",
   "000110" when "011010",
   "001001" when "011011",
   "001100" when "011100",
   "001111" when "011101",
   "010010" when "011110",
   "010101" when "011111",
   "000000" when "100000",
   "000100" when "100001",
   "001000" when "100010",
   "001100" when "100011",
   "010000" when "100100",
   "010100" when "100101",
   "011000" when "100110",
   "011100" when "100111",
   "000000" when "101000",
   "000101" when "101001",
   "001010" when "101010",
   "001111" when "101011",
   "010100" when "101100",
   "011001" when "101101",
   "011110" when "101110",
   "100011" when "101111",
   "000000" when "110000",
   "000110" when "110001",
   "001100" when "110010",
   "010010" when "110011",
   "011000" when "110100",
   "011110" when "110101",
   "100100" when "110110",
   "101010" when "110111",
   "000000" when "111000",
   "000111" when "111001",
   "001110" when "111010",
   "010101" when "111011",
   "011100" when "111100",
   "100011" when "111101",
   "101010" when "111110",
   "110001" when "111111",
   "------" when others;
    Y <= TableOut;
end architecture;

--------------------------------------------------------------------------------
--                              Compressor_14_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_14_3 is
   port ( X0 : in  std_logic_vector(3 downto 0);
          X1 : in  std_logic_vector(0 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_14_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <= 
      "000" when "00000", 
      "001" when "00001", 
      "001" when "00010", 
      "010" when "00011", 
      "001" when "00100", 
      "010" when "00101", 
      "010" when "00110", 
      "011" when "00111", 
      "001" when "01000", 
      "010" when "01001", 
      "010" when "01010", 
      "011" when "01011", 
      "010" when "01100", 
      "011" when "01101", 
      "011" when "01110", 
      "100" when "01111", 
      "010" when "10000", 
      "011" when "10001", 
      "011" when "10010", 
      "100" when "10011", 
      "011" when "10100", 
      "100" when "10101", 
      "100" when "10110", 
      "101" when "10111", 
      "011" when "11000", 
      "100" when "11001", 
      "100" when "11010", 
      "101" when "11011", 
      "100" when "11100", 
      "101" when "11101", 
      "101" when "11110", 
      "110" when "11111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                              Compressor_23_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_23_3 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(1 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_23_3 is
signal X :  std_logic_vector(4 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <= 
      "000" when "00000", 
      "001" when "00001", 
      "001" when "00010", 
      "010" when "00011", 
      "001" when "00100", 
      "010" when "00101", 
      "010" when "00110", 
      "011" when "00111", 
      "010" when "01000", 
      "011" when "01001", 
      "011" when "01010", 
      "100" when "01011", 
      "011" when "01100", 
      "100" when "01101", 
      "100" when "01110", 
      "101" when "01111", 
      "010" when "10000", 
      "011" when "10001", 
      "011" when "10010", 
      "100" when "10011", 
      "011" when "10100", 
      "100" when "10101", 
      "100" when "10110", 
      "101" when "10111", 
      "100" when "11000", 
      "101" when "11001", 
      "101" when "11010", 
      "110" when "11011", 
      "101" when "11100", 
      "110" when "11101", 
      "110" when "11110", 
      "111" when "11111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                              Compressor_13_3
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Popa, Illyes Kinga, 2012
--------------------------------------------------------------------------------
-- combinatorial

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity Compressor_13_3 is
   port ( X0 : in  std_logic_vector(2 downto 0);
          X1 : in  std_logic_vector(0 downto 0);
          R : out  std_logic_vector(2 downto 0)   );
end entity;

architecture arch of Compressor_13_3 is
signal X :  std_logic_vector(3 downto 0);
begin
   X <=X1 & X0 ;
   with X select R <= 
      "000" when "0000", 
      "001" when "0001", 
      "001" when "0010", 
      "010" when "0011", 
      "001" when "0100", 
      "010" when "0101", 
      "010" when "0110", 
      "011" when "0111", 
      "010" when "1000", 
      "011" when "1001", 
      "011" when "1010", 
      "100" when "1011", 
      "011" when "1100", 
      "100" when "1101", 
      "100" when "1110", 
      "101" when "1111", 
      "---" when others;

end architecture;

--------------------------------------------------------------------------------
--                           IntAdder_14_f400_uid58
--                     (IntAdderClassical_14_F400_uid60)
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Bogdan Pasca, Florent de Dinechin (2008-2010)
--------------------------------------------------------------------------------
-- Pipeline depth: 0 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
library std;
use std.textio.all;
library work;

entity IntAdder_14_f400_uid58 is
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(13 downto 0);
          Y : in  std_logic_vector(13 downto 0);
          Cin : in  std_logic;
          R : out  std_logic_vector(13 downto 0)   );
end entity;

architecture arch of IntAdder_14_f400_uid58 is
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
         end if;
      end process;
   --Classical
    R <= X + Y + Cin;
end architecture;

--------------------------------------------------------------------------------
--              IntMultiplier_UsingDSP_8_8_16_unsigned_F400_uid2
-- This operator is part of the Infinite Virtual Library FloPoCoLib
-- All rights reserved 
-- Authors: Florent de Dinechin, Kinga Illyes, Bogdan Popa, Bogdan Pasca, 2012
--------------------------------------------------------------------------------
-- Pipeline depth: 1 cycles

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library std;
use std.textio.all;
library work;

entity mult_8bit is   --IntMultiplier_UsingDSP_8_8_16_unsigned_F400_uid2--
   port ( clk, rst : in std_logic;
          X : in  std_logic_vector(7 downto 0);
          Y : in  std_logic_vector(7 downto 0);
          R : out  std_logic_vector(15 downto 0)   );
end entity;

architecture arch of mult_8bit is
   component IntAdder_14_f400_uid58 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(13 downto 0);
             Y : in  std_logic_vector(13 downto 0);
             Cin : in  std_logic;
             R : out  std_logic_vector(13 downto 0)   );
   end component;

   component SmallMultTableP3x3r6XuYu_F400_uid7 is
      port ( clk, rst : in std_logic;
             X : in  std_logic_vector(5 downto 0);
             Y : out  std_logic_vector(5 downto 0)   );
   end component;

   component Compressor_14_3 is
      port ( X0 : in  std_logic_vector(3 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_23_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(1 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

   component Compressor_13_3 is
      port ( X0 : in  std_logic_vector(2 downto 0);
             X1 : in  std_logic_vector(0 downto 0);
             R : out  std_logic_vector(2 downto 0)   );
   end component;

signal XX_m3 :  std_logic_vector(7 downto 0);
signal YY_m3 :  std_logic_vector(7 downto 0);
signal Xp_m3b5 :  std_logic_vector(8 downto 0);
signal Yp_m3b5 :  std_logic_vector(8 downto 0);
signal x_m3b5_0 :  std_logic_vector(2 downto 0);
signal x_m3b5_1 :  std_logic_vector(2 downto 0);
signal x_m3b5_2 :  std_logic_vector(2 downto 0);
signal y_m3b5_0 :  std_logic_vector(2 downto 0);
signal y_m3b5_1 :  std_logic_vector(2 downto 0);
signal y_m3b5_2 :  std_logic_vector(2 downto 0);
signal Y0X0_5_m3 :  std_logic_vector(5 downto 0);
signal PP5X0Y0_m3 :  std_logic_vector(5 downto 0);
signal heap_bh4_w0_0 :  std_logic;
signal heap_bh4_w1_0 :  std_logic;
signal heap_bh4_w2_0 :  std_logic;
signal heap_bh4_w3_0, heap_bh4_w3_0_d1 :  std_logic;
signal Y0X1_5_m3 :  std_logic_vector(5 downto 0);
signal PP5X1Y0_m3 :  std_logic_vector(5 downto 0);
signal heap_bh4_w2_1 :  std_logic;
signal heap_bh4_w3_1 :  std_logic;
signal heap_bh4_w4_0 :  std_logic;
signal heap_bh4_w5_0 :  std_logic;
signal heap_bh4_w6_0 :  std_logic;
signal Y0X2_5_m3 :  std_logic_vector(5 downto 0);
signal PP5X2Y0_m3 :  std_logic_vector(5 downto 0);
signal heap_bh4_w5_1 :  std_logic;
signal heap_bh4_w6_1 :  std_logic;
signal heap_bh4_w7_0 :  std_logic;
signal heap_bh4_w8_0 :  std_logic;
signal heap_bh4_w9_0 :  std_logic;
signal Y1X0_5_m3 :  std_logic_vector(5 downto 0);
signal PP5X0Y1_m3 :  std_logic_vector(5 downto 0);
signal heap_bh4_w2_2 :  std_logic;
signal heap_bh4_w3_2 :  std_logic;
signal heap_bh4_w4_1 :  std_logic;
signal heap_bh4_w5_2 :  std_logic;
signal heap_bh4_w6_2 :  std_logic;
signal Y1X1_5_m3 :  std_logic_vector(5 downto 0);
signal PP5X1Y1_m3 :  std_logic_vector(5 downto 0);
signal heap_bh4_w4_2 :  std_logic;
signal heap_bh4_w5_3 :  std_logic;
signal heap_bh4_w6_3 :  std_logic;
signal heap_bh4_w7_1 :  std_logic;
signal heap_bh4_w8_1 :  std_logic;
signal heap_bh4_w9_1 :  std_logic;
signal Y1X2_5_m3 :  std_logic_vector(5 downto 0);
signal PP5X2Y1_m3 :  std_logic_vector(5 downto 0);
signal heap_bh4_w7_2 :  std_logic;
signal heap_bh4_w8_2 :  std_logic;
signal heap_bh4_w9_2 :  std_logic;
signal heap_bh4_w10_0 :  std_logic;
signal heap_bh4_w11_0 :  std_logic;
signal heap_bh4_w12_0, heap_bh4_w12_0_d1 :  std_logic;
signal Y2X0_5_m3 :  std_logic_vector(5 downto 0);
signal PP5X0Y2_m3 :  std_logic_vector(5 downto 0);
signal heap_bh4_w5_4 :  std_logic;
signal heap_bh4_w6_4 :  std_logic;
signal heap_bh4_w7_3 :  std_logic;
signal heap_bh4_w8_3 :  std_logic;
signal heap_bh4_w9_3 :  std_logic;
signal Y2X1_5_m3 :  std_logic_vector(5 downto 0);
signal PP5X1Y2_m3 :  std_logic_vector(5 downto 0);
signal heap_bh4_w7_4 :  std_logic;
signal heap_bh4_w8_4 :  std_logic;
signal heap_bh4_w9_4 :  std_logic;
signal heap_bh4_w10_1 :  std_logic;
signal heap_bh4_w11_1 :  std_logic;
signal heap_bh4_w12_1 :  std_logic;
signal Y2X2_5_m3 :  std_logic_vector(5 downto 0);
signal PP5X2Y2_m3 :  std_logic_vector(5 downto 0);
signal heap_bh4_w10_2 :  std_logic;
signal heap_bh4_w11_2 :  std_logic;
signal heap_bh4_w12_2 :  std_logic;
signal heap_bh4_w13_0, heap_bh4_w13_0_d1 :  std_logic;
signal heap_bh4_w14_0, heap_bh4_w14_0_d1 :  std_logic;
signal heap_bh4_w15_0, heap_bh4_w15_0_d1 :  std_logic;
signal tempR_bh4_0, tempR_bh4_0_d1 :  std_logic_vector(1 downto 0);
signal CompressorIn_bh4_0_0 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh4_0_1 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh4_0_0 :  std_logic_vector(2 downto 0);
signal heap_bh4_w5_5, heap_bh4_w5_5_d1 :  std_logic;
signal heap_bh4_w6_5 :  std_logic;
signal heap_bh4_w7_5, heap_bh4_w7_5_d1 :  std_logic;
signal CompressorIn_bh4_1_2 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh4_1_3 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh4_1_1 :  std_logic_vector(2 downto 0);
signal heap_bh4_w6_6 :  std_logic;
signal heap_bh4_w7_6 :  std_logic;
signal heap_bh4_w8_5 :  std_logic;
signal CompressorIn_bh4_2_4 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh4_2_5 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh4_2_2 :  std_logic_vector(2 downto 0);
signal heap_bh4_w7_7 :  std_logic;
signal heap_bh4_w8_6 :  std_logic;
signal heap_bh4_w9_5, heap_bh4_w9_5_d1 :  std_logic;
signal CompressorIn_bh4_3_6 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh4_3_7 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh4_3_3 :  std_logic_vector(2 downto 0);
signal heap_bh4_w8_7 :  std_logic;
signal heap_bh4_w9_6 :  std_logic;
signal heap_bh4_w10_3 :  std_logic;
signal CompressorIn_bh4_4_8 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh4_4_9 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh4_4_4 :  std_logic_vector(2 downto 0);
signal heap_bh4_w9_7 :  std_logic;
signal heap_bh4_w10_4 :  std_logic;
signal heap_bh4_w11_3, heap_bh4_w11_3_d1 :  std_logic;
signal CompressorIn_bh4_5_10 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh4_5_11 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh4_5_5 :  std_logic_vector(2 downto 0);
signal heap_bh4_w2_3 :  std_logic;
signal heap_bh4_w3_3, heap_bh4_w3_3_d1 :  std_logic;
signal heap_bh4_w4_3, heap_bh4_w4_3_d1 :  std_logic;
signal CompressorIn_bh4_6_12 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh4_6_13 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh4_6_6 :  std_logic_vector(2 downto 0);
signal heap_bh4_w11_4 :  std_logic;
signal heap_bh4_w12_3, heap_bh4_w12_3_d1 :  std_logic;
signal heap_bh4_w13_1, heap_bh4_w13_1_d1 :  std_logic;
signal CompressorIn_bh4_7_14 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh4_7_15 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh4_7_7 :  std_logic_vector(2 downto 0);
signal heap_bh4_w4_4, heap_bh4_w4_4_d1 :  std_logic;
signal heap_bh4_w5_6, heap_bh4_w5_6_d1 :  std_logic;
signal heap_bh4_w6_7 :  std_logic;
signal tempR_bh4_1, tempR_bh4_1_d1 :  std_logic;
signal CompressorIn_bh4_8_16 :  std_logic_vector(3 downto 0);
signal CompressorIn_bh4_8_17 :  std_logic_vector(0 downto 0);
signal CompressorOut_bh4_8_8 :  std_logic_vector(2 downto 0);
signal heap_bh4_w10_5, heap_bh4_w10_5_d1 :  std_logic;
signal heap_bh4_w11_5, heap_bh4_w11_5_d1 :  std_logic;
signal heap_bh4_w12_4, heap_bh4_w12_4_d1 :  std_logic;
signal CompressorIn_bh4_9_18 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh4_9_19 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh4_9_9 :  std_logic_vector(2 downto 0);
signal heap_bh4_w6_8, heap_bh4_w6_8_d1 :  std_logic;
signal heap_bh4_w7_8, heap_bh4_w7_8_d1 :  std_logic;
signal heap_bh4_w8_8, heap_bh4_w8_8_d1 :  std_logic;
signal CompressorIn_bh4_10_20 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh4_10_21 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh4_10_10 :  std_logic_vector(2 downto 0);
signal heap_bh4_w8_9, heap_bh4_w8_9_d1 :  std_logic;
signal heap_bh4_w9_8, heap_bh4_w9_8_d1 :  std_logic;
signal heap_bh4_w10_6, heap_bh4_w10_6_d1 :  std_logic;
signal CompressorIn_bh4_11_22 :  std_logic_vector(2 downto 0);
signal CompressorIn_bh4_11_23 :  std_logic_vector(1 downto 0);
signal CompressorOut_bh4_11_11 :  std_logic_vector(2 downto 0);
signal heap_bh4_w12_5 :  std_logic;
signal heap_bh4_w13_2 :  std_logic;
signal heap_bh4_w14_1 :  std_logic;
signal finalAdderIn0_bh4 :  std_logic_vector(13 downto 0);
signal finalAdderIn1_bh4 :  std_logic_vector(13 downto 0);
signal finalAdderCin_bh4 :  std_logic;
signal finalAdderOut_bh4 :  std_logic_vector(13 downto 0);
signal CompressionResult4 :  std_logic_vector(16 downto 0);
attribute rom_extract: string;
attribute rom_style: string;
attribute rom_extract of SmallMultTableP3x3r6XuYu_F400_uid7: component is "yes";
attribute rom_style of SmallMultTableP3x3r6XuYu_F400_uid7: component is "distributed";
begin
   process(clk)
      begin
         if clk'event and clk = '1' then
            heap_bh4_w3_0_d1 <=  heap_bh4_w3_0;
            heap_bh4_w12_0_d1 <=  heap_bh4_w12_0;
            heap_bh4_w13_0_d1 <=  heap_bh4_w13_0;
            heap_bh4_w14_0_d1 <=  heap_bh4_w14_0;
            heap_bh4_w15_0_d1 <=  heap_bh4_w15_0;
            tempR_bh4_0_d1 <=  tempR_bh4_0;
            heap_bh4_w5_5_d1 <=  heap_bh4_w5_5;
            heap_bh4_w7_5_d1 <=  heap_bh4_w7_5;
            heap_bh4_w9_5_d1 <=  heap_bh4_w9_5;
            heap_bh4_w11_3_d1 <=  heap_bh4_w11_3;
            heap_bh4_w3_3_d1 <=  heap_bh4_w3_3;
            heap_bh4_w4_3_d1 <=  heap_bh4_w4_3;
            heap_bh4_w12_3_d1 <=  heap_bh4_w12_3;
            heap_bh4_w13_1_d1 <=  heap_bh4_w13_1;
            heap_bh4_w4_4_d1 <=  heap_bh4_w4_4;
            heap_bh4_w5_6_d1 <=  heap_bh4_w5_6;
            tempR_bh4_1_d1 <=  tempR_bh4_1;
            heap_bh4_w10_5_d1 <=  heap_bh4_w10_5;
            heap_bh4_w11_5_d1 <=  heap_bh4_w11_5;
            heap_bh4_w12_4_d1 <=  heap_bh4_w12_4;
            heap_bh4_w6_8_d1 <=  heap_bh4_w6_8;
            heap_bh4_w7_8_d1 <=  heap_bh4_w7_8;
            heap_bh4_w8_8_d1 <=  heap_bh4_w8_8;
            heap_bh4_w8_9_d1 <=  heap_bh4_w8_9;
            heap_bh4_w9_8_d1 <=  heap_bh4_w9_8;
            heap_bh4_w10_6_d1 <=  heap_bh4_w10_6;
         end if;
      end process;
   XX_m3 <= X ;
   YY_m3 <= Y ;
   -- code generated by IntMultiplier::buildHeapLogicOnly()
   -- buildheaplogiconly called for lsbX=0 lsbY=0 msbX=8 msbY=8
   Xp_m3b5 <= XX_m3(7 downto 0) & "0";
   Yp_m3b5 <= YY_m3(7 downto 0) & "0";
   x_m3b5_0 <= Xp_m3b5(2 downto 0);
   x_m3b5_1 <= Xp_m3b5(5 downto 3);
   x_m3b5_2 <= Xp_m3b5(8 downto 6);
   y_m3b5_0 <= Yp_m3b5(2 downto 0);
   y_m3b5_1 <= Yp_m3b5(5 downto 3);
   y_m3b5_2 <= Yp_m3b5(8 downto 6);
   ----------------Synchro barrier, entering cycle 0----------------
   -- Partial product row number 0
   Y0X0_5_m3 <= y_m3b5_0 & x_m3b5_0;
   PP_m3_5X0Y0_Tbl: SmallMultTableP3x3r6XuYu_F400_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X0_5_m3,
                 Y => PP5X0Y0_m3);
   -- Adding the relevant bits to the heap of bits
   heap_bh4_w0_0 <= PP5X0Y0_m3(2); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w1_0 <= PP5X0Y0_m3(3); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w2_0 <= PP5X0Y0_m3(4); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w3_0 <= PP5X0Y0_m3(5); -- cycle= 0 cp= 5.4816e-10

   Y0X1_5_m3 <= y_m3b5_0 & x_m3b5_1;
   PP_m3_5X1Y0_Tbl: SmallMultTableP3x3r6XuYu_F400_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X1_5_m3,
                 Y => PP5X1Y0_m3);
   -- Adding the relevant bits to the heap of bits
   heap_bh4_w2_1 <= PP5X1Y0_m3(1); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w3_1 <= PP5X1Y0_m3(2); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w4_0 <= PP5X1Y0_m3(3); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w5_0 <= PP5X1Y0_m3(4); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w6_0 <= PP5X1Y0_m3(5); -- cycle= 0 cp= 5.4816e-10

   Y0X2_5_m3 <= y_m3b5_0 & x_m3b5_2;
   PP_m3_5X2Y0_Tbl: SmallMultTableP3x3r6XuYu_F400_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y0X2_5_m3,
                 Y => PP5X2Y0_m3);
   -- Adding the relevant bits to the heap of bits
   heap_bh4_w5_1 <= PP5X2Y0_m3(1); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w6_1 <= PP5X2Y0_m3(2); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w7_0 <= PP5X2Y0_m3(3); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w8_0 <= PP5X2Y0_m3(4); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w9_0 <= PP5X2Y0_m3(5); -- cycle= 0 cp= 5.4816e-10

   -- Partial product row number 1
   Y1X0_5_m3 <= y_m3b5_1 & x_m3b5_0;
   PP_m3_5X0Y1_Tbl: SmallMultTableP3x3r6XuYu_F400_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X0_5_m3,
                 Y => PP5X0Y1_m3);
   -- Adding the relevant bits to the heap of bits
   heap_bh4_w2_2 <= PP5X0Y1_m3(1); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w3_2 <= PP5X0Y1_m3(2); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w4_1 <= PP5X0Y1_m3(3); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w5_2 <= PP5X0Y1_m3(4); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w6_2 <= PP5X0Y1_m3(5); -- cycle= 0 cp= 5.4816e-10

   Y1X1_5_m3 <= y_m3b5_1 & x_m3b5_1;
   PP_m3_5X1Y1_Tbl: SmallMultTableP3x3r6XuYu_F400_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X1_5_m3,
                 Y => PP5X1Y1_m3);
   -- Adding the relevant bits to the heap of bits
   heap_bh4_w4_2 <= PP5X1Y1_m3(0); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w5_3 <= PP5X1Y1_m3(1); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w6_3 <= PP5X1Y1_m3(2); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w7_1 <= PP5X1Y1_m3(3); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w8_1 <= PP5X1Y1_m3(4); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w9_1 <= PP5X1Y1_m3(5); -- cycle= 0 cp= 5.4816e-10

   Y1X2_5_m3 <= y_m3b5_1 & x_m3b5_2;
   PP_m3_5X2Y1_Tbl: SmallMultTableP3x3r6XuYu_F400_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y1X2_5_m3,
                 Y => PP5X2Y1_m3);
   -- Adding the relevant bits to the heap of bits
   heap_bh4_w7_2 <= PP5X2Y1_m3(0); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w8_2 <= PP5X2Y1_m3(1); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w9_2 <= PP5X2Y1_m3(2); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w10_0 <= PP5X2Y1_m3(3); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w11_0 <= PP5X2Y1_m3(4); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w12_0 <= PP5X2Y1_m3(5); -- cycle= 0 cp= 5.4816e-10

   -- Partial product row number 2
   Y2X0_5_m3 <= y_m3b5_2 & x_m3b5_0;
   PP_m3_5X0Y2_Tbl: SmallMultTableP3x3r6XuYu_F400_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X0_5_m3,
                 Y => PP5X0Y2_m3);
   -- Adding the relevant bits to the heap of bits
   heap_bh4_w5_4 <= PP5X0Y2_m3(1); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w6_4 <= PP5X0Y2_m3(2); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w7_3 <= PP5X0Y2_m3(3); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w8_3 <= PP5X0Y2_m3(4); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w9_3 <= PP5X0Y2_m3(5); -- cycle= 0 cp= 5.4816e-10

   Y2X1_5_m3 <= y_m3b5_2 & x_m3b5_1;
   PP_m3_5X1Y2_Tbl: SmallMultTableP3x3r6XuYu_F400_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X1_5_m3,
                 Y => PP5X1Y2_m3);
   -- Adding the relevant bits to the heap of bits
   heap_bh4_w7_4 <= PP5X1Y2_m3(0); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w8_4 <= PP5X1Y2_m3(1); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w9_4 <= PP5X1Y2_m3(2); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w10_1 <= PP5X1Y2_m3(3); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w11_1 <= PP5X1Y2_m3(4); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w12_1 <= PP5X1Y2_m3(5); -- cycle= 0 cp= 5.4816e-10

   Y2X2_5_m3 <= y_m3b5_2 & x_m3b5_2;
   PP_m3_5X2Y2_Tbl: SmallMultTableP3x3r6XuYu_F400_uid7  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 X => Y2X2_5_m3,
                 Y => PP5X2Y2_m3);
   -- Adding the relevant bits to the heap of bits
   heap_bh4_w10_2 <= PP5X2Y2_m3(0); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w11_2 <= PP5X2Y2_m3(1); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w12_2 <= PP5X2Y2_m3(2); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w13_0 <= PP5X2Y2_m3(3); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w14_0 <= PP5X2Y2_m3(4); -- cycle= 0 cp= 5.4816e-10
   heap_bh4_w15_0 <= PP5X2Y2_m3(5); -- cycle= 0 cp= 5.4816e-10

   
   -- Beginning of code generated by BitHeap::generateCompressorVHDL
   -- code generated by BitHeap::generateSupertileVHDL()
   ----------------Synchro barrier, entering cycle 0----------------

   -- Adding the constant bits
      -- All the constant bits are zero, nothing to add

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 0----------------
   tempR_bh4_0 <= heap_bh4_w1_0 & heap_bh4_w0_0; -- already compressed

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_0_0 <= heap_bh4_w5_4 & heap_bh4_w5_3 & heap_bh4_w5_2 & heap_bh4_w5_1;
   CompressorIn_bh4_0_1(0) <= heap_bh4_w6_4;
      Compressor_bh4_0: Compressor_14_3
      port map ( R => CompressorOut_bh4_0_0,
                 X0 => CompressorIn_bh4_0_0,
                 X1 => CompressorIn_bh4_0_1);
   heap_bh4_w5_5 <= CompressorOut_bh4_0_0(0); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w6_5 <= CompressorOut_bh4_0_0(1); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w7_5 <= CompressorOut_bh4_0_0(2); -- cycle= 0 cp= 1.07888e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_1_2 <= heap_bh4_w6_3 & heap_bh4_w6_2 & heap_bh4_w6_1 & heap_bh4_w6_0;
   CompressorIn_bh4_1_3(0) <= heap_bh4_w7_4;
      Compressor_bh4_1: Compressor_14_3
      port map ( R => CompressorOut_bh4_1_1,
                 X0 => CompressorIn_bh4_1_2,
                 X1 => CompressorIn_bh4_1_3);
   heap_bh4_w6_6 <= CompressorOut_bh4_1_1(0); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w7_6 <= CompressorOut_bh4_1_1(1); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w8_5 <= CompressorOut_bh4_1_1(2); -- cycle= 0 cp= 1.07888e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_2_4 <= heap_bh4_w7_3 & heap_bh4_w7_2 & heap_bh4_w7_1 & heap_bh4_w7_0;
   CompressorIn_bh4_2_5(0) <= heap_bh4_w8_4;
      Compressor_bh4_2: Compressor_14_3
      port map ( R => CompressorOut_bh4_2_2,
                 X0 => CompressorIn_bh4_2_4,
                 X1 => CompressorIn_bh4_2_5);
   heap_bh4_w7_7 <= CompressorOut_bh4_2_2(0); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w8_6 <= CompressorOut_bh4_2_2(1); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w9_5 <= CompressorOut_bh4_2_2(2); -- cycle= 0 cp= 1.07888e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_3_6 <= heap_bh4_w8_3 & heap_bh4_w8_2 & heap_bh4_w8_1 & heap_bh4_w8_0;
   CompressorIn_bh4_3_7(0) <= heap_bh4_w9_4;
      Compressor_bh4_3: Compressor_14_3
      port map ( R => CompressorOut_bh4_3_3,
                 X0 => CompressorIn_bh4_3_6,
                 X1 => CompressorIn_bh4_3_7);
   heap_bh4_w8_7 <= CompressorOut_bh4_3_3(0); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w9_6 <= CompressorOut_bh4_3_3(1); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w10_3 <= CompressorOut_bh4_3_3(2); -- cycle= 0 cp= 1.07888e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_4_8 <= heap_bh4_w9_3 & heap_bh4_w9_2 & heap_bh4_w9_1 & heap_bh4_w9_0;
   CompressorIn_bh4_4_9(0) <= heap_bh4_w10_2;
      Compressor_bh4_4: Compressor_14_3
      port map ( R => CompressorOut_bh4_4_4,
                 X0 => CompressorIn_bh4_4_8,
                 X1 => CompressorIn_bh4_4_9);
   heap_bh4_w9_7 <= CompressorOut_bh4_4_4(0); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w10_4 <= CompressorOut_bh4_4_4(1); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w11_3 <= CompressorOut_bh4_4_4(2); -- cycle= 0 cp= 1.07888e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_5_10 <= heap_bh4_w2_2 & heap_bh4_w2_1 & heap_bh4_w2_0;
   CompressorIn_bh4_5_11 <= heap_bh4_w3_2 & heap_bh4_w3_1;
      Compressor_bh4_5: Compressor_23_3
      port map ( R => CompressorOut_bh4_5_5,
                 X0 => CompressorIn_bh4_5_10,
                 X1 => CompressorIn_bh4_5_11);
   heap_bh4_w2_3 <= CompressorOut_bh4_5_5(0); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w3_3 <= CompressorOut_bh4_5_5(1); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w4_3 <= CompressorOut_bh4_5_5(2); -- cycle= 0 cp= 1.07888e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_6_12 <= heap_bh4_w11_2 & heap_bh4_w11_1 & heap_bh4_w11_0;
   CompressorIn_bh4_6_13 <= heap_bh4_w12_2 & heap_bh4_w12_1;
      Compressor_bh4_6: Compressor_23_3
      port map ( R => CompressorOut_bh4_6_6,
                 X0 => CompressorIn_bh4_6_12,
                 X1 => CompressorIn_bh4_6_13);
   heap_bh4_w11_4 <= CompressorOut_bh4_6_6(0); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w12_3 <= CompressorOut_bh4_6_6(1); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w13_1 <= CompressorOut_bh4_6_6(2); -- cycle= 0 cp= 1.07888e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_7_14 <= heap_bh4_w4_2 & heap_bh4_w4_1 & heap_bh4_w4_0;
   CompressorIn_bh4_7_15(0) <= heap_bh4_w5_0;
      Compressor_bh4_7: Compressor_13_3
      port map ( R => CompressorOut_bh4_7_7,
                 X0 => CompressorIn_bh4_7_14,
                 X1 => CompressorIn_bh4_7_15);
   heap_bh4_w4_4 <= CompressorOut_bh4_7_7(0); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w5_6 <= CompressorOut_bh4_7_7(1); -- cycle= 0 cp= 1.07888e-09
   heap_bh4_w6_7 <= CompressorOut_bh4_7_7(2); -- cycle= 0 cp= 1.07888e-09
   ----------------Synchro barrier, entering cycle 0----------------
   tempR_bh4_1 <= heap_bh4_w2_3; -- already compressed

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_8_16 <= heap_bh4_w10_1 & heap_bh4_w10_0 & heap_bh4_w10_4 & heap_bh4_w10_3;
   CompressorIn_bh4_8_17(0) <= heap_bh4_w11_4;
      Compressor_bh4_8: Compressor_14_3
      port map ( R => CompressorOut_bh4_8_8,
                 X0 => CompressorIn_bh4_8_16,
                 X1 => CompressorIn_bh4_8_17);
   heap_bh4_w10_5 <= CompressorOut_bh4_8_8(0); -- cycle= 0 cp= 1.6096e-09
   heap_bh4_w11_5 <= CompressorOut_bh4_8_8(1); -- cycle= 0 cp= 1.6096e-09
   heap_bh4_w12_4 <= CompressorOut_bh4_8_8(2); -- cycle= 0 cp= 1.6096e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_9_18 <= heap_bh4_w6_7 & heap_bh4_w6_6 & heap_bh4_w6_5;
   CompressorIn_bh4_9_19 <= heap_bh4_w7_7 & heap_bh4_w7_6;
      Compressor_bh4_9: Compressor_23_3
      port map ( R => CompressorOut_bh4_9_9,
                 X0 => CompressorIn_bh4_9_18,
                 X1 => CompressorIn_bh4_9_19);
   heap_bh4_w6_8 <= CompressorOut_bh4_9_9(0); -- cycle= 0 cp= 1.6096e-09
   heap_bh4_w7_8 <= CompressorOut_bh4_9_9(1); -- cycle= 0 cp= 1.6096e-09
   heap_bh4_w8_8 <= CompressorOut_bh4_9_9(2); -- cycle= 0 cp= 1.6096e-09

   ----------------Synchro barrier, entering cycle 0----------------
   CompressorIn_bh4_10_20 <= heap_bh4_w8_7 & heap_bh4_w8_6 & heap_bh4_w8_5;
   CompressorIn_bh4_10_21 <= heap_bh4_w9_7 & heap_bh4_w9_6;
      Compressor_bh4_10: Compressor_23_3
      port map ( R => CompressorOut_bh4_10_10,
                 X0 => CompressorIn_bh4_10_20,
                 X1 => CompressorIn_bh4_10_21);
   heap_bh4_w8_9 <= CompressorOut_bh4_10_10(0); -- cycle= 0 cp= 1.6096e-09
   heap_bh4_w9_8 <= CompressorOut_bh4_10_10(1); -- cycle= 0 cp= 1.6096e-09
   heap_bh4_w10_6 <= CompressorOut_bh4_10_10(2); -- cycle= 0 cp= 1.6096e-09

   ----------------Synchro barrier, entering cycle 0----------------
   ----------------Synchro barrier, entering cycle 1----------------
   CompressorIn_bh4_11_22 <= heap_bh4_w12_0_d1 & heap_bh4_w12_3_d1 & heap_bh4_w12_4_d1;
   CompressorIn_bh4_11_23 <= heap_bh4_w13_0_d1 & heap_bh4_w13_1_d1;
      Compressor_bh4_11: Compressor_23_3
      port map ( R => CompressorOut_bh4_11_11,
                 X0 => CompressorIn_bh4_11_22,
                 X1 => CompressorIn_bh4_11_23);
   heap_bh4_w12_5 <= CompressorOut_bh4_11_11(0); -- cycle= 1 cp= 0
   heap_bh4_w13_2 <= CompressorOut_bh4_11_11(1); -- cycle= 1 cp= 0
   heap_bh4_w14_1 <= CompressorOut_bh4_11_11(2); -- cycle= 1 cp= 0
   ----------------Synchro barrier, entering cycle 1----------------
   finalAdderIn0_bh4 <= "0" & heap_bh4_w15_0_d1 & heap_bh4_w14_0_d1 & heap_bh4_w13_2 & heap_bh4_w12_5 & heap_bh4_w11_3_d1 & heap_bh4_w10_6_d1 & heap_bh4_w9_5_d1 & heap_bh4_w8_9_d1 & heap_bh4_w7_5_d1 & heap_bh4_w6_8_d1 & heap_bh4_w5_6_d1 & heap_bh4_w4_4_d1 & heap_bh4_w3_0_d1;
   finalAdderIn1_bh4 <= "0" & '0' & heap_bh4_w14_1 & '0' & '0' & heap_bh4_w11_5_d1 & heap_bh4_w10_5_d1 & heap_bh4_w9_8_d1 & heap_bh4_w8_8_d1 & heap_bh4_w7_8_d1 & '0' & heap_bh4_w5_5_d1 & heap_bh4_w4_3_d1 & heap_bh4_w3_3_d1;
   finalAdderCin_bh4 <= '0';
      Adder_final4_0: IntAdder_14_f400_uid58  -- pipelineDepth=0 maxInDelay=0
      port map ( clk  => clk,
                 rst  => rst,
                 Cin => finalAdderCin_bh4,
                 R => finalAdderOut_bh4,
                 X => finalAdderIn0_bh4,
                 Y => finalAdderIn1_bh4);
   -- concatenate all the compressed chunks
   CompressionResult4 <= finalAdderOut_bh4 & tempR_bh4_1_d1 & tempR_bh4_0_d1;
   -- End of code generated by BitHeap::generateCompressorVHDL
   R <= CompressionResult4(15 downto 0);
end architecture;

