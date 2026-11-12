`include "hw.sv"

module hw_tb();


    // Testbench signals
    logic rst_n;
    logic clk;

    // Instantiate the DUT
    hw dut(
        .clk(clk),
        .rst_n(rst_n)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        // Reset the DUT
        rst_n = 0;
        #10;
        rst_n = 1;

        // Run the simulation for 100 CC
        #100;

        // Finish the simulation
        $finish;
    end

endmodule
