module AGU (clk,Q);

input clk;
output [4:0] Q;
reg [4:0] Q;

always @ (posedge clk)

  begin 
      Q=Q+1;
  end

endmodule