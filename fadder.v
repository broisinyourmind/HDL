module fadder(a,b,c,s,cout);
input a,b,c;
output cout,s;
wire c0,c1,d0;
xor (d0,a,b);
xor (s,d0,c);
and (c0,a,b);
and (c1,d0,c);
or  (cout,c0,c1);
endmodule