LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;
ENTITY reportCode IS
port(
  a       : in std_logic;
  b       : in std_logic;
  c      : out std_logic);

END reportCode;
ARCHITECTURE logic OF reportCode IS

BEGIN
	-- a process is like a separate thread
	-- code inside it is excuted sequentially, unlike other blocks
	--like a normal programming languaage
	



	--NOTE: this message will not show
	--unless you add the --debug flag 
	PROCESS
	BEGIN
		

		REPORT "Hello VHDL";
		wait until b='1';
		--using a :
		-- unconditional wait like
		-- wait;
		-- or a wait for like
		-- wait for 10 ns;
		-- can't be synthizised , and thus is not valid code for a hardware connection, but maybe for a simulation


		-- for a real time delay, consider a delay generator, where you use delay cycle= #OfSeconds/ClockPeriod, where clock period is of course 1/Clockfrequency
		c<=a and b;
		
	
	END PROCESS;
END logic;

