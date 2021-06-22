module GCD(Ain,Bin,start,reset,clk,RR);
 input[7:0]Ain,Bin;
 input start,reset,clk;
 output[7:0]RR;
 reg[7:0]RR;
 
 wire[7:0]A,B,R;
 wire sel,load,Div_complete;
 
 assign A=(sel)?RR:Ain;
 assign B=(sel)?R:Bin;
 
 DIVN_8(A,B,clk,load,Q,R,Div_complete);
 GCD_CC(start,clk,Div_complete,R,sel,load,reset);
 
 always@(posedge clk)
  RR<=B;
endmodule

