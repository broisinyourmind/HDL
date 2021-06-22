module BCDAdj(A,S,cout);
input [3:0]A;
output[3:0]S;
output cout;
wire [3:0]_S;
ADD6 A0(A,_S,cout);
assign S=(cout)?_S:A;
endmodule
