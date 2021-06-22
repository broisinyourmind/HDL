module RegR8 (Load,clk,Din,Q);

input [7:0] Din;
input Load,clk;
output [7:0] Q;
reg [7:0] Q;

always @ (posedge clk)

begin
  
  if(Load) Q<=Din;
  else     Q<={1'b0,Q[7:1]};

end

endmodule
