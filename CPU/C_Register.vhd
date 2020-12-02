library ieee;
use ieee.std_logic_1164.all;

entity  C_Register is
port(
	a : in std_logic;
	clk : in std_logic;
	C : out std_logic);
end C_Register;

architecture str of C_Register is
signal Q : std_logic := '0';
begin
	process(clk)
	begin
		if(clk'event and clk='1')then
			Q <= a;
		end if;
	end process;
	C <= Q;
end str;