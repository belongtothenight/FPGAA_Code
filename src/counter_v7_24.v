module counter_v7_24(
    input clk,
    input rst,
    output reg [4:0] count_24,
    output reg       clk_div24
);

always @ (posedge clk or negedge rst)
begin
    if (!rst)
    begin
        count_24  <= 0;
    end
    else if (count_24 == 23)
    begin
        count_24 <= 0;
    end
    else
        count_24 <= count_24 + 1;
end

always @ (posedge clk or negedge rst)
begin
    if (!rst)
    begin
        clk_div24 <= 0;
    end
    // else if (count_24 < 12)
    else if (count_24 < 11 | count_24 == 23)
    begin
        clk_div24 <= 1;
    end
    else
        clk_div24 <= 0;
end

endmodule