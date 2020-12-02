library IEEE; 
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_ARITH.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL; 

entity Program_Counter is 
PORT ( 
	a: 		in std_logic_vector(7 downto 0); 
	LD_PC:		in std_logic; 
	IN_PC:	in std_logic; 
	clk:	in std_logic; 
	c:		out std_logic_vector(7 downto 0));
end Program_Counter;

architecture str of Program_Counter is 
signal DATA:std_logic_vector(7 downto 0):=X"00"; 
begin 
	process (clk,LD_PC) 
		begin 
		if CLK'event and CLK='0' then 
			if LD_PC='1' then 
				DATA <= a; 
			elsif IN_PC='1' then 
				DATA<=DATA+X"01"; 
			end if; 
		end if; 
	end process; 
	c <= DATA; 
end str;