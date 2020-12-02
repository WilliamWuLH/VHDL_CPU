library ieee;
use ieee.std_logic_1164.all;
entity trigger is
port(
	D, EN, C : in std_logic;
	Q : out std_logic);
end trigger;

architecture str of trigger is 
begin
process (C, EN)
	begin
		if (EN = '0') then
			Q <= 'Z';
		elsif (C'event and C = '0') then
			Q <= D;
		end if;
	end process;
end;

library ieee;
use ieee.std_logic_1164.all;

entity  Register_8 is
port(
	a : in std_logic_vector(7 downto 0);
	ld : in std_logic;
	clk : in std_logic;
	x : out std_logic_vector(7 downto 0));
end Register_8;

architecture str of Register_8 is
	component trigger is
	port(
		D, EN, C : in std_logic;
		Q : out std_logic);
	end component;
	begin
		FA1	: trigger
		port map (A(0), ld, clk, x(0));
		FA2	: trigger
		port map (A(1), ld, clk, x(1));
		FA3	: trigger
		port map (A(2), ld, clk, x(2));
		FA4	: trigger
		port map (A(3), ld, clk, x(3));
		FA5	: trigger
		port map (A(4), ld, clk, x(4));
		FA6	: trigger
		port map (A(5), ld, clk, x(5));
		FA7	: trigger
		port map (A(6), ld, clk, x(6));
		FA8	: trigger
		port map (A(7), ld, clk, x(7));
end str;