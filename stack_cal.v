module stack_cal(clk,reset,BT,enter,Din,_7seg0,_7seg1,_7seg2);
input clk,reset,BT,enter;
input [7:0]Din;
output [6:0]_7seg0,_7seg1,_7seg2;
wire[3:0]BCD0,BCD1,BCD2;
wire op_pop,op_push,op_empty,op_full,opnd_pop,opnd_push,opnd_empty,opnd_full;
wire [7:0]op_Dout,opnd_Din,opnd_Dout,Result;
wire [3:0]op_BCD0,op_BCD1,op_BCD2;
wire cmp,op_sel,start,cp,opnd_push_cc;
wire opnd_push_cal,complete,BTN_oneshot,enter_oneshot;
stack8 op(.rst(reset),.clk(clk),.pop(op_pop),.push(op_push),.Din(Din),.Dout(op_Dout),.empty(op_empty),.full(op_full),.BCD0(op_BCD0),.BCD1(op_BCD1),.BCD2(op_BCD2));
stack8 opnd(.rst(reset),.clk(clk),.pop(opnd_pop),.push(opnd_push),.Din(opnd_Din),.Dout(opnd_Dout),.empty(opnd_empty),.full(opnd_full),.BCD0(BCD0),.BCD1(BCD1),.BCD2(BCD2));
priority8 pr(.Din(Din),.op_Dout(op_Dout),.cmp(cmp));
calculation cal(.clk(clk),.start(start),.reset(reset),.opnd_Dout(opnd_Dout),.op_Dout(op_Dout),.R(Result),.complete(complete),.opnd_pop(opnd_pop),.opnd_push(opnd_push_cal),.op_pop(op_pop));
stack_cc c0(.reset(reset),.clk(clk),.BT(BTN_oneshot),.enter(enter_oneshot),.op_sel(op_sel),.op_empty(op_empty),.complete(complete),.cmp(cmp),.start(start),.cp(cp),.opnd_push_CC(opnd_push_cc),.op_push(op_push));
op_index opsel(.clk(clk),.reset(reset),.BT(BTN_oneshot),.opsel(op_sel));
OneShot oneshot0(.BTN(BT),.clk(clk),.S(BTN_oneshot));
OneShot oneshot1(.BTN(enter),.clk(clk),.S(enter_oneshot));
_7segENC seg0(.H(BCD0),._7seg(_7seg0));
_7segENC seg1(.H(BCD1),._7seg(_7seg1));
_7segENC seg2(.H(BCD2),._7seg(_7seg2));
assign opnd_Din=(cp)?Result:Din;
assign opnd_push=(cp)?opnd_push_cal:opnd_push_cc;

endmodule
