module TLC (clk,reset,busy,count_en,MR,MG,MY,SR,SG,SY,state,next_state);
input clk,reset,busy,count_en;
output reg MR,MG,MY,SR,SG,SY;
output reg [2:0] state,next_state;
reg [3:0] count;



always@(posedge clk)

if (count>4'd13)
count=4'd1;
else
if (reset)
count=0;
else
if(count_en)
count=count+1'd1;


always@(*)

case(count)
4'd1:state=(busy)?3'd0:3'd5;

4'd2:state=(busy)?3'd0:3'd5;

4'd3:state=(busy)?3'd0:3'd5;

4'd4:state=(busy)?3'd1:3'd5;

4'd5:state=(busy)?3'd2:3'd5;

4'd6:state=(busy)?3'd2:3'd5;

4'd7:state=(busy)?3'd2:3'd5;

4'd8:state=(busy)?3'd2:3'd5;

4'd9:state=(busy)?3'd2:3'd5;

4'd10:state=(busy)?3'd3:3'd5;

4'd11:state=(busy)?3'd4:3'd5;

4'd12:state=(busy)?3'd4:3'd5;

4'd13:state=(busy)?3'd4:3'd5;

4'd14:state=(busy)?3'd4:3'd5;

default:state=state;
endcase 


always@(*)

case(state)
3'd0:begin
     MR=1'd1;
	  MG=1'd0;
	  MY=1'd0;
	  SR=1'd0;
	  SG=1'd1;
	  SY=1'd0;
	  end
3'd1:begin
     MR=1'd1;
	  MG=1'd0;
	  MY=1'd0;
	  SR=1'd0;
	  SG=1'd0;
	  SY=1'd1;
	  end
3'd2:begin
     MR=1'd0;
	  MG=1'd1;
	  MY=1'd0;
	  SR=1'd1;
	  SG=1'd0;
	  SY=1'd0;
	  end
3'd3:begin
     MR=1'd0;
	  MG=1'd0;
	  MY=1'd1;
	  SR=1'd1;
	  SG=1'd0;
	  SY=1'd0;
	  end
3'd4:begin
     MR=1'd1;
	  MG=1'd0;
	  MY=1'd0;
	  SR=1'd1;
	  SG=1'd0;
	  SY=1'd0;
	  end
3'd5:begin
     MR=1'd0;
	  MG=1'd0;
	  MY=1'd1;
	  SR=1'd0;
	  SG=1'd0;
	  SY=1'd1;
	  end
endcase

endmodule 