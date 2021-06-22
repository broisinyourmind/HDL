module RegF8(Din0,Din1,Addr0,Addr1,clk,wr0,wr1,Dout0,Dout1);

input [7:0]Din0,Din1;
input [2:0]Addr0,Addr1;
input wr0,wr1,clk;
output[7:0]Dout0,Dout1;
wire [7:0]LE0,LE1,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7;
reg [7:0]_Dout0,_Dout1;

  RDEC D0(Addr0,clk,wr0,LE0);
  RDEC D1(Addr1,clk,wr1,LE1);
  latch8_2p  U0(Din0,Din1,LE0[0],LE1[0],clk,Q0);
  latch8_2p  U1(Din0,Din1,LE0[1],LE1[1],clk,Q1);
  latch8_2p  U2(Din0,Din1,LE0[2],LE1[2],clk,Q2);
  latch8_2p  U3(Din0,Din1,LE0[3],LE1[3],clk,Q3);
  latch8_2p  U4(Din0,Din1,LE0[4],LE1[4],clk,Q4);
  latch8_2p  U5(Din0,Din1,LE0[5],LE1[5],clk,Q5);
  latch8_2p  U6(Din0,Din1,LE0[6],LE1[6],clk,Q6);
  latch8_2p  U7(Din0,Din1,LE0[7],LE1[7],clk,Q7);
  
  always @(Addr0)
    case(Addr0)
	   3'd0:_Dout0<=Q0;
		3'd1:_Dout0<=Q1;
		3'd2:_Dout0<=Q2;
		3'd3:_Dout0<=Q3;
		3'd4:_Dout0<=Q4;
		3'd5:_Dout0<=Q5;
		3'd6:_Dout0<=Q6;
		3'd7:_Dout0<=Q7;
	 endcase
	 
  always @(Addr1) 	 
	 case(Addr1)
	   3'd0:_Dout1<=Q0;
		3'd1:_Dout1<=Q1;
		3'd2:_Dout1<=Q2;
		3'd3:_Dout1<=Q3;
		3'd4:_Dout1<=Q4;
		3'd5:_Dout1<=Q5;
		3'd6:_Dout1<=Q6;
		3'd7:_Dout1<=Q7;
	 endcase
	 
  assign Dout0=_Dout1;
  assign Dout1=_Dout0;
  
endmodule  
		