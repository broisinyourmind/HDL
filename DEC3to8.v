module DEC3to8(Addr,en,LE);
input [2:0]Addr;
input en;
output[7:0]LE;
reg [7:0]_LE;
  always @(Addr)
    case(Addr)
	   3'd0:_LE<=8'b00000001;
		3'd1:_LE<=8'b00000010;
		3'd2:_LE<=8'b00000100;
		3'd3:_LE<=8'b00001000;
		3'd4:_LE<=8'b00010000;
		3'd5:_LE<=8'b00100000;
		3'd6:_LE<=8'b01000000;
		3'd7:_LE<=8'b10000000;
		default:_LE<=8'b00000000;
	endcase
  assign LE=(en)?_LE:8'd0;
endmodule 