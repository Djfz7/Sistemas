
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use iEEE.std_logic_unsigned.all;

entity Maq_Sta is
	Port(S1,S2,S3:in std_logic;
			Sem,Des:out std_logic);
end Maq_Sta;

architecture Mattitos of Maq_Sta is
type State_type is (K0,K1,K2,KE);
signal sta,n_sta: State_Type:=K0;
signal da:std_logic:='0';
signal tichaaa:std_logic:='1';

begin
	process(sta,S1,S2,S3)
	begin
		n_sta<=sta;
		case(sta) is
			when K0=>
				if S1='1' and S2='0' and S3='0' then
					n_sta<=K1;
				elsif S1='0' and S2='0' and S3='0' then
					n_sta<=K0;
				elsif S1='0' and S2='0' and S3='1' then
					n_sta<=K0;
				else
					n_sta<=KE;
				end if;
				da<='0';
				tichaaa<='1';
			
			when K1=>
				if S1='1' and S2='1' and S3='0' then
					n_sta<=K2;
				elsif S1='1' and S2='0' and S3='0' then
					n_sta<=K1;
				else
					n_sta<=KE;
				end if;
				da<='0';
				tichaaa<='0';
			
			when K2=>
				if S1='0' and S2='0' and S3='1' then
					n_sta<=K0;
				elsif S1='1' and S2='1' and S3='0' then
					n_sta<=K2;
				elsif S1='0' and S2='1' and S3='0' then
					n_sta<=K2;
				elsif S1='0' and S2='0' and S3='0' then
					n_sta<=K2;
				else
					n_sta<=KE;
				end if;
				da<='1';
				tichaaa<='0';
			
			when KE=>
				da<='1';
				tichaaa<='1';
		
		end case;
	end process;
	Des<=da;
	Sem<=tichaaa;
	sta<=n_sta;
			
end Mattitos;

