module BCLG4 (cout4,cout3,cout2,cout1,gout,pout,g3,g2,g1,g0,p3,p2,p1,p0,cin);

input g3,g2,g1,g0,p3,p2,p1,p0;
input cin;
output cout4,cout3,cout2,cout1;
output gout,pout;
wire s1,s2,s3,s4,s5,s6,t1,t2,t3,t4;

and a1 (s1,p0,cin);
or o1 (cout1,g0,s1);
and a2 (s2,p1,g0);
and a3 (s3,p1,p0,cin);
or o2 (cout2,g1,s2,s3);
and a4 (s4,p2,g1);
and a5 (s5,p2,p1,g0);
and a6 (s6,p2,p1,p0,cin);
or o3 (cout3,g2,s4,s5,s6);
and a7 (t1,p3,g2);
and a8 (t2,p3,p2,g1);
and a9 (t3,p3,p2,p1,g0);
and a11 (t4,p3,p2,p1,p0,cin);
or o5 (cout4,g3,t1,t2,t3,t4);
or o4 (gout,g3,t1,t2,t3);
and a10 (pout,p0,p1,p2,p3);

endmodule 