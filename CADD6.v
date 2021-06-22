module CADD6 (A,B,cin,S,cout);

input [5:0] A,B;
input cin;
output [5:0] S;
output cout;
wire [5:0] P,G,C;



assign P[0]=A[0]|B[0];
assign P[1]=A[1]|B[1];
assign P[2]=A[2]|B[2];
assign P[3]=A[3]|B[3];
assign P[4]=A[4]|B[4];
assign P[5]=A[5]|B[5];
assign G[0]=A[0]&B[0];
assign G[1]=A[1]&B[1];
assign G[2]=A[2]&B[2];
assign G[3]=A[3]&B[3];
assign G[4]=A[4]&B[4];
assign G[5]=A[5]&B[5];

assign S[0]=A[0]^B[0]^cin;
assign C[0]=G[0]|(P[0]&cin);
assign S[1]=A[1]^B[1]^C[0];
assign C[1]=G[1]|(P[1]&G[0])|(P[1]&P[0]&cin);
assign S[2]=A[2]^B[2]^C[1];
assign C[2]=G[2]|(P[2]&G[1])|(P[2]&P[1]&G[0])|(P[2]&P[1]&P[0]&cin);
assign S[3]=A[3]^B[3]^C[2];
assign C[3]=G[3]|(P[3]&G[2])|(P[3]&P[2]&G[1])|(P[3]&P[2]&P[1]&G[0])|(P[3]&P[2]&P[1]&P[0]&cin);
assign S[4]=A[4]^B[4]^C[3];
assign C[4]=G[4]|(P[4]&G[3])|(P[4]&P[3]&G[2])|(P[4]&P[3]&P[2]&G[1])|(P[4]&P[3]&P[2]&P[1]&G[0])|(P[4]&P[3]&P[2]&P[1]&P[0]&cin);
assign S[5]=A[5]^B[5]^C[4];
assign C[5]=G[5]|(P[5]&G[4])|(P[5]&P[4]&G[3])|(P[5]&P[4]&P[3]&G[2])|(P[5]&P[4]&P[3]&P[2]&G[1])|(P[5]&P[4]&P[3]&P[2]&P[1]&G[0])|(P[5]&P[4]&P[3]&P[2]&P[1]&P[0]&cin);

assign cout=C[5];

endmodule