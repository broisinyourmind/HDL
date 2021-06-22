module op_index(clk,reset,BT,opsel);
input clk,reset,BT;
output reg opsel;

always@(posedge clk or posedge reset)begin
 if(reset)
 opsel<=1'd0;
 else
 opsel<=opsel^BT;
end

endmodule
