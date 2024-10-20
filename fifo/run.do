vlib work
vlog *v +cover -covercells +define+SIM
vsim -voptargs=+acc work.top -cover
add wave -position insertpoint sim:/top/if_t/*
add wave -position insertpoint sim:/top/Dut/*
coverage save fifo_tb.ucdb -onexit 
run -all
quit -sim

vcover report fifo_tb.ucdb -details -all -output coverage_report.txt
