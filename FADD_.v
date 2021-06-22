module FADD_ (X0,X1,Y);

input [31:0] X0,X1;
output [31:0] Y;
wire [25:0] F0,F1,_F,_F1,F;
wire [7:0] E0,E1,E,d;
wire S0,S1,S;

assign E0=X0[30:23];
assign E1=X1[30:23];
assign F0={3'b001,X0[22:0]};
assign F1={3'b001,X1[22:0]};
assign S=X0[31];
assign d=E0-E1;
assign _F1=F1>>d;
assign _F=F0+_F1;
assign F=(_F[24])? _F>>1:_F;
assign E=(_F[24])? E0+1:E0;
assign Y={S,E,F[22:0]};

endmodule

