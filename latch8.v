module latch8 (D,we,Q);

input [7:0] D;
input we;
output [7:0] Q;
reg [7:0] Q;

always @(posedge we)

Q<=D;

endmodule

