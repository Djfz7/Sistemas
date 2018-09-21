library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CONT_DASTUDENT is
	Port(clk,NA:in std_logic;
			S:out std_logic_vector(4 downto 0));
end CONT_DASTUDENT;

architecture THEFAVOURITE of CONT_DASTUDENT is
signal cuenta:std_logic_vector(4 downto 0):="00000";
begin
	process(clk,NA)
	begin
		if rising_edge(clk) then
			if NA = '1' then
				if cuenta <= "1010" then
					cuenta<="01011";
				elsif cuenta = "11000" then
					cuenta<= "01011";
				else
					cuenta<= cuenta+1;
				
				end if;
			else
				if cuenta >= "1011" then
					cuenta<= "00000";
				elsif cuenta = "01010" then
					cuenta<= "00000";
				else
					cuenta<= cuenta+1;
				end if;
			end if;
		end if;
	end process;
	S<=cuenta;
end THEFAVOURITE;

