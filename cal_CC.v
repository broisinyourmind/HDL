module cal_CC(start,opnd_pop,opnd_push,complete,op_pop,reset,clk);
input reset,start,clk;
output reg opnd_pop,opnd_push,complete,op_pop;
reg[1:0]cs,ns;

always@(posedge clk)
if(reset)
cs<=2'd0;
else
cs<=ns;

always@(*)
case(cs)
2'd0:ns=(start)?2'd1:2'd0; 
2'd1:ns=2'd2;
2'd2:ns=2'd3;
2'd3:ns=2'd0;
default:ns=2'd0;
endcase

always@(*)
case(cs)
2'd0:begin
     opnd_pop<=1'd0;
	  opnd_push<=1'd0;
	  complete<=1'd0;
	  op_pop<=1'd0;
	  end
2'd1:begin
     opnd_pop<=1'd1;
	  opnd_push<=1'd0;
	  complete<=1'd0;
	  op_pop<=1'd0;
	  end
2'd2:begin
     opnd_pop<=1'd1;
	  opnd_push<=1'd0;
	  complete<=1'd0;
	  op_pop<=1'd1;
	  end
2'd3:begin
     opnd_pop<=1'd0;
	  opnd_push<=1'd1;
	  complete<=1'd1;
	  op_pop<=1'd0;
	  end
default:begin
     opnd_pop<=1'd0;
	  opnd_push<=1'd0;
	  complete<=1'd0;
	  op_pop<=1'd0;
	  end
endcase

endmodule
