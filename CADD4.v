module CADD4 (A,B,add_ctrl,SUM,C_out);
input [7:0] A,B;
input add_ctrl;
output [7:0] SUM;
output C_out;
wire [7:0] P,G,C;
wire [7:0] b1;
wire [35:0] D;

xor U0(b1[0],B[0],add_ctrl);
xor U1(b1[1],B[1],add_ctrl);
xor U2(b1[2],B[2],add_ctrl);
xor U3(b1[3],B[3],add_ctrl);
xor U4(b1[4],B[4],add_ctrl);
xor U5(b1[5],B[5],add_ctrl);
xor U6(b1[6],B[6],add_ctrl);
xor U7(b1[7],B[7],add_ctrl);

or  T0(P[0],A[0],b1[0]);
or  T1(P[1],A[1],b1[1]);
or  T2(P[2],A[2],b1[2]);
or  T3(P[3],A[3],b1[3]);
or  T4(P[4],A[4],b1[4]);
or  T5(P[5],A[5],b1[5]);
or  T6(P[6],A[6],b1[6]);
or  T7(P[7],A[7],b1[7]);
and S0(G[0],A[0],b1[0]);
and S1(G[1],A[1],b1[1]);
and S2(G[2],A[2],b1[2]);
and S3(G[3],A[3],b1[3]);
and S4(G[4],A[4],b1[4]);
and S5(G[5],A[5],b1[5]);
and S6(G[6],A[6],b1[6]);
and S7(G[7],A[7],b1[7]);

xor U8(SUM[0],A[0],b1[0],add_ctrl);
and S8(D[0],P[0],add_ctrl);
or  T8(C[0],G[0],D[0]);

xor U9(SUM[1],A[1],b1[1],C[0]);
and S9(D[1],P[1],G[0]);
and S10(D[2],P[1],P[0],add_ctrl);
or  T9(C[1],G[1],D[1],D[2]);

xor U10(SUM[2],A[2],b1[2],C[1]);
and S11(D[3],P[2],G[1]);
and S12(D[4],P[2],P[1],G[0]);
and S13(D[5],P[2],P[1],P[0],add_ctrl);
or  T10(C[2],G[2],D[3],D[4],D[5]);

xor U11(SUM[3],A[3],b1[3],C[2]);
and S14(D[6],P[3],G[2]);
and S15(D[7],P[3],P[2],G[1]);
and S16(D[8],P[3],P[2],P[1],G[0]);
and S17(D[9],P[3],P[2],P[1],P[0],add_ctrl);
or  T11(C[3],G[3],D[6],D[7],D[8],D[9]);

xor U12(SUM[4],A[4],b1[4],C[3]);
and S18(D[10],P[4],G[3]);
and S19(D[11],P[4],P[3],G[2]);
and S20(D[12],P[4],P[3],P[2],G[1]);
and S21(D[13],P[4],P[3],P[2],P[1],G[0]);
and S22(D[14],P[4],P[3],P[2],P[1],P[0],add_ctrl);
or  T12(C[4],G[4],D[10],D[11],D[12],D[13],D[14]);

xor U13(SUM[5],A[5],b1[5],C[4]);
and S23(D[15],P[5],G[4]);
and S24(D[16],P[5],P[4],G[3]);
and S25(D[17],P[5],P[4],P[3],G[2]);
and S26(D[18],P[5],P[4],P[3],P[2],G[1]);
and S27(D[19],P[5],P[4],P[3],P[2],P[1],G[0]);
and S28(D[20],P[5],P[4],P[3],P[2],P[1],P[0],add_ctrl);
or  T13(C[5],G[5],D[15],D[16],D[17],D[18],D[19],D[20]);

xor U14(SUM[6],A[6],b1[6],C[5]);
and S29(D[21],P[6],G[5]);
and S30(D[22],P[6],P[5],G[4]);
and S31(D[23],P[6],P[5],P[4],G[3]);
and S32(D[24],P[6],P[5],P[4],P[3],G[2]);
and S33(D[25],P[6],P[5],P[4],P[3],P[2],G[1]);
and S34(D[26],P[6],P[5],P[4],P[3],P[2],P[1],G[0]);
and S35(D[27],P[6],P[5],P[4],P[3],P[2],P[1],P[0],add_ctrl);
or  T14(C[6],G[6],D[21],D[22],D[23],D[24],D[25],D[26],D[27]);

xor U15(SUM[7],A[7],b1[7],C[6]);
and S36(D[28],P[7],G[6]);
and S37(D[29],P[7],P[6],G[5]);
and S38(D[30],P[7],P[6],P[5],G[4]);
and S39(D[31],P[7],P[6],P[5],P[4],G[3]);
and S40(D[32],P[7],P[6],P[5],P[4],P[3],G[2]);
and S41(D[33],P[7],P[6],P[5],P[4],P[3],P[2],G[1]);
and S42(D[34],P[7],P[6],P[5],P[4],P[3],P[2],P[1],G[0]);
and S43(D[35],P[7],P[6],P[5],P[4],P[3],P[2],P[1],P[0],add_ctrl);
or  T15(C_out,G[7],D[28],D[29],D[30],D[31],D[32],D[33],D[34],D[35]);

endmodule
