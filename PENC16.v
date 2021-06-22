module PENC16(A,Y,Z,_7segNEC);

input[15:0] A;
output[6:0] _7segNEC;
output[3:0] Y;
output Z;

wire [3:0]Y0,Y1;
wire Z0,Z1;

PENC8 U0(A[7:0],Y0,Z0);
PENC8 U1(A[15:8],Y1,Z1);

assign Z=Z0&Z1;
assign Y[3]=~Z1;
assign Y[2:0]=(Y[3])?Y1:Y0;

_7segENC U2(Y,_7segNEC);


endmodule
