module ledMeteor(
    clk,
    rst,
    shot,
    LEDR
);

input	     clk, rst, shot;
output [9:0] LEDR;

reg [9:0] count = 1'b1;

assign countDiv = count % 10;
assign LEDR     = count;

always @ (posedge clk or negedge rst)
begin
    // counter
    if (!rst)
    begin
        count <= 1'b1;
    end
    else if (!shot)
    begin
        if (count > 9'b111111111)
        begin
            count <= 1'b0;
        end
        else
        begin
            count <= count << 1;
        end
    end
    else if (shot)
    begin
        count <= 1'b1;
    end

    // LED
end

endmodule