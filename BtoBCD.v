module BtoBCD(A,BCD);
input [7:0]A;
output [11:0]BCD;
wire c0,c16,c32,_c64,c64,_c28,c1;
wire [3:0]Adj,_BCD31,BCD31;
wire [7:0]_BCD0,BCD0,_BCD1,BCD1,_BCD2,BCD2,_BCD30,BCD30;
BCDAdj(A[3:0],Adj,c0);

BCDADD2 ({{3'd0,c0},Adj},8'h16,1'd0,_BCD0,c16);
assign BCD0=(A[4])?_BCD0:{{3'd0,c0},Adj};
BCDADD2 (BCD0,8'h32,1'd0,_BCD1,c32);
assign BCD1=(A[5])?_BCD1:BCD0;
BCDADD2 (BCD1,8'h64,1'd0,_BCD2,_c64);
assign BCD2=(A[6])?_BCD2:BCD1;
assign c64=(A[6])?_c64:1'b0;
BCDADD2 (BCD2,8'h28,1'd0,_BCD30,_c28);
BCDADD1 ({3'd0,c64},4'd1,_c28,_BCD31,c1);
assign BCD30=(A[7])?_BCD30:BCD2;
assign BCD31=(A[7])?_BCD31:{3'd0,c64};
assign BCD={BCD31,BCD30};

endmodule
