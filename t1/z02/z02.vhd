library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity z02 is
	port (
		clk: in std_logic;
		rst: in std_logic;
		req: out std_logic;
		ack: out std_logic
	);
end entity z02;

architecture rtl of z02 is
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
		req <= '1' when "0010" | "0110" | "0111",
		       '0' when others;
		      
	with cnt select
		ack <= '1' when "0011" | "0110",
		       '0' when others;

end architecture rtl;
