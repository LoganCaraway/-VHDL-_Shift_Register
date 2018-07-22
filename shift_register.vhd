library IEEE;
use IEEE.std_logic_1164.all;

entity shift_register is
	port(Clock,Reset : in  std_logic;
	     Din         : in  std_logic_vector(15 downto 0);
	     Dout0,Dout1 : out std_logic_vector(15 downto 0);
	     Dout2,Dout3 : out std_logic_vector(15 downto 0));
end entity;

architecture shift_register_arch of shift_register is

	signal D0, D1, D2, D3 : std_logic_vector(15 downto 0);

begin
	SHIFT_REGISTER_PROCESS : process(Clock, Reset)
	begin
		if (Reset='0') then
			D0<=x"0000";
			D1<=x"0000";
			D2<=x"0000";
			D3<=x"0000";
		elsif (rising_edge(Clock)) then
			D0<=Din;
			D1<=D0;
			D2<=D1;
			D3<=D2;
		end if;
	end process;
	
	Dout0<=D0;
	Dout1<=D1;
	Dout2<=D2;
	Dout3<=D3;
	
end architecture;