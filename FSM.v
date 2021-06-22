module FSM(i,j,reset,load,start,clk_in,reset_j,clk,en,WR0,WR1,s);

input reset,start,clk_in,load;
input [2:0] j;
input [3:0] i;
output reg reset_j,en,WR0,WR1;
output reg [2:0]s;
output  clk;


always@(posedge clk_in)
	if(reset==1'd1)
		s=3'd0;
	else 
		case(s)
			3'd0:s<=(load)?3'd0:3'd1;
			3'd1:s<=(start)?3'd2:3'd1;
			3'd2:s<=3'd3;
			3'd3:s<=(j==3'd6)?3'd4:3'd3;
			3'd4:s<=(i==4'd8)?3'd0:3'd2;
			default:s<=3'd0;
		endcase
		
always@(s)
	case(s)
		3'd0:begin	
				reset_j<=1'd0;
				en<=1'd0;
				WR0<=1'b1;
				WR1<=1'b0;
			  end
		3'd1:begin	
				reset_j<=1'd0;
				en<=1'd0;
				WR0<=1'b0;
				WR1<=1'b0;
			  end
		3'd2:begin	
				reset_j<=1'd1;
				en<=1'd1;
				WR0<=1'b1;
				WR1<=1'b1;
			  end
		3'd3:begin
				reset_j<=1'd0;
				en<=1'd1;
				WR0<=1'b1;
				WR1<=1'b1;
				end
		3'd4:begin
				reset_j<=1'd1;
				en<=1'd0;
				WR0<=1'b1;
				WR1<=1'b1;
				end			
		default:begin
				reset_j<=1'd0;
				en<=1'd0;
				WR0<=1'b0;
				WR1<=1'b0;
				end
	endcase
	
assign clk=clk_in&en;



endmodule 