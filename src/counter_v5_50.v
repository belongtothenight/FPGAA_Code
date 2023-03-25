module counter_v5_50(
    input clk,
    input rst,
    output reg [5:0] count_50,
    output reg       clk_div50
);

always @ (posedge clk or negedge rst)
begin
    if (!rst)
    begin
        count_50  <= 0;
    end
    else if (count_50 == 49)
    begin
        count_50 <= 0;
    end
    else
        count_50 <= count_50 + 1;
end

always @ (posedge clk or negedge rst)
begin
    if (!rst)
    begin
        clk_div50 <= 0;
    end
    else if (count_50 < 25)
    begin
        clk_div50 <= 1;
    end
    else
        clk_div50 <= 0;
end

endmodule