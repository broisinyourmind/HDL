module AccReg1(Din,BTN,Addr,clk,_7seg0,_7seg1);
input [7:0]Din;
input BTN,clk;
input [2:0]Addr;
output [6:0] _7seg0,_7seg1;
wire [7:0] Dout;
  
  oneshoot D0(BTN,clk,wr);
  RegF8 D1(Din,Addr,wr,Dout);
  _7seg U0(Dout[3:0],_7seg0);
  _7seg U1(Dout[7:4],_7seg1);
endmodule  