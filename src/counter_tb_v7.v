`timescale 1ns/1ns

module counter_tb_v7;

reg        clk, rst;
wire [5:0] count_60_1;
wire [5:0] count_60_2;
wire [4:0] count_24;
wire       clk_div60_1, clk_div60_2, clk_div24;

counter_v7 counter(
    .clk(clk),
    .rst(rst),
    .count_60_1(count_60_1),
    .count_60_2(count_60_2),
    .count_24(count_24),
    .clk_div60_1(clk_div60_1),
    .clk_div60_2(clk_div60_2),
    .clk_div24(clk_div24)
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
