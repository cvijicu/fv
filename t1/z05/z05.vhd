library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity z05 is
	port (
		clk: in std_logic;
		rst: in std_logic;
		load: out std_logic;
		busy: out std_logic;
		done: out std_logic
	);
end entity z05;

architecture rtl of z05 is
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
		load <= '1' when "0001" | "0111",
		        '0' when others;
	
	with cnt select
		busy <= '1' when "0010" | "0011" | "1001",
		        '0' when others;
		      
	with cnt select
		done <= '1' when "0100" | "1010",
		        '0' when others;

end architecture rtl;
