library ieee;
use ieee.std_logic_1164.all;

entity half_adder is
port (
	x,y : in std_logic;
	s,c : out std_logic);
end half_adder;

architecture str1 of half_adder is
begin
	s <= x xor y;
	c <= x and y;
end str1;

library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
port(
	x,y,z : in std_logic;
	s,c : out std_logic);
end full_adder;

architecture str2 of full_adder is
	component half_adder
		port (
			x,y : in std_logic;
			s,c : out std_logic);
	end component;
	signal hs, hc, tc : std_logic;
begin
	HA1 : half_adder
		port map (x, y, hs, hc);
	HA2 : half_adder
		port map (hs, z, s, tc);
	c <=tc or hc;
end str2;
		