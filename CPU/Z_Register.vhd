library ieee;
use ieee.std_logic_1164.all;

entity  Z_Register is
port(
	a : in std_logic;
	clk : in std_logic;
	Z : out std_logic);
end Z_Register;

architecture str of Z_Register is
signal Q : std_logic := '0';
begin
	process(clk)
	begin
		if(clk'event and clk='1')then
			Q <= a;
		end if;
	end process;
	Z <= Q;
end str;