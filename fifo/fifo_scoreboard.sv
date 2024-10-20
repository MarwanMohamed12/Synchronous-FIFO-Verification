package fifo_scoreboard;

import fifo_package::*;
import shared_pkg ::*;
FIFO_transaction tr=new();

logic [FIFO_WIDTH-1:0] data_out_ref;
logic wr_ack_ref, overflow_ref;
logic full_ref, empty_ref, almostfull_ref, almostempty_ref, underflow_ref;


bit [FIFO_WIDTH-1 :0] fifo_modeling[$];

function void check_data(input FIFO_transaction FI_tr);
    
    reference_model(FI_tr);
    if(data_out_ref != FI_tr.data_out )begin
            $display("@%0t there is a problem data_out_ref=%0d ,data_out=%0d and %p",$time,data_out_ref,FI_tr.data_out,fifo_modeling);
            error_count++;
        end
    else correct_count++;    
endfunction

function void reference_model(input FIFO_transaction FI_tr);
    if(!FI_tr.rst_n )begin
        fifo_modeling.delete();
    end
    else begin
        if(FI_tr.wr_en && FI_tr.rd_en && fifo_modeling.size() == 0)begin
            fifo_modeling.push_back(FI_tr.data_in);
        end
        else if(FI_tr.wr_en && FI_tr.rd_en && fifo_modeling.size() == FIFO_DEPTH)begin
            data_out_ref=fifo_modeling.pop_front();
        end
        else if(FI_tr.wr_en && FI_tr.rd_en)begin
            fifo_modeling.push_back(FI_tr.data_in);
            data_out_ref=fifo_modeling.pop_front();
        end
        else if(FI_tr.wr_en && fifo_modeling.size() != FIFO_DEPTH)begin
            fifo_modeling.push_back(FI_tr.data_in);
        end
        else if(FI_tr.rd_en && fifo_modeling.size() != 0)begin
            data_out_ref=fifo_modeling.pop_front();
        end
    end




endfunction

endpackage