module BSort(DIN,reset,start,clk_in,load,X,Y,k,j,reset_j,en,clk,_j,addr);

input reset,start,clk_in,load;
input[2:0]addr;
input [7:0]DIN;
output reset_j,en,clk,_j;
output [7:0]X,Y;
output [2:0]k,j;
wire[2:0] jj;
wire reset_j,clk,en;
wire [7:0]X,Y;
wire [2:0]_j;
reg [2:0]j;
reg [3:0]i;


sw	U0(Dout0,Dout1,X,Y);
FSM(i,j,reset,load,start,clk_in,reset_j,clk,en,WR0,WR1);
RegF8(X,Y,jj,_j,clk_in,WR0,WR1,Dout0,Dout1);
always@(posedge clk)//j-loop
	begin
		if(reset_j)
			j<=3'd0;
		else
			if(j>=3'd6)
				j<=3'd6;
			else
				j<=j+1;
	end
		
assign _j=j+1;

assign k=i;

always @(posedge reset_j)//i-loop
	i<=i+1;



assign   _X=(load)?DIN:X;
assign   jj=(load)?addr:j;
endmodule
