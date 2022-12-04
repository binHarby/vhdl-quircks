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
		c<=a and b;
		
	
	END PROCESS;
END logic;

