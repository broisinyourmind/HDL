module OneShot(BTN, clk, S);
input BTN, clk;
output S;
reg [2:0] cs, ns;
reg S;
always @(negedge clk)
	cs <= ns;
always @(cs)
	S = (cs==3'd3)? 1'd1:1'd0;
always @(cs or BTN)
	case (cs)
	3'd0: ns <= (BTN)? 3'd0:3'd1;
	3'd1: ns <= (BTN)? 3'd0:3'd2;
	3'd2: ns <= (BTN)? 3'd0:3'd3;
	3'd3: ns <= 3'd4;
	3'd4: ns <= (BTN)? 3'd0:3'd4;
	default: ns <= 3'd0;
	endcase
endmodule