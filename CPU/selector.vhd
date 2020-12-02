library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity selector is
port (
	MADD : in std_logic_vector(1 downto 0);
	S0,S1,S2 : in std_logic_vector(7 downto 0);
	COUT : out std_logic_vector(7 downto 0));
end selector;

architecture beh of selector is
begin
process (MADD)
begin
	if (MADD = "00") then
		COUT <= S0;
	elsif (MADD = "01") then
		COUT <= S1;
	elsif (MADD = "10") then
		COUT <= S2;
	end if;
end process;
end beh;