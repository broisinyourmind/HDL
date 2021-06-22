module MUL8_8 (Ain,Bin,clk,Load,M);

input [7:0] Ain,Bin;
input clk,Load;
output [15:0] M;
wire [7:0] B;
wire [15:0] A,_A,S;
wire _clk;

RegR8 U0(Load,clk,Bin,B);
RegL16 U1(Load,clk,Ain,A);

assign _A=(B[0])? A:16'd0;
assign S=M+_A;

RegM16 U2(_clk,Load,S,M);

assign _clk=((B!=0||Load)? clk:1'b0);

endmodule

