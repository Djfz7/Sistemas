library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DEC_NYA is
	Port(W:in std_logic_vector(4 downto 0);
			D1,D2:out std_logic_vector(6 downto 0));
end DEC_NYA;

architecture rayoscosmicos of DEC_NYA is
begin
	with W select
		D1<="0000000" when "00000",
				"0000000" when "00001", 
				"1011110" when "00010",
				"1110111" when "00011",
				"1010100" when "00100",
				"0000000" when "00101",
				"1110001" when "00110",
				"1110111" when "00111",
				"1111100" when "01000",
				"0110000" when "01001",
				"0111111" when "01010",
				"0000000" when "01011",
				"0000000" when "01100",
				"1110001" when "01101",
				"1110111" when "01110",
				"0111000" when "01111",
				"1111001" when "10000",
				"1010000" when "10001",
				"0111111" when "10010",
				"0000000" when "10011",
				"1101101" when "10100",
				"0111111" when "10101",
				"1010000" when "10110",
				"0110000" when "10111",
				"1110111" when "11000",
				"ZZZZZZZ" when others;
	
	with W select		
		D2<="0000000" when "00000",
				"1011110" when "00001",
				"1110111" when "00010",
				"1010100" when "00011",
				"0000000" when "00100",
				"1110001" when "00101",
				"1110111" when "00110",
				"1111100" when "00111",
				"0110000" when "01000",
				"0111111" when "01001",
				"0000000" when "01010",
				"0000000" when "01011",
				"1110001" when "01100",
				"1110111" when "01101",
				"0111000" when "01110",
				"1111001" when "01111",
				"1010000" when "10000",
				"0111111" when "10001",
				"0000000" when "10010",
				"1101101" when "10011",
				"0111111" when "10100",
				"1010000" when "10101",
				"0110000" when "10110",
				"1110111" when "10111",
				"0000000" when "11000",
				"ZZZZZZZ" when others;

end rayoscosmicos;

