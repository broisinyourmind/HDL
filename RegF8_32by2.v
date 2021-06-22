module RegF8_32by2 (Din,clk,X,Y,_7seg0,_7seg1,_7seg2,_7seg3,_7seg4,_7seg5);

input [7:0] Din;
input clk;
output [6:0] _7seg0,_7seg1,_7seg2,_7seg3,_7seg4,_7seg5;
output [31:0] X,Y;
wire [7:0] R[7:0];

latch8  U0(Din,clk,R[0]);
latch8  U1(R[0],clk,R[1]);
latch8  U2(R[1],clk,R[2]);
latch8  U3(R[2],clk,R[3]);
latch8  U4(R[3],clk,R[4]);
latch8  U5(R[4],clk,R[5]);
latch8  U6(R[5],clk,R[6]);
latch8  U7(R[6],clk,R[7]);

assign X={R[3],R[2],R[1],R[0]};
assign Y={R[7],R[6],R[5],R[4]};

_7segENC U8(R[0][3:0],_7seg0);
_7segENC U9(R[0][7:4],_7seg1);
_7segENC U10(R[1][3:0],_7seg2);
_7segENC U11(R[1][7:4],_7seg3);
_7segENC U13(R[2][3:0],_7seg4);
_7segENC U14(R[2][7:4],_7seg5);

endmodule
