module calculation(clk,start,reset,opnd_Dout,op_Dout,R,complete,opnd_pop,opnd_push,op_pop);
input clk,reset,start;
input [7:0]opnd_Dout,op_Dout;
output [7:0]R;
output complete,opnd_pop,opnd_push,op_pop;

wire opnd_pop,opnd_push,op_pop;
wire [7:0]opnd1,opnd2;
reg [7:0] op;


cal_CC c0(.start(start),.opnd_pop(opnd_pop),.opnd_push(opnd_push),.complete(complete),.op_pop(op_pop),.reset(reset),.clk(clk));
opnds op0(.Din(opnd_Dout),.opnd1(opnd1),.opnd2(opnd2),.LE(opnd_pop),.clk(clk));
calculator c1(.opnd1(opnd1),.opnd2(opnd2),.op(op),.R(R));

always@(posedge clk)
if(op_pop)
op<=op_Dout;
else
op<=op;

endmodule 

