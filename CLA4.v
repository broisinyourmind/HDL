module CLA4 (ain,bin,cin,g,p,s);

input [3:0] ain,bin;
input cin;
output [3:0] s;
output g,p;
wire c1,c2,c3,g0,g1,g2,g3,p0,p1,p2,p3;

RFA a0 (ain[0],bin[0],cin,g0,p0,s[0]);
RFA a1 (ain[1],bin[1],c1,g1,p1,s[1]);
RFA a2 (ain[2],bin[2],c2,g2,p2,s[2]);
RFA a3 (ain[3],bin[3],c3,g3,p3,s[3]);
bclg4_s a4 (c3,c2,c1,g,p,g3,g2,g1,g0,p3,p2,p1,p0,cin);

endmodule 
