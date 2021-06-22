module vote2 (in1,in2,in3,in4,in5,out);

input [2:0] in1,in2,in3,in4,in5;
output [2:0] out;
wire one_sum123,one_sum124,one_um125,one_sum134,one_sum135,one_sum145,one_sum234,one_sum235,one_sum245,one_sum345,
     two_sum123,two_sum124,two_sum125,two_sum134,two_sum135,two_sum145,two_sum234,two_sum235,two_sum245,two_sum345,
     three_sum123,three_sum124,three_sum125,three_sum134,three_sum135,three_sum145,three_sum234,three_sum235,three_sum245,three_sum345,
     xor1,xor2,xor3,out0,out1,out2,out3,out4,out5,determin_out;
wire [2:0] out3sum,out2sum;

and (one_sum123,in1[2],in2[2],in3[2]);
and (one_sum124,in1[2],in2[2],in4[2]);
and (one_sum125,in1[2],in2[2],in5[2]);
and (one_sum134,in1[2],in3[2],in4[2]);
and (one_sum135,in1[2],in3[2],in5[2]);
and (one_sum145,in1[2],in4[2],in5[2]);
and (one_sum234,in2[2],in3[2],in4[2]);
and (one_sum235,in2[2],in3[2],in5[2]);
and (one_sum245,in2[2],in4[2],in5[2]);
and (one_sum345,in3[2],in4[2],in5[2]);

and (two_sum123,in1[1],in2[1],in3[1]);
and (two_sum124,in1[1],in2[1],in4[1]);
and (two_sum125,in1[1],in2[1],in5[1]);
and (two_sum134,in1[1],in3[1],in4[1]);
and (two_sum135,in1[1],in3[1],in5[1]);
and (two_sum145,in1[1],in4[1],in5[1]);
and (two_sum234,in2[1],in3[1],in4[1]);
and (two_sum235,in2[1],in3[1],in5[1]);
and (two_sum245,in2[1],in4[1],in5[1]);
and (two_sum345,in3[1],in4[1],in5[1]);

and (three_sum123,in1[0],in2[0],in3[0]);
and (three_sum124,in1[0],in2[0],in4[0]);
and (three_sum125,in1[0],in2[0],in5[0]);
and (three_sum134,in1[0],in3[0],in4[0]);
and (three_sum135,in1[0],in3[0],in5[0]);
and (three_sum145,in1[0],in4[0],in5[0]);
and (three_sum234,in2[0],in3[0],in4[0]);
and (three_sum235,in2[0],in3[0],in5[0]);
and (three_sum245,in2[0],in4[0],in5[0]);
and (three_sum345,in3[0],in4[0],in5[0]);

or (out2,one_sum123,one_sum124,one_sum125,one_sum134,one_sum135,one_sum145,one_sum234,one_sum235,one_sum245,one_sum345);
or (out1,two_sum123,two_sum124,two_sum125,two_sum134,two_sum135,two_sum145,two_sum234,two_sum235,two_sum245,two_sum345);
or (out0,three_sum123,three_sum124,three_sum125,three_sum134,three_sum135,three_sum145,three_sum234,three_sum235,three_sum245,three_sum345);
or (determin_out,out2,out1,out0);

xnor (xor1,in1[0],in2[0],in3[0],in4[0],in5[0]);
xnor (xor2,in1[1],in2[1],in3[1],in4[1],in5[1]);
xnor (xor3,in1[2],in2[2],in3[2],in4[2],in5[2]);

and (out3,xor1,xor2);
and (out4,xor2,xor3);
and (out5,xor1,xor3);

assign out3sum={out2,out1,out0};
assign out2sum={out5,out4,out3};

assign out=(determin_out)?out3sum:out2sum;

endmodule 