`timescale 1ns/1ns

module counter_tb_v2;

reg        clk, rst;
wire [3:0] count_10;
wire       clk_div10;

counter_v2 ucounter(
    .clk(clk),
    .rst(rst),
    .count_10(count_10),
    .clk_div10(clk_div10)
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
