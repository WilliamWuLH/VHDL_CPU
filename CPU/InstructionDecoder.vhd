library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity InstructionDecoder is
port(
EN : in std_logic;
IR : in std_logic_vector(7 downto 0);
IRO : out std_logic_vector(7 downto 0);
MOVA : out std_logic;
MOVB : out std_logic;
MOVC : out std_logic;
ADD : out std_logic;
SUB : out std_logic;
OR0 : out std_logic;
NOT0 : out std_logic;
RSR : out std_logic;
RSL : out std_logic;
JMP : out std_logic;
JZ : out std_logic;
JC : out std_logic;
IN0 : out std_logic;
OUT0 : out std_logic;
NOP : out std_logic;
HALT : out std_logic);
end InstructionDecoder ;
architecture RTL of InstructionDecoder is
begin
	IRO <= IR;
	MOVA <= EN and IR(7) and IR(6) and IR(5) and IR(4) and not( IR(3) and IR(2)) and not( IR(1) and IR(0));
	MOVB <= EN and IR(7) and IR(6) and IR(5) and IR(4) and IR(3) and IR(2) and not( IR(1) and IR(0));
	MOVC <= EN and IR(7) and IR(6) and IR(5) and IR(4) and not( IR(3) and IR(2)) and IR(1) and IR(0);
	ADD <= EN and IR(7) and (not IR(6)) and (not IR(5)) and IR(4) and not( IR(3) and IR(2)) and not( IR(1) and IR(0));
	SUB <= EN and (not IR(7)) and IR(6) and IR(5) and (not IR(4)) and not( IR(3) and IR(2)) and not( IR(1) and IR(0));
	OR0 <= EN and IR(7) and (not IR(6)) and IR(5) and IR(4) and not( IR(3) and IR(2)) and not( IR(1) and IR(0));
	NOT0 <= EN and (not IR(7)) and IR(6) and (not IR(5)) and IR(4) and not( IR(3) and IR(2));
	RSR <= EN and IR(7) and (not IR(6)) and IR(5) and (not IR(4)) and not( IR(3) and IR(2)) and (not IR(1)) and (not IR(0));
	RSL <= EN and IR(7) and (not IR(6)) and IR(5) and (not IR(4)) and not( IR(3) and IR(2)) and IR(1) and IR(0);
	JMP <= EN and (not IR(7)) and (not IR(6)) and (not IR(5)) and IR(4) and (not IR(3)) and (not IR(2)) and (not IR(1)) and (not IR(0));
	JZ <= EN and (not IR(7)) and (not IR(6)) and (not IR(5)) and IR(4) and (not IR(3)) and (not IR(2)) and (not IR(1)) and IR(0);
	JC <= EN and (not IR(7)) and (not IR(6)) and (not IR(5)) and IR(4) and (not IR(3)) and (not IR(2)) and IR(1) and (not IR(0));
	IN0 <= EN and (not IR(7)) and (not IR(6)) and IR(5) and (not IR(4)) and not( IR(3) and IR(2));
	OUT0 <= EN and (not IR(7)) and IR(6) and (not IR(5)) and (not IR(4)) and not( IR(3) and IR(2));
	NOP <= EN and (not IR(7)) and IR(6) and IR(5) and IR(4) and (not IR(3)) and (not IR(2)) and (not IR(1)) and (not IR(0));
	HALT <= EN and IR(7) and (not IR(6)) and (not IR(5)) and (not IR(4)) and (not IR(3)) and (not IR(2)) and (not IR(1)) and (not IR(0));
end RTL ;