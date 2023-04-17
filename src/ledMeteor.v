module ledMeteor(
    clk,
    rst,
    shot,
    LEDR
);

input	     clk, rst, shot;
output [9:0] LEDR;

reg [9:0] count = 1'b1;

assign LEDR     = count;

always @ (posedge clk or negedge rst)
begin
    if (!rst)
    begin
        count <= 1'b1;
    end
    else if (!shot)
    begin
        count <= count << 1;
    end
    else if (shot)
    begin
        count <= 1'b1;
    end
end

endmodule