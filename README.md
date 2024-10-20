This project involves  verification of a Synchronous FIFO (First In, First Out) module .

Parameters:
FIFO_WIDTH: Width of the data bus (Default: 16 bits).
FIFO_DEPTH: Depth of the memory (Default: 8 words).
Ports:
data_in: Input data bus.
wr_en: Write enable signal.
rd_en: Read enable signal.
clk: Clock signal.
rst_n: Active low reset.
data_out: Output data bus.
Various flags: full, almostfull, empty, almostempty, overflow, and underflow.


Monitor: Samples interface signals and transfers data to coverage and scoreboard modules.
Scoreboard: Compares design outputs against reference models to check correctness.
Coverage: Tracks functional coverage of key signals to ensure that all operational scenarios are verified.
The verification environment utilizes:

Transaction Class: Models FIFO operations with constraints on the read and write enable signals.
Functional Coverage Class: Cross-coverage between control signals (e.g., read enable, write enable, and output flags).
Scoreboard Class: Implements a reference model to check FIFO outputs against expected values.
Additionally, the testbench incorporates assertions within the design to verify critical internal counters and output flags, enhancing the depth of verification.
