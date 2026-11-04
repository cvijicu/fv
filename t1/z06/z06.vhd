library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity z06 is
	port (
		clk: in std_logic;
		rst: in std_logic;
		temp_hi: out std_logic;
		alarm: out std_logic
	);
end entity z06;

architecture rtl of z06 is
	signal cnt : std_logic_vector(3 downto 0) := "0000";
begin
	process (clk) is
	begin
		if (rising_edge(clk)) then
			if (rst = '1') then
				cnt <= "0000";
			else
				cnt <= std_logic_vector(unsigned(cnt) + 1);
			end if;		
		end if;
	end process;
	
	with cnt select
		temp_hi <= '1' when "0010" | "0011" | "0111" | "1000" | "1001",
		           '0' when others;
		        
	with cnt select
		alarm <= '1' when "0100" | "0101" | "1000" | "1001" | "1010",
		         '0' when others;
		      
end architecture rtl;
