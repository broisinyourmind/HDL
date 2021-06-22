module stackcc8 (rst,push,pop,clk,Addr,wen,empty,full);
input rst,push,pop,clk;
output wen,empty,full;
output [2:0]Addr;
reg [3:0]nTop,Top;
reg wen;
wire _wen;
assign empty=Top[3];
assign full=~|Top;
assign Addr=Top[2:0];
assign _wen=push&(~full);

always@(posedge clk)
begin
Top<=nTop;
wen<=_wen;
end

always@(*)
begin
if(rst)
nTop=4'd8;
else 
  if(push)
    nTop=(full)?Top:Top-4'd1;
  else
    if(pop)
	  nTop=(empty)?Top:Top+4'd1;
	 else
	  nTop=Top;
end

endmodule
 