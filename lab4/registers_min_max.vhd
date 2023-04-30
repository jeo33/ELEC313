library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity registers_min_max is
port( 	din: in std_logic_vector(3 downto 0);
	reset : in std_logic;
	clk: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	max_out : out std_logic_vector(3 downto 0);
	min_out : out std_logic_vector(3 downto 0);
	reg_out : out std_logic_vector(3 downto 0));
end registers_min_max ;

architecture test of registers_min_max is

signal reg_data : std_logic_vector(3 downto 0);
signal max_out_temp,min_out_temp:std_logic_vector(3 downto 0);
signal r0,r1,r2,r3 : std_logic_vector(3 downto 0);
signal small: std_logic_vector(3 downto 0);
signal big: std_logic_vector(3 downto 0);

begin

--errror
------reset and load



------compare and display block
process(r0,r1,r2,r3)
	
	
    begin
        if ((r0 >= r1) and ((r0) >= (r2)) and ((r0) >= (r3))) then
            max_out_temp <= r0;
        elsif( ((r1) >= (r2)) and ((r1) >=(r3))) then
            max_out_temp <= r1;
        elsif (((r2) >= (r3)) and ((r2) >=(r1)))then
            max_out_temp <= r2;
        elsif (((r3) >=(r2)) and ((r3) >=(r1)))then
            max_out_temp <= r3;
        end if;

        if ((r0 <= r1) and ((r0) <= (r2)) and ((r0) <= (r3)) )then
            min_out_temp <= r0;
        elsif (((r1) <= (r2)) and ((r1) <= (r3)) )then
            min_out_temp <= r1;
        elsif (((r2) <= (r3)) and ((r2) <= (r1)))then
            min_out_temp <= r2;
        elsif (((r3) <= (r2)) and ((r3) <= (r1)))then
            min_out_temp <= r3;
        end if;

end process;


------end of compare and display block

process(clk, reset,sel)
    begin
        if reset = '1' then
		r0 <= ("1000");
                r1 <= ("1000");
		r2 <= ("1000");
                r3 <= ("1000");
                big <= ("0000");
                small <= ("1111");		

            
        elsif (clk'event and clk='1') then
		r0 <= din;
                r1 <= r0;
		r2 <= r1;
                r3 <= r2;
		     if( max_out_temp > big) then

		      big<=max_out_temp;
		      else 
		       big<=big; 
		      end if;

		      if(min_out_temp < small) then

		      small<=min_out_temp; 
		      
		      else 
		     
		      small<=small; 

		      end if;

        end if;
	
end process;
------end of reset and load


max_out<=big;
min_out<=small;
with sel select reg_out <=
			r3 when "11",
                       r2 when "10" ,
                       r1 when "01" ,
                       r0 when others ;

end test;

