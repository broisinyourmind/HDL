module caculation_CC (reset,clk,start,opndSTK_pop,opndSTK_push,opSTK_pop,complete);

input reset,clk,start;
output opndSTK_pop,opndSTK_push,opSTK_pop,complete;
reg [1:0] cs,ns;
reg opndSTK_pop,opndSTK_push,opSTK_pop,complete;

always @(posedge reset or posedge clk)
if(reset)
cs<=2'd0;
else
cs<=ns;

always @(cs or start)

case (cs)
2'd0:begin
     ns<=(start)?2'd1:2'd0;
	  opndSTK_pop<=1'd0;
	  opndSTK_push<=1'd0;
	  opSTK_pop<=1'd0;
	  complete<=1'd0;
	  end
2'd1:begin
     ns<=2'd2;
	  opndSTK_pop<=1'd1;
	  end 
2'd2:begin
     ns<=2'd3;
	  opndSTK_pop<=1'd1;
	  opSTK_pop<=1'd1;
	  end
2'd3:begin
     ns<=2'd0;
	  complete<=1'd1;
	  opndSTK_push<=1'd0;
	  opSTK_pop<=1'd0;
	  end
default:ns<=2'd0;
endcase 
endmodule 