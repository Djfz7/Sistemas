library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity MakSta is
	port(S1,S2:in std_logic;
			M,R:out std_logic);
end MakSta;

architecture Friday of MakSta is
type State_type is (W0,W1,W2,We);
signal state, next_state: State_Type:=W0;
signal IronMan:std_logic:='0';
signal Pepper:std_logic:='1';

begin
	Next_State_Decode:Process(state,S1,S2)
	begin
	next_state<=state;
	
		case(state) is
			when W0 =>
				if S1='1' and S2='0' then
					next_state<=W1;
				elsif S1='0' and S2='0' then
					next_state<=W0;
				else
					next_state<=We;
				end if;
				IronMan<='0';
				Pepper<='1';
			
			when W1 =>
				if S1='1' and S2='1' then
					next_state<=W2;
				elsif S1='1' and S2='0' then
					next_state<=W1;
				else
					next_state<=We;
				end if;
				IronMan<='0';
				Pepper<='0';
			
			when W2 =>
				if S1='0' and S2='0' then
					next_state<=W0;
				elsif S1='0' and S2='1' then
					next_state<=W2;
				elsif S1='1' and S2='1' then
					next_state<=W2;				
				else
					next_state<=We;
				end if;
				IronMan<='1';
				Pepper<='0';

			when We =>
				IronMan<='1';
				Pepper<='1';
				
			when others =>
				next_state<=We;
				
		end case;
	end process;
	state<=next_state;
	M<=IronMan;
	R<=Pepper;
end Friday;