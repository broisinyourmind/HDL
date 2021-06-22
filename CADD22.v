module CADD22 (A,B,cin,S,cout);

input [21:0] A,B;
input cin;
output [21:0] S;
output cout;
wire c0,c01;

CLA16 A0 (c0,S[15:0],g,p,A[15:0],B[15:0],cin);
CADD6 A1 (A[21:16],B[21:16],c0,S[21:16],cout);

endmodule 