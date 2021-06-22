module stack_cc(reset,clk,BT,enter,op_sel,op_empty,complete,cmp,start,cp,opnd_push_CC,op_push);
input clk,reset,BT,enter,op_sel,op_empty,complete,cmp;
output reg start,cp,opnd_push_CC,op_push;
reg[3:0]cs,ns;

always@(posedge clk or posedge reset)
if(reset)
cs<=4'd0;
else
cs<=ns;

always@(*)begin
case(cs)
4'd0:begin
       if(BT)
	      if(op_sel)
			  if(op_empty||(~cmp))
			    ns=4'd2;
			  else if((~op_empty)||cmp)
			    ns=4'd3;
			  else
			    ns=4'd0;
			else
			  ns=4'd1;
		 else if(enter)
		     ns=4'd5;
		 else
		   ns=4'd0;		 
	  end
4'd1:begin
       ns=4'd0;
	  end
4'd2:begin
       ns=4'd0;
	  end
4'd3:begin
     ns=4'd4;
	  end
4'd4:begin
     if(complete)
	    if(cmp&&(~op_empty))
		   ns=4'd3;
		 else
		   ns=4'd2;
	  else
	    ns=4'd4;
	  end
4'd5:begin
       if(op_empty)
		   ns=4'd0;
		 else
         ns=4'd6;
	  end
4'd6:begin
     if(complete)
	   /* if(op_empty)
		   ns=4'd0;
		 else  */
		   ns=4'd5;
	  else
	    ns=4'd6;
	  end
default:begin
        ns=4'd0;
		  end
endcase
end

always@(*)begin
case(cs)
4'd0:begin
     start<=1'd0;
	  cp<=1'd0;
	  opnd_push_CC<=1'd0;
	  op_push<=1'd0;
	  end
4'd1:begin
     start<=1'd0;
	  cp<=1'd0;
	  opnd_push_CC<=1'd1;
	  op_push<=1'd0;
	  end
4'd2:begin
     start<=1'd0;
	  cp<=cp;
	  opnd_push_CC<=1'd0;
	  op_push<=1'd1;     
	  end
4'd3:begin
     start<=1'd1;
	  cp<=1'd1;
	  opnd_push_CC<=1'd0;
	  op_push<=1'd0;     
	  end
4'd4:begin
     start<=1'd0;
	  cp<=1'd1;
	  opnd_push_CC<=1'd0;
	  op_push<=1'd0;     
	  end	
4'd5:begin
     start<=1'd0;
	  cp<=1'd1;
	  opnd_push_CC<=1'd0;
	  op_push<=1'd0;     
	  end  
4'd6:begin
     start<=1'd1;
	  cp<=1'd1;
	  opnd_push_CC<=1'd0;
	  op_push<=1'd0;     
	  end
default:begin
     start<=1'd0;
	  cp<=1'd0;
	  opnd_push_CC<=1'd0;
	  op_push<=1'd0;     
	  end
endcase
end

endmodule
