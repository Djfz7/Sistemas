library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity DECO_NOMBRE is
	port(W:IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			K:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
end DECO_NOMBRE;

architecture nonvre of DECO_NOMBRE is

begin
	
	with W select
		K<="0100001" when "000000",
					"0001000" when "000001",
					"0101011" when "000010",
					"1111111" when "000011",
					"0001110" when "000100",
					"0001000" when "000101",
					"1000111" when "000110",
					"0000110" when "000111",
					"0101111" when "001000",
					"1000000" when "001001",
					"1111111" when "001010",
					"ZZZZZZZ" when others;

end nonvre;

