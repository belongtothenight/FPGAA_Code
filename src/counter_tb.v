`timescale 1ns/1ns

module counter_tb;

reg        clk, rst;
wire [3:0] count_10;

counter_10 ucounter(
    .clk(clk),
    .rst(rst),
    .count_10(count_10)
);

initial
begin
    #0
    rst = 0;
    clk = 0;
    #15
    rst = 1;
end

always
    #10
    clk = ~clk;

endmodule