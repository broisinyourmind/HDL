module count8 (clk,reset,Q);

input clk,reset;
output [7:0] Q;
reg [7:0] Q;

always @ (posedge clk)

  begin
       Q=(reset)? 8'd0:Q+1;
  end

endmodule
