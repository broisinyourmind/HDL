module sw(A,B,X,Y);
input [7:0]A,B;
output [7:0]X,Y;
wire s;

assign s=(A>B)?1:0;
assign {X,Y}=(s)?{B,A}:{A,B};

endmodule
