library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity z09 is
	port (
		clk: in std_logic;
		rst: in std_logic;
		ping: out std_logic;
		pong: out std_logic
	);
end entity z09;

architecture rtl of z09 is
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
		ping <= '1' when "0010" | "0110",
		        '0' when others;
		        
	with cnt select
		pong <= '1' when "0011" | "1001",
		        '0' when others;

end architecture rtl;
