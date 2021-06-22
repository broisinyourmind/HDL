module count1 (btn,reset,cin,_7seg0,_7seg1);

input btn,reset,cin;
output [6:0] _7seg0,_7seg1;
wire [7:0] S,S1,B;
wire cout;
reg [7:0] Q;

assign B=(cin)?8'hFE:8'd1;

ADD8 U0 (Q,B,cin,S,cout);

assign S1=(reset)?8'd0:S;

always @(posedge btn)

Q=S1;

_7segENC U1(Q[3:0],_7seg0);
_7segENC U2(Q[7:4],_7seg1);

endmodule
