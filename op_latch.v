module op_latch(opSTK_Dout,opSTK_pop,op);

input [7:0] opSTK_Dout;
input opSTK_pop;
output [7:0] op;
reg [7:0] op;

always @(posedge opSTK_pop)

op<=opSTK_Dout;

endmodule 

