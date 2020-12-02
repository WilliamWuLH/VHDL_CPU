library ieee;
use ieee.std_logic_1164.all;

entity  order_register is
port(
	a : in std_logic_vector(7 downto 0);
	LD_IR : in std_logic;
	HALT : in std_logic;
	clk : in std_logic;
	x : out std_logic_vector(7 downto 0));
end order_register;

architecture str of order_register is
signal Q : std_logic_vector(7 downto 0) := "00000000";
begin
	process(LD_IR,clk,HALT)
	begin
		if(HALT = '1')then
			Q <= "ZZZZZZZZ";
		elsif(clk'event and clk='0')then
			if(LD_IR='1')then
				Q <= a;
			end if;
		end if;
	end process;
	x <= Q;
end str;