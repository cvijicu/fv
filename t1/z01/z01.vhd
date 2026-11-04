library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity z01 is
	port (
		clk: in std_logic;
		rst: in std_logic;
		full: out std_logic;
		push: out std_logic;
		ovf: out std_logic
	);
end entity z01;

architecture rtl of z01 is
	signal cnt: std_logic_vector(3 downto 0) := "0000";
begin
	process(clk) is
	begin
		if(rising_edge(clk)) then
			if (rst = '1') then
				cnt <= "0000";
			else
				cnt <= std_logic_vector(unsigned(cnt) + 1);
			end if;
		end if;
	end process;
	
	with cnt select
		full <= '1' when "0100" | "0101" | "0110" | "0111" | "1000" | "1001",
		        '0' when others;

	with cnt select
		push <= '1' when "0010" | "0101" | "1001",
		        '0' when others;

	with cnt select
		ovf <= '1' when "0110",
		       '0' when others;
		       
end architecture rtl;
