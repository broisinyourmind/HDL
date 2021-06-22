module caculation(clk,start,opndSTK_Dout,opSTK_Dout,reset,R,opndSTK_pop,opndSTK_push,opSTK_pop,complete,op);

input [7:0] opndSTK_Dout;
input [1:0] opSTK_Dout;
input clk,start,reset;
output opndSTK_pop,opndSTK_push,opSTK_pop,complete;
output [7:0] R,op;
wire [7:0] op,opnd1,opnd2;
wire LE;

caculation_CC (reset,clk,start,opndSTK_pop,opndSTK_push,opSTK_pop,complete);
assign LE=opndSTK_pop&clk;
opnds (opndSTK_Dout,LE,opnd1,opnd2);
caculater (opnd1,opnd2,op,R);
op_latch (opSTK_Dout,opSTK_pop,op);

endmodule 
