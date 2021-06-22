module GCD_CC (start,clk,Div_complete,R,sel,load,reset);

input start,clk,Div_complete,reset;
input [7:0] R;
output sel,load;
reg [2:0] cs,ns;
reg sel,load;

always @(posedge clk)

cs<=ns;

always @(cs)
case (cs)
2'd0:begin
     load<=1'd0;
	  sel<=1'd0;
	  end
2'd1:begin
     load<=1'd1;
	  sel<=1'd0;
	  end
2'd2:begin
     load<=1'd0;
	  sel<=1'd0;
	  end 
2'd3:begin
     load<=1'd1;
	  sel<=1'd1;
	  end
2'd4:begin
     load<=1'd0;
	  sel<=1'd0;
	  end
endcase 

always @(reset or cs or start or R or Div_complete)
if(reset==1'd1)
   ns<=2'd0;
else
   case (cs)
	2'd0:ns<=(start)?2'd1:2'd0;
	2'd1:ns<=2'd2;
	2'd2:ns<=2'd3;
	2'd3:
	     if (Div_complete)
		    if(R==0)
			 ns<=2'd4;
			 else
			 ns<=2'd2;
			 else
			 ns<=2'd3;
			 
	2'd4:ns<=2'd0;
	endcase
	endmodule
	
		  
	

