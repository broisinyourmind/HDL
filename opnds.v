module opnds(Din,opnd1,opnd2,LE,clk);
input[7:0]Din;
input LE,clk;
output reg [7:0] opnd1,opnd2;

always@(posedge clk)
if(LE)begin
opnd1<=Din;
opnd2<=opnd1;
end
else begin
opnd1<=opnd1;
opnd2<=opnd2;
end

endmodule
