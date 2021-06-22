module BCDADD2(A,B,cin,BCD,cout);
input [7:0]A,B;
input cin;
output [7:0]BCD;
output cout;
wire c;
BCDADD1(A[3:0],B[3:0],cin,BCD[3:0],c);
BCDADD1(A[7:4],B[7:4],c,BCD[7:4],cout);
endmodule
