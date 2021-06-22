module moddle (ina,inb,inc,out);

input [7:0] ina,inb,inc;
output [7:0] out;
wire [2:0] enA,enB,enC;

encoder U0 (ina,enA);
encoder U1 (inb,enB);
encoder U2 (inc,enC);

assign out=((enA<=enB && enA>=enC)||(enA<=enC && enA>=enB))? ina:((enB<=enA && enB>=enC)||(enB<=enC && enB>=enA))? inb:((enC<=enB && enC>=enA)||(enC<=enA && enC>=enB))? inc:out;

endmodule 
