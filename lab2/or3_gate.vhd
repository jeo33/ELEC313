library IEEE; use IEEE.std_logic_1164.all;

entity or3_gate  is
port( or1, or2 ,or3 : in std_logic;
      orout : out std_logic);
end or3_gate;


architecture example of or3_gate is begin
  orout <= or1 or or2 or or3; 
end;






