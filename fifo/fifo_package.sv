package fifo_package;
    parameter FIFO_WIDTH = 16;
    parameter FIFO_DEPTH = 8;
    class FIFO_transaction;
        rand logic [FIFO_WIDTH-1:0] data_in;
        rand logic  rst_n, wr_en, rd_en;
        logic [FIFO_WIDTH-1:0] data_out;
        logic wr_ack, overflow;
        logic full, empty, almostfull, almostempty, underflow;

        int RD_EN_ON_DIST,WR_EN_ON_DIST;

        function new(int RD_EN_ON_DIST_t=30 , int WR_EN_ON_DIST_t=70);
            RD_EN_ON_DIST=RD_EN_ON_DIST_t;
            WR_EN_ON_DIST=WR_EN_ON_DIST_t;
        endfunction 

        constraint x{
            rst_n dist { 0:= 5 , 1:= 95 };
            wr_en dist { 1:= WR_EN_ON_DIST , 0:= 100-WR_EN_ON_DIST};
            rd_en dist { 1:= RD_EN_ON_DIST , 0:= 100-RD_EN_ON_DIST};
        }
    endclass 
endpackage
