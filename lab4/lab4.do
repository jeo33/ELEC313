add wave *

force reset 1

force sel 00
force sel 01
force sel 10
force sel 11

run 3
force reset 0

force din 0001
force clk 1
force sel 00
run 3
force clk 0
run 3

force din 0010
force clk 1
force sel 01
run 3
force clk 0
run 3

force din 0011
force clk 1
force sel 10
run 3
force clk 0
run 3

force din 0100
force clk 1
force sel 11
run 3
force clk 0
run 3




force din 0111
force clk 1
force sel 10
run 3
force clk 0
run 3

force din 1100
force clk 1
force sel 11
run 3
force clk 0
run 3


force din 1100
force clk 1
force sel 11
run 3
force clk 0
run 3

