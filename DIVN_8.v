module DIVN_8(DIVN_in,DIVD_in,clk_in,load,Q,R,Div_complete);

input [7:0] DIVD_in,DIVN_in;
input clk_in,load;
output Div_complete;
output [7:0] Q,R;
wire [2:0] d,bn;
wire z,clk,sin;
wire [7:0] DIVN,DIVN_,DIVD_;
reg [2:0] count;
reg [7:0] DIVD;
reg Div_complete;

PENC8 U0(DIVN_in,bn,z);
assign DIVN_=DIVN_in<<d;
assign d=7-bn;
assign clk=clk_in&((count!=0)|load);
RegR8 U1(load,clk,DIVN_,DIVN);
ShlReg8 U2(clk,sin,load,Q);

always @(posedge clk)

begin
  count<=(load)?d+1:count-1;
  DIVD<=(load)?DIVD_in:DIVD_;
end 

assign sin=(DIVD>=DIVN)?1'b1:1'b0;
assign DIVD_=(sin)?(DIVD-DIVN):DIVD;
assign R=DIVD;

always @(load)
if(load)
Div_complete = 1'b0;
else
Div_complete =(count)?1'b0:1'b1;

endmodule 