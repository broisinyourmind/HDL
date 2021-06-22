module CADD16 (A,B,cin,S,cout);

input [15:0] A,B;
input cin;
output [15:0] S;
output cout;
wire c0;

CADD8 A0 (A[7:0],B[7:0],cin,S[7:0],c0);
CADD8 A1 (A[15:8],B[15:8],c0,S[15:8],cout);

endmodule 