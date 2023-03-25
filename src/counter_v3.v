module counter_v3(
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
    end
    else if (count_10 == 9)
    begin
        count_10 <= 0;
    end
    else
        count_10 <= count_10 + 1;
end

always @ (posedge clk or negedge rst)
begin
    if (!rst)
    begin
        clk_div10 <= 0;
    end
    else if (count_10 < 4 | count_10 == 9)
    begin
        clk_div10 <= 1;
    end
    else
        clk_div10 <= 0;
end

endmodule