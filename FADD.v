module FADD(X0,X1,Y);
input [31:0]X0,X1;
output [31:0]Y;
wire[25:0] F0,F1,F0_,F1_,F_,F__,_F,F; 
wire [7:0] E0,E1,E,d,_E;
wire [4:0] ps,ds;
wire S,z,_z;
 
 assign E0=X0[30:23];
 assign E1=X1[30:23];
 
 assign F0={3'b001,X0[22:0]};   
 assign F0_=(X0[31])?(~F0+26'd1):F0;
 assign d=E0-E1;                
 assign F1={3'b001,X1[22:0]};   
 assign F1_=(X1[31])?(~(F1>>d)+26'd1):(F1>>d);
 
 assign F_=F0_+F1_;  
 assign S=F_[25]; 
 assign F__=(S)?(~F_+26'd1):(F_);
 
 PENC32 	U0({8'd0,F__[23:0]},ps,z);
 assign ds=5'd23-ps;
 assign _F=(F__[24])?(F__>>1):(F__<<ds);
 assign F=(z)?26'd0:_F;
 
 assign _E=(F__[24])?(E0+8'd1):(E0-ds);
 assign _z=~_F[24]&z;
 assign E=(_z)?(8'd0):(_E); 
 assign Y={S,E,F[22:0]};
endmodule 
