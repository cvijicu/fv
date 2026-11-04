library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity z08 is
	port (
		clk: in std_logic;
		rst: in std_logic;
		tx: out std_logic;
		rx: out std_logic
	);
end entity z08;

architecture rtl of z08 is
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
		tx <= '1' when "0011" | "0101" | "0110" | "1010",
		      '0' when others;
		        
	with cnt select
		rx <= '1' when "0100" | "1000" | "1011",
	              '0' when others;
		        
end architecture rtl;
