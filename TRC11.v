module TRC11 (clk,reset,sw,TRC0,TRC1);
input clk,reset,sw;
output [2:0]TRC0,TRC1;
reg[3:0]ns,cs;
reg[2:0]TRC0,TRC1;

always@(posedge clk)
 cs<=ns;
always@(cs or reset or sw)
 if(reset)
  ns<=4'd0;
 else 
  if(sw)
   ns<=4'd10; 
  else
   if(cs>=9)
	 ns<=4'd0;
	else
	ns<=cs+1;
always@(cs)
	case(cs)
		4'd0:begin
       TRC0<=3'b001;
		 TRC1<=3'b100;
		end
		4'd1:begin
       TRC0<=3'b001;
		 TRC1<=3'b100;
		end
		4'd2:begin
       TRC0<=3'b001;
		 TRC1<=3'b100;
		end
		4'd3:begin
       TRC0<=3'b001;
		 TRC1<=3'b010;
		end
		4'd4:begin
       TRC0<=3'b100;
		 TRC1<=3'b001;
		end
		4'd5:begin
       TRC0<=3'b100;
		 TRC1<=3'b001;
		end
		4'd6:begin
       TRC0<=3'b100;
		 TRC1<=3'b001;
		end
		4'd7:begin
       TRC0<=3'b100;
		 TRC1<=3'b001;
		end
		4'd8:begin
       TRC0<=3'b100;
		 TRC1<=3'b001;
		end
		4'd9:begin
       TRC0<=3'b010;
		 TRC1<=3'b001;
		end
	default:begin
		 TRC0<=3'b000;
		 TRC1<=3'b000;
		end	
   endcase
endmodule 