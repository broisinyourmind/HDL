module _7segENC (H, _7seg);
input [3:0] H;
output [6:0] _7seg;
reg [6:0] _7seg;

always @ (H)
	case (H)
	4'd0:_7seg = 7'b1000000;
	4'd1:_7seg = 7'b1111001;
	4'd2:_7seg = 7'b0100100;
	4'd3:_7seg = 7'b0110000;
	4'd4:_7seg = 7'b0011001;
	4'd5:_7seg = 7'b0010010;
	4'd6:_7seg = 7'b0000010;
	4'd7:_7seg = 7'b1111000;
	4'd8:_7seg = 7'b0000000;
	4'd9:_7seg = 7'b0010000;
	4'd10:_7seg = 7'b0001000;
	4'd11:_7seg = 7'b0000011;
	4'd12:_7seg = 7'b1000110;
	4'd13:_7seg = 7'b0100001;
	4'd14:_7seg = 7'b0000110;
	4'd15:_7seg = 7'b0001110;
	default:_7seg = 7'b1111111;
	endcase

endmodule 