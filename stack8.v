module stack8(rst,clk,pop,push,Din,Dout,empty,full,BCD0,BCD1,BCD2);
input rst,pop,push,clk;
input [7:0]Din;
output [7:0]Dout;
output empty,full;
wire [11:0]BCD;
output [3:0]BCD0,BCD1,BCD2;
wire [2:0]Addr;
wire wen;
stackcc8 S0(.rst(rst),.push(push),.pop(pop),.clk(clk),.Addr(Addr),.wen(wen),.empty(empty),.full(full));
reg8 R0(.Din(Din),.wen(wen),.clk(clk),.Addr(Addr),.Dout(Dout));
BtoBCD B0(Dout,BCD);
assign {BCD2,BCD1,BCD0}=BCD;
endmodule
