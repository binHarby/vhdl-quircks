-- this code is for generating a real time delay on a vhdl system.
-- when using a clock, we can't simply issue 'wait' statment in vhdl.

--thus a real-time delay is requried at times, and that is why delay genertaor is useful
-- a delay_cycle= seconds_of_delay/clock_period , where clock_peroid=1/clock_frequency
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
entity delayGenerator is
	port( clk,reset : in std_logic;
	delay_cycles : in unsigned(31 downto 0);
	flag : out std_logic
	);
end delayGenerator;



architecture logicWalk of delayGenerator is 
signal count : unsigned(31 downto 0) := (others=>'0');
begin 
process(clk, reset)
--sequential part start
begin
	--check if reset is high (active high logic)
	if(reset = '1') then 
		flag <= '0';
		count <= (others => '0');
	elsif (rising_edge(clk)) then 
		--if count at max, reset count and raise flag indicating delay completion for the next delta cycle.
		if(count = delay_cycles-1) then
			count<=(others =>'0');
			flag <= '1';
		else
		-- otherwise, on each cycle increment count and set flag to 0
			flag <='0';
			count<= count +1;
		end if;
	end if;

--sequential part end
end process;

end logicWalk;


