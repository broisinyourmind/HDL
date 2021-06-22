module fDIV (fin,DIVN,fout);

input fin;
input [7:0] DIVN;
output fout;
wire [7:0] _DIVN;
reg [7:0] count;
reg fout;

assign _DIVN=DIVN>>1;

always @ (negedge fin)

count=(count>=DIVN)?8'd1:count+1;

always @ (posedge fin)

fout=(count<=_DIVN)?1'b0:1'b1;

endmodule 