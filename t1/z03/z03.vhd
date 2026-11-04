library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity z03 is
	port (
		clk: in std_logic;
		rst: in std_logic;
		cs: out std_logic;
		rd: out std_logic;
		wr: out std_logic
	);
end entity z03;

architecture rtl of z03 is
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
		cs <= '1' when "0001" | "0010" | "0011" | "0100" | "0111" | "1000" | "1001" | "1010",
		      '0' when others;

	with cnt select		
		rd <= '1' when "0010" | "0011" | "1000",
		      '0' when others;

	with cnt select		
		wr <= '1' when "0100" | "1001",
		      '0' when others;

end architecture rtl;
