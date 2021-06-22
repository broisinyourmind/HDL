module priority8(Din,op_Dout,cmp);
input [7:0]Din,op_Dout;
output reg cmp;
always@(*)begin
if(((Din==8'd0)||(Din==8'd1))&&((op_Dout==8'd0)||(op_Dout==8'd1)))
cmp=1'd1;
else if(((Din==8'd0)||(Din==8'd1))&&((op_Dout==8'd2)||(op_Dout==8'd3)))
cmp=1'd1;
else if(((Din==8'd2)||(Din==8'd3))&&((op_Dout==8'd2)||(op_Dout==8'd3)))
cmp=1'd1;
else
cmp=1'd0;
end

endmodule
