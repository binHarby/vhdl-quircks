VLIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

Entity segmentDisplayDriver IS
PORT (
		 megaClk : IN std_logic;
		 count: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
		 seg1,seg2	: out std_logic_vector(6 downto 0)
		 
		 );
END segmentDisplayDriver;




ARCHITECTURE behavior OF segmentDisplayDriver IS

Signal digit1_tmp: std_logic_vector (3 downto 0);
Signal digit2_tmp: std_logic_vector (3 downto 0);
signal clock_word : std_logic_vector (15 downto 0);
signal slow_clock : std_logic;

component bcdTo7segConverter    -- integer to seven seg
	port(
		        m: in std_logic_vector (3 downto 0);
			  num: out std_logic_vector(6 downto 0)
			  );
end component;
component clockdivider is

	port
	(
		clk		  : in std_logic;
		enable	  : in std_logic;
		reset	  : in std_logic;
		dataclk	  : out std_logic_vector (15 downto 0)
	);

end component;


BEGIN
uu1: clockdivider  port map
	(
		clk => megaClk,
		enable	  => '1',
		reset	  => '0',
		dataclk	  => clock_word
		
	);
slow_clock <= clock_word(15);
zz0: bcdTo7segConverter port map(digit1_tmp,seg1);
zz1: bcdTo7segConverter port map(digit2_tmp,seg2);

process(slow_clock,count,digit1_tmp,digit2_tmp)
begin
if slow_clock = '1' and slow_clock'event then 
 case count is 
  WHEN "00000" | "01010" | "10100" | "11110" => digit1_tmp<="0000";
  WHEN "00001" | "01011" | "10101" | "11111" => digit1_tmp<="0001";
  WHEN "00010" | "01100" | "10110" => digit1_tmp<="0010";
  WHEN "00011" | "01101" | "10111" => digit1_tmp<="0011";
  WHEN "00100" | "01110" | "11000" => digit1_tmp<="0100";
  WHEN "00101" | "01111" | "11001" => digit1_tmp<="0101";
  WHEN "00110" | "10000" | "11010" => digit1_tmp<="0110";
  WHEN "00111" | "10001" | "11011" => digit1_tmp<="0111";
  WHEN "01000" | "10010" | "11100" => digit1_tmp<="1000";
  WHEN "01001" | "10011" | "11101" => digit1_tmp<="1001";
  WHEN OTHERS => digit1_tmp<="1111";
  end case;
  case count is 
  WHEN "00000"|"00001"|"00010"|"00011"|"00100"|"00101"|"00110"|"00111" => digit2_tmp<="0000";
  WHEN "01010" | "01011"| "01100"| "01101" | "01110" |"01111" | "10000"| "10001"|"10010" | "10011" => digit2_tmp<="0001";
  WHEN "10100" | "10101"  | "10110"| "10111"|"11000" | "11001"| "11010" | "11011"|"11100" | "11101" => digit2_tmp<="0010";
  WHEN "11110"|"11111" => digit2_tmp<="0011";
  WHEN OTHERS => digit2_tmp<="1111";
  
  end case;
 end if;

end process;
	
	
END behavior;
