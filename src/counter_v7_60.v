module counter_v7_60(
    input clk,
    input rst,
    output reg [5:0] count_60,
    output reg       clk_div60
);

always @ (posedge clk or negedge rst)
begin
    if (!rst)
    begin
        count_60  <= 0;
    end
    else if (count_60 == 59)
    begin
        count_60 <= 0;
    end
    else
        count_60 <= count_60 + 1;
end

always @ (posedge clk or negedge rst)
begin
    if (!rst)
    begin
        clk_div60 <= 0;
    end
    // else if (count_60 < 30)
    else if (count_60 < 29 | count_60 == 59)
    begin
        clk_div60 <= 1;
    end
    else
        clk_div60 <= 0;
end

endmodule