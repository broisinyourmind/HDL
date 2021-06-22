module CADD8 (A,B,cin,S,cout);

input [7:0] A,B;
input cin;
output [7:0] S;
output cout;
wire c0;

CADD4 A0 (A[3:0],B[3:0],cin,S[3:0],c0);
CADD4 A1 (A[7:4],B[7:4],c0,S[7:4],cout);

endmodule 
