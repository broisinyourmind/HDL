module CLA16 (cout,sum,g,p,a,b,cin);

input [15:0] a,b;
input cin;
output [15:0] sum;
output g,p,cout;
wire c4,c8,c12,g0,g1,g2,g3,p0,p1,p2,p3;

CLA4 A0 (a[3:0],b[3:0],cin,g0,p0,sum[3:0]);
CLA4 A1 (a[7:4],b[7:4],c4,g1,p1,sum[7:4]);
CLA4 A2 (a[11:8],b[11:8],c8,g2,p2,sum[11:8]);
CLA4 A3 (a[15:12],b[15:12],c12,g3,p3,sum[15:12]);

BCLG4 A4 (cout,c12,c8,c4,g,p,g3,g2,g1,g0,p3,p2,p1,p0,cin);

endmodule 
