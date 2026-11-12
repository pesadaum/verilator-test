module hw (
    input logic clk,
    input logic rst_n
);

logic [31:0] counter;

always @ (posedge clk) begin
    if (!rst_n) begin
        counter <= 0;
    end
    else begin
        counter <= counter + 1;
        $display("Hello World!");
    end
end
    
endmodule
