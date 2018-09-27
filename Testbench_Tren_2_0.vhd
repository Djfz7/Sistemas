--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:52:04 09/26/2018
-- Design Name:   
-- Module Name:   C:/Users/djfz7/VHDL Proyects/Tren_2_0/Testbench_Tren_2_0.vhd
-- Project Name:  Tren_2_0
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Maq_Sta
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Testbench_Tren_2_0 IS
END Testbench_Tren_2_0;
 
ARCHITECTURE behavior OF Testbench_Tren_2_0 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Maq_Sta
    PORT(
         S1 : IN  std_logic;
         S2 : IN  std_logic;
         S3 : IN  std_logic;
         Sem : OUT  std_logic;
         Des : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal S1 : std_logic := '0';
   signal S2 : std_logic := '0';
   signal S3 : std_logic := '0';

 	--Outputs
   signal Sem : std_logic;
   signal Des : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Maq_Sta PORT MAP (
          S1 => S1,
          S2 => S2,
          S3 => S3,
          Sem => Sem,
          Des => Des
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
		S1<= '1' after 40 ns, '0' after 80 ns, '1' after 160 ns;
		S2<= '1' after 60 ns, '0' after 100 ns; 
		S3<= '1' after 20 ns, '0' after 40 ns, '1' after 120 ns, '0' after 140 ns, '1' after 160 ns;

      wait;
   end process;

END;
