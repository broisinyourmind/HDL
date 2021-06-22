module CADD24 (A,B,cin,S,cout);

input [21:0] A,B;
input cin;
output [21:0] S;
output cout;
wire c0,c01;

CADD8 A0 (A[7:0],B[7:0],cin,S[7:0],c0);
CADD8 A1 (A[15:8],B[15:8],c0,S[15:8],c01);
CADD6 A2 (A[21:16],B[21:16],c01,S[21:16],cout);

endmodule 