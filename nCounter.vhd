-- Quartus II VHDL Template
-- Binary Counter

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;


entity nCounter is

	generic
	(
		MAX_COUNT : Positive := 10
	);

	port
	(
		clk		  : in std_logic;
		enable	  : in std_logic;
		reset	  : in std_logic;
		countOutput: out std_logic_vector (MAX_COUNT -1 downto 0)
	);

end entity;

architecture logicWalk of nCounter is
	signal	counter : std_logic_vector (MAX_COUNT -1 downto 0);
begin
--squential code start
	process (clk,reset) -- a senstivity list, need or a wait until statment
	begin
			if reset = '0' then
				--reset value on reset low (active low reset)
				counter <= (others=>'0');
			elsif clk'event and clk='1' then 
				--on a risingedge, check if enable is high
				if enable = '1' then
				-- Increment the counter if counting is enabled			   
					counter <= counter + 1;
				end if;
			end if;

		-- Output the current count
	end process;
--squential code end
	--NOTE: can't update an output pin directly, thus a use of an intermediate signal is perfered to keep track of the actual signal change, then it is copied to output 
	q <= counter;
end logicWalk;
 
