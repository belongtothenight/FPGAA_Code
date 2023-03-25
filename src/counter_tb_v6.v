`timescale 1ns/1ns

module counter_tb_v6;

reg        clk, rst;
wire [3:0] count_10;
wire [3:0] count_100;
wire       clk_div10, clk_div100;

counter_v6 counter(
    .clk(clk),
    .rst(rst),
    .count_10_low(count_10),
    .count_10_high(count_100),
    .clk_div10(clk_div10),
    .clk_div100(clk_div100)
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
