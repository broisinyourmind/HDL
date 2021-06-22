module PENC8(A,Y,Z);

input [7:0]A;
output [2:0]Y;
output Z;

wire [1:0]Y0,Y1;
wire Z0,Z1;

PENC4 U0(A[3:0],Y0,Z0);
PENC4 U1(A[7:4],Y1,Z1);

assign Z=Z0&Z1;
assign Y[2]=~Z1;
assign Y[1:0]=(Y[2])?Y1:Y0;

endmodule