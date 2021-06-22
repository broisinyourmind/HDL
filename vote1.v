module vote1 (in1,in2,in3,in4,in5,out);

input [2:0] in1,in2,in3,in4,in5;
output [2:0] out;
wire [2:0] sum12,sum13,sum14,sum15,sum23,sum24,sum25,sum34,sum35,sum45,sum123,sum124,sum125,sum134,sum135,sum145,sum234,sum235,sum245,sum345,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11,out12,out13;

and (sum123,in1,in2,in3);
and (sum124,in1,in2,in4);
and (sum125,in1,in2,in5);
and (sum134,in1,in3,in4);
and (sum135,in1,in3,in5);
and (sum145,in1,in4,in5);
and (sum234,in2,in3,in4);
and (sum235,in2,in3,in5);
and (sum245,in2,in4,in5);
and (sum345,in3,in4,in5);

or (out13,sum123,sum124,sum125,sum134,sum135,sum145,sum234,sum235,sum245,sum345);

and (sum12,in1,in2);
and (sum13,in1,in3);
and (sum14,in1,in4);
and (sum15,in1,in5);
and (sum23,in2,in3);
and (sum24,in2,in4);
and (sum25,in2,in5);
and (sum34,in3,in4);
and (sum35,in3,in5);
and (sum45,in4,in5);

or (out2,sum123,sum45);
or (out3,sum124,sum35);
or (out4,sum125,sum34);
or (out5,sum134,sum25);
or (out6,sum135,sum24);
or (out7,sum145,sum23);
or (out8,sum234,sum15);
or (out9,sum235,sum14);
or (out10,sum245,sum13);
or (out11,sum345,sum12);

or (out12,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11);
assign out=out13;

endmodule 