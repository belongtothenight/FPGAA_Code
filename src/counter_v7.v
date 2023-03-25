module counter_v7(
    input clk,
    input rst,
    output wire [5:0] count_60_1,
    output wire [5:0] count_60_2,
    output wire [4:0] count_24,
    output wire       clk_div60_1,
    output wire       clk_div60_2,
    output wire       clk_div24
);

counter_v7_60 counter_60_1(
    .clk(clk),
    .rst(rst),
    .count_60(count_60_1),
    .clk_div60(clk_div60_1)
);

counter_v7_60 counter_60_2(
    .clk(clk_div60_1),
    .rst(rst),
    .count_60(count_60_2),
    .clk_div60(clk_div60_2)
);

counter_v7_24 counter_24(
    .clk(clk_div60_2),
    .rst(rst),
    .count_24(count_24),
    .clk_div24(clk_div24)
);

endmodule
