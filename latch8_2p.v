module latch8_2p(Din0,Din1,LE0,LE1,clk,Dout);

input [7:0] Din0,Din1;
input LE0,LE1,clk;
output [7:0]Dout;
reg [7:0]Dout;

always @(negedge clk)
Dout<=(LE0)?Din0:((LE1)?Din1:Dout);

endmodule 