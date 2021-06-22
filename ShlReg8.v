module ShlReg8(clk,sin,clr,Q);

input clk,sin,clr;
output [7:0] Q;
reg [7:0]Q;

always @(posedge clk)

 Q<=(clr)?8'd0:{Q[6:0],sin};
 
 endmodule
 