library IEEE;
use IEEE.std_logic_1164.all;
entity sum is
port( a,b,c	: in std_logic;
      output	: out std_logic);
end sum;


architecture structural of sum is

-- declare a half-adder component


component and3_gate
  port ( and1, and2,and3 :   in std_logic;
         andout : out std_logic);
end component;



component or3_gate
  port ( or1, or2,or3 :   in std_logic;
         orout : out std_logic);
end component;




signal out1, out2,out3,not_a,not_b     : std_logic;






for a1, a2,a3 : and3_gate use entity WORK.and3_gate(example);
for o1 : or3_gate use entity WORK.or3_gate(example);

begin

not_a <= not a;
not_b <= not b;


a1: and3_gate port map(and1 => not_a, and2 => not_b,
                         and3 => c, andout => out1);

a2: and3_gate port map(and1 => not_a, and2 => b,
                         and3 => c, andout => out2);

a3: and3_gate port map(and1 => a, and2 => b,
                         and3 => c, andout => out3);

o1: or3_gate port map(or1 => out1, or2 => out2,
                         or3 => out3, orout => output);



end structural;
