library IEEE; use IEEE.std_logic_1164.all;

entity and3_gate  is
port( and1, and2, and3: in std_logic;
      andout : out std_logic);
end and3_gate;


architecture example of and3_gate is begin
  andout <= and1 and and2 and and3; 
end;






