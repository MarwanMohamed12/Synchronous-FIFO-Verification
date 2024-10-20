module fifo_tb(fifo_if.TB if_t);

import shared_pkg::*;
import fifo_package::*;

FIFO_transaction tr=new(50,50);

initial begin
test_finished=0;
if_t.rst_n=0;
@(negedge if_t.clk);#2;
repeat(1000)begin
assert (tr.randomize()); 

if_t.data_in=tr.data_in;
if_t.rst_n= tr.rst_n;
if_t.wr_en=tr.wr_en;
if_t.rd_en=tr.rd_en;
@(negedge if_t.clk);#2;
end

test_finished=1;
repeat(2)@(negedge if_t.clk);

$stop;
end



endmodule