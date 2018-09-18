library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity SISDIG_LB1 is
	port(clk, UD: in std_logic;
			K: out std_logic_vector(6 downto 0));
end SISDIG_LB1;

architecture cubito of SISDIG_LB1 is
signal conta:std_logic_vector(5 downto 0);

component CONT_MEME
	PORT(clock, UD: in std_logic;
			P: out std_logic_vector(5 downto 0));
end component;

component DECO_NOMBRE
	port(W:IN STD_LOGIC_VECTOR(5 DOWNTO 0);
			K:OUT STD_LOGIC_VECTOR(6 DOWNTO 0));
end component;

begin
		u1: CONT_MEME PORT MAP (clock=>clk, UD=>UD, P=> conta);
		u2: DECO_NOMBRE PORT MAP (W=>conta, K=>K);
		
end cubito;

