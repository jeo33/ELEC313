library ieee;
use IEEE.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity converter is
port( sign_mag : in std_logic_vector(3 downto 0) ;
twos_comp : out std_logic_vector(3 downto 0) );
end converter;


architecture complement of converter is 
--11
signal tempinput1 :std_logic_vector (2 downto 0);
signal tempinput2 :std_logic_vector (2 downto 0);
signal tempinput3 :std_logic_vector (2 downto 0);
signal sel:std_logic;

begin

tempinput1 <= not sign_mag(2 downto 0);
sel<=sign_mag(3);
--20
tempinput2 <= tempinput1+"001";

tempinput3	<= sign_mag(2 downto 0)when sel='0' else
		tempinput2;
twos_comp<=sel & tempinput3;
	
end complement;


