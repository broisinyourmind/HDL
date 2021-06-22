module MCX2to1 (A,B,sel,Y);

input [4:0] A,B;
input sel;
output [4:0] Y;

assign Y=(sel)? B:A;

endmodule