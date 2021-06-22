module BCDADD1(A,B,cin,BCD,cout);
input [3:0]A,B;
input cin;
output [3:0]BCD;
output cout;
wire[3:0]_S,_S_;
wire c1,c2;

assign {c1,_S}={1'd0,A}+{1'd0,B}+{4'd0,cin};
ADD6 A0(_S,_S_,c2);
assign cout=c1|c2;
assign BCD=(cout)?_S_:_S;
endmodule
