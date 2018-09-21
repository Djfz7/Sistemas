library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity CKTON_LB1 is
	Port(clk,NA:in std_logic;
			segA,segB:out std_logic_vector(6 downto 0));
	
end CKTON_LB1;

architecture klun of CKTON_LB1 is
signal interno:std_logic_vector(4 downto 0);

component CONT_DASTUDENT
	Port(clk,NA:in std_logic;
			S:out std_logic_vector(4 downto 0));
end component;

component DEC_NYA
	Port(W:in std_logic_vector(4 downto 0);
			D1,D2:out std_logic_vector(6 downto 0));
end component;
begin
	u1:CONT_DASTUDENT PORT MAP(clk,NA,interno);
	u2:DEC_NYA PORT MAP(interno,segA,segB);
end klun;

