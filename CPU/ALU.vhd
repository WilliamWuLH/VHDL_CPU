library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity ALU is
port(
	M : in std_logic;
	S : in std_logic_vector(3 downto 0);	
	A,B : in std_logic_vector(7 downto 0);
	C,Z : out std_logic;
	COUT : out std_logic_vector(7 downto 0));
end ALU;

architecture str of ALU is
component parallel_adder_vhdl is
	port(
		A,B : in std_logic_vector(7 downto 0);
		C0 : in std_logic;
		S : out std_logic_vector(7 downto 0);
		C8 : out std_logic);
	end component;
signal sum,add,sub,subf : std_logic_vector (7 downto 0);
signal Ca,Cs,Cf : std_logic;
begin
	process(M,S)
	begin
	if(M = '1') then
		if (S = "1001") then
			sum <= add;
			C <= Ca;
		elsif (S = "0110") then
			sum <= subf;
			C <= Cs;
		elsif (S = "1011") then
			sum <= A or B;
			C <= '0';
		elsif (S = "0101") then
			sum <= not A;
			C <= '0';
		end if;
	else
		sum <= A;
		C <= '0';
	end if;
	end process;
	process(sum)
	begin
	if (sum = "00000000") then
		Z <= '1';
	else
		Z <= '0';
	end if;
	end process;
	A1 : parallel_adder_vhdl
	port map (A, B, '0', add, Ca);
	A2 : parallel_adder_vhdl
	port map (A, B, '1', sub, Cs);
	A3 : parallel_adder_vhdl
	port map ("00000000", sub, '1', subf, Cf);
	COUT <= sum;
end str;