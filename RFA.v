module RFA (ain,bin,cin,g,p,s);

input ain,bin,cin;
output g,p,s;
wire s1,s2,s3,s4,s5;

and a1 (g,ain,bin);
or o1 (p,ain,bin);
not n1 (s1,g);
and a2 (s2,s1,p);
and a3 (s3,s2,cin);
or o2 (s4,s2,cin);
not n2 (s5,s3);
and a4 (s,s4,s5);

endmodule 