module MUL4 (A,B,M);

input [3:0] A,B;
output [7:0] M;
wire [3:0] M0,M1,M2,M3;
wire [5:0] S0,S1;

assign M0=(B[0])?A:4'd0;
assign M1=(B[1])?A:4'd0;
assign M2=(B[2])?A:4'd0;
assign M3=(B[3])?A:4'd0;
assign S0={2'b00,M0}+{1'b0,M1,1'b0};
assign S1={2'b00,M2}+{1'b0,M3,1'b0};
assign M={2'b00,S0}+{S1,2'b00};

endmodule


