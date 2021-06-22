module reg8(Din,wen,clk,Addr,Dout);
input [7:0]Din;
input wen,clk;
input [2:0]Addr;
output reg[7:0]Dout;

reg [7:0]RF[0:7];
reg [7:0]LE;
wire [7:0]LE_;
always@(Addr)
case(Addr)
3'd0:LE=8'b00000001;
3'd1:LE=8'b00000010;
3'd2:LE=8'b00000100;
3'd3:LE=8'b00001000;
3'd4:LE=8'b00010000;
3'd5:LE=8'b00100000;
3'd6:LE=8'b01000000;
3'd7:LE=8'b10000000;
default:LE=8'd0;
endcase

assign LE_=(wen)?LE:8'd0;

always@(negedge clk)
begin
RF[0]<=(LE_[0])?Din:RF[0];
RF[1]<=(LE_[1])?Din:RF[1];
RF[2]<=(LE_[2])?Din:RF[2];
RF[3]<=(LE_[3])?Din:RF[3];
RF[4]<=(LE_[4])?Din:RF[4];
RF[5]<=(LE_[5])?Din:RF[5];
RF[6]<=(LE_[6])?Din:RF[6];
RF[7]<=(LE_[7])?Din:RF[7];
end

always@(Addr)
case(Addr)
3'd0:Dout=RF[0];
3'd1:Dout=RF[1];
3'd2:Dout=RF[2];
3'd3:Dout=RF[3];
3'd4:Dout=RF[4];
3'd5:Dout=RF[5];
3'd6:Dout=RF[6];
3'd7:Dout=RF[7];
endcase

endmodule
