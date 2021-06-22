module ADD8 (A,B,add_ctrl,SUM,C_out);

input [7:0] A,B;
input add_ctrl;
output [7:0] SUM;
output C_out;
wire c0;

CADD4 U0 (A[3:0],B[3:0],add_ctrl,SUM[3:0],c0);
CADD4 U1 (A[7:4],B[7:4],c0,SUM[7:4],C_out);

endmodule
