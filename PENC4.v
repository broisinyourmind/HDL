module PENC4(A,Y,Z);

input[3:0]A;
output[1:0]Y;
output Z;

assign Z=~(A[0]|A[1]|A[2]|A[3]);
assign Y[0]=A[3]|(~A[2]&A[1]);
assign Y[1]=A[3]|A[2];

endmodule
