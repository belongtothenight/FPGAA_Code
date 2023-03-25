module counter_v5(
    input clk,
    input rst,
    output wire [3:0] count_10,
    output wire [5:0] count_50,
    output wire       clk_div10,
    output wire       clk_div50
);

counter_v5_50 counter_50(
    .clk(clk),
    .rst(rst),
    .count_50(count_50),
    .clk_div50(clk_div50)
);

counter_v5_10 counter_10(
    .clk(clk_div50),
    .rst(rst),
    .count_10(count_10),
    .clk_div10(clk_div10)
);

endmodule
