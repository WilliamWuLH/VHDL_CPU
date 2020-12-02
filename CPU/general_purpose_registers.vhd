library ieee;
use ieee.std_logic_1164.all;

entity general_purpose_registers is
port(
	RAA : in std_logic_vector(1 downto 0);
	RWBA : in std_logic_vector(1 downto 0);
	I : in std_logic_vector(7 downto 0);
	WE : in std_logic;
	clk : in std_logic;
	AO : out std_logic_vector(7 downto 0);
	BO : out std_logic_vector(7 downto 0);
	OA : out std_logic_vector(7 downto 0);
	OB : out std_logic_vector(7 downto 0);
	OC : out std_logic_vector(7 downto 0));
end general_purpose_registers;

architecture str of general_purpose_registers is
	signal A : std_logic_vector(7 downto 0) := "10000000";
	signal B : std_logic_vector(7 downto 0) := "11000001";
	signal C : std_logic_vector(7 downto 0) := "10001001";
	begin
	process(clk,WE,A,B,C)
	begin
		if(clk'event and clk = '0')then
			if(WE = '0') then
				if(RWBA = "00")then
					A <= I;
				elsif(RWBA = "01")then
					B <= I;
				elsif(RWBA = "10")then
					C <= I;
				end if;
			end if;
		end if;
	end process;
	AO <= A when RAA = "00" else
			B when RAA = "01" else
			C when RAA = "10" or RAA = "11";
	BO <= A when RWBA = "00" else
			B when RWBA = "01" else
			C when RWBA = "10" or RWBA = "11";
	OA <= A;
	OB <= B;
	OC <= C;
end str;