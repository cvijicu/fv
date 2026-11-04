library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity z04 is
	port (
		clk: in std_logic;
		rst: in std_logic;
		cfg_en: out std_logic;
		mode: out std_logic_vector(1 downto 0)
	);
end entity z04;

architecture rtl of z04 is
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
		cfg_en <= '1' when "0000" | "0010" | "0100" | "0111",
		          '0' when others;

	mode <= "00" when cnt < "0010" else
        	"01" when cnt < "0111" else
        	"10";

end architecture rtl;
