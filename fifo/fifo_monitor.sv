module fifo_monitor(fifo_if.Monitor if_t);

    import fifo_package::*;
    import fifo_scoreboard::*;
    import FIFO_fun_coverage::*;
    import shared_pkg::*;
    FIFO_transaction transaction_t=new(70,30);
    FIFO_coverage FC=new();
    initial begin
        while(! test_finished)begin
            @(negedge if_t.clk);
            transaction_t.data_in=if_t.data_in;
            transaction_t.rst_n=if_t.rst_n;
            transaction_t.rd_en=if_t.rd_en;
            transaction_t.wr_en=if_t.wr_en;
            transaction_t.data_out=if_t.data_out;
            transaction_t.wr_ack=if_t.wr_ack;
            transaction_t.overflow=if_t.overflow;
            transaction_t.full=if_t.full;
            transaction_t.empty=if_t.empty;
            transaction_t.almostempty=if_t.almostempty;
            transaction_t.almostfull=if_t.almostfull;
            transaction_t.underflow=if_t.underflow;

            fork
                FC.sample_data(transaction_t);
                check_data(transaction_t);
            join
        end
        $display("error_count=%0d , correct count %0d ",error_count,correct_count);
    end



endmodule