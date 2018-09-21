
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 

ENTITY TestBench_CKTON_LB1 IS
END TestBench_CKTON_LB1;
 
ARCHITECTURE behavior OF TestBench_CKTON_LB1 IS 
 

    COMPONENT CKTON_LB1
    PORT(
         clk : IN  std_logic;
         NA : IN  std_logic;
         segA : OUT  std_logic_vector(6 downto 0);
         segB : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal NA : std_logic := '0';

 	--Outputs
   signal segA : std_logic_vector(6 downto 0);
   signal segB : std_logic_vector(6 downto 0);

   -- Clock period definitions
   constant clk_period : time := 20 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: CKTON_LB1 PORT MAP (
          clk => clk,
          NA => NA,
          segA => segA,
          segB => segB
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      NA<=  '1' after 0 ns, '0' after 300 ns;

      wait;
   end process;

END;
