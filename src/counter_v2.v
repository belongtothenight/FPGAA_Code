module counter_v2(
    input clk,
    input rst,
    output reg [3:0] count_10,
    output reg       clk_div10
);

always @ (posedge clk or negedge rst)
begin
    if (!rst)
    begin
        count_10  <= 0;
        clk_div10 <= 0;
    end
    else if (count_10 == 4)
    begin
        count_10 <= 0;
        clk_div10 <= ~clk_div10;
    end
    else
        count_10 <= count_10 + 1;
end

endmodule