module PENC32(A,Y,Z);

input [31:0] A;
output [4:0] Y;
output Z;

wire [3:0]Y0,Y1;
wire Z0,Z1;

PENC16 U0(A[15:0],Y0,Z0);
PENC16 U1(A[31:16],Y1,Z1);

assign Z=Z0&Z1;
assign Y[4]=~Z1;
assign Y[3:0]=(Y[4])?Y1:Y0;

endmodule 