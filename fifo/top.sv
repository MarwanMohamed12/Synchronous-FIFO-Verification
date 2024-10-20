module top();

bit clk=0;

always #100 clk=!clk;

fifo_if if_t(clk);
FIFO Dut(if_t);
fifo_tb TB(if_t);
fifo_monitor Monitor(if_t);


endmodule