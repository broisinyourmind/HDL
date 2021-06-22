module ADD6(A,S,cout);
input [3:0]A;
output [3:0]S;
output cout;
wire c2;
assign S[0]=A[0];
assign S[1]=~A[1];
assign S[2]=(~A[2])^A[1];
assign S[3]=A[3]^c2;
assign c2=A[2]|A[1];
assign cout=A[3]&c2;

endmodule
