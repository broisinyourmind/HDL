module RegL16 (Load,clk,Din,Q);

input [7:0] Din;
input Load,clk;
output [15:0] Q;
reg [15:0] Q;

always @(posedge clk)

begin
  
  if(Load) Q<={8'd0,Din};
  else     Q<={Q[14:0],1'b0};

end

endmodule
