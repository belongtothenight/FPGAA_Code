`timescale 1ns/1ns

module counter_tb_v5;

reg        clk, rst;
wire [5:0] count_50;
wire [3:0] count_10;
wire       clk_div50, clk_div10;

// counter_v5_50 counter_50(
//     .clk(clk),
//     .rst(rst),
//     .count_50(count_50),
//     .clk_div50(clk_div50)
// );

// counter_v5_10 counter_10(
//     .clk(clk_div50),
//     .rst(rst),
//     .count_10(count_10),
//     .clk_div10(clk_div10)
// );

counter_v5 counter(
    .clk(clk),
    .rst(rst),
    .count_10(count_10),
    .count_50(count_50),
    .clk_div10(clk_div10),
    .clk_div50(clk_div50)
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
