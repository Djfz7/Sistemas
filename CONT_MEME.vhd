library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity CONT_MEME is
	PORT(clock, UD: in std_logic;
			P: out std_logic_vector(5 downto 0));
end CONT_MEME;

architecture momo of CONT_MEME is
signal cuenta: std_logic_vector(5 downto 0):="000000";
begin
		process(clock, UD)
		begin
				if rising_edge(clock) then
					if UD = '0'	then
						if cuenta = "001010" then
							cuenta<= "000000";
						else 
							cuenta<= cuenta+1;
						end if;
					else 
						if cuenta = "000000" then
								cuenta<= "001010";
						else 
								cuenta<= cuenta-1;
						end if;
					end if;
				end if;
		end process;
		P<=cuenta;
end momo;

