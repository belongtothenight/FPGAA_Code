module counter_v6(
    input clk,
    input rst,
    output wire [3:0] count_10_low,
    output wire [3:0] count_10_high,
    output wire       clk_div10,
    output wire       clk_div100
);

counter_v5_10 counter_10_low(
    .clk(clk),
    .rst(rst),
    .count_10(count_10_low),
    .clk_div10(clk_div10)
);

counter_v5_10 counter_10_high(
    .clk(clk_div10),
    .rst(rst),
    .count_10(count_10_high),
    .clk_div10(clk_div100)
);

endmodule
