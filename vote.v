module vote (in1,in2,in3,in4,in5,out);

input [2:0] in1,in2,in3,in4,in5;
output [2:0] out;
wire [2:0] sum1,sum2,sum3;

assign sum1=in1[0]+in2[0]+in3[0]+in4[0]+in5[0];
assign sum2=in1[1]+in2[1]+in3[1]+in4[1]+in5[1];
assign sum3=in1[2]+in2[2]+in3[2]+in4[2]+in5[2];

assign out=(sum1==5||sum1==4||sum1==3)? 3'b001:(sum2==5||sum2==4||sum2==3||sum2==2)? 3'b010:(sum3==5||sum3==4||sum3==3)? 3'b100:(sum1==2 && sum1==2)? 3'b001:out;

endmodule 