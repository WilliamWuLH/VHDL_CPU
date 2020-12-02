library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity control_signal is
port(
IR : in std_logic_vector(7 downto 0);
SM,MOVA,MOVB,MOVC,ADD,SUB,OR0,NOT0,RSR,RSL,JMP,JZ,JC,IN0,OUT0,NOP,HALT,Z,C : in std_logic;
S : out std_logic_vector(3 downto 0);
RAA,RWBA,MADD: out std_logic_vector(1 downto 0);
IN_PC,LD_PC,WE,M,F_BUS,FL_BUS,FR_BUS,LD_IR,DL,XL,HALTO,INO,OUTO : out std_logic);
end control_signal;

architecture beh of control_signal is
begin
	process(SM,JMP,JC,C,JZ,Z,MOVB,MOVC)
	begin
		if(MOVB = '1') then
			MADD <= "01";
		elsif(MOVC = '1') then
			MADD <= "10";
		elsif((not SM or JMP or (JC and C) or (JZ and Z)) = '1') then
			MADD <= "00";
		end if;
	end process;
	S <= IR(7 downto 4);
	RAA <= IR(1 downto 0);
	RWBA <= IR(3 downto 2);
	IN_PC <= '1' when (SM='0') or(((JC='1' and C='0') or (JZ='1' and Z='0') or NOP='1') and SM='1') else '0';
	LD_PC <= '1' when SM='1' and (JMP='1' or (JC='1' and C='1') or (JZ='1' and Z='1')) else '0';
	WE <= '0' when ((SM='1' and (MOVA='1' or MOVC='1' or ADD='1' or SUB='1' or OR0='1' or NOT0='1' or RSR='1' or RSL='1')) or IN0='1') else '1';
	M <= '1' when (SM='1' and (ADD='1' or SUB='1' or OR0='1' or NOT0='1')) else '0';
	F_BUS <= '1' when (SM='1' and (MOVA='1' or MOVB='1' or ADD='1' or SUB='1' or OR0='1' or NOT0='1' or OUT0='1')) else '0';
	FL_BUS <= '1' when RSL='1' else '0';
	FR_BUS <= '1' when RSR='1' else '0';
	LD_IR <= '0' when SM='1' else '1';
	DL <= '1' when (SM='0' or (SM='1' and (MOVC='1' or JMP='1' or (JC='1' and C='1') or (JZ='1' and Z='1')))) else '0';
	XL <= '1' when (SM='1' and MOVB='1') else '0';
	HALTO <= '1' when HALT='1' else '0';
	INO <= '1' when IN0='1' else '0';
	OUTO <= '1' when OUT0='1' else '0';
end beh;