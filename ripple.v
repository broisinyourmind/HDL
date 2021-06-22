module ripple(A,B,add_ctrl,SUM,C_out);
input[7:0] A,B;
input add_ctrl;
output[7:0] SUM;
output C_out;
wire[6:0] c;
wire[7:0] b1;

xor U0(b1[0],B[0],add_ctrl);
xor U1(b1[1],B[1],add_ctrl);
xor U2(b1[2],B[2],add_ctrl);
xor U3(b1[3],B[3],add_ctrl);
xor U4(b1[4],B[4],add_ctrl);
xor U5(b1[5],B[5],add_ctrl);
xor U6(b1[6],B[6],add_ctrl);
xor U7(b1[7],B[7],add_ctrl);

fadder A0(A[0],b1[0],add_ctrl,SUM[0],c[0]);
fadder A1(A[1],b1[1],c[0],SUM[1],c[1]);
fadder A2(A[2],b1[2],c[1],SUM[2],c[2]);
fadder A3(A[3],b1[3],c[2],SUM[3],c[3]);
fadder A4(A[4],b1[4],c[3],SUM[4],c[4]);
fadder A5(A[5],b1[5],c[4],SUM[5],c[5]);
fadder A6(A[6],b1[6],c[5],SUM[6],c[6]);
fadder A7(A[7],b1[7],c[6],SUM[7],C_out);

endmodule 