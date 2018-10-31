`include "comparator_32_bit_v2.v"
module comp_32_test();
reg [31:0]A,B;
wire gt,eq,lt;
comp_32_bit_v2 test(A,B,gt,eq,lt);
initial begin
  $dumpfile("comparator32bit_dump.vcd");
  $dumpvars(0,comp_32_test);
  A<=100;
  B<=25;
  #1000;
  A=468;
  B=468;
  #1000;
  A=33;
  B=99;
  #1000;
  $finish;
end
initial begin
  $display("Gt => %d ------ Eq => %d ------- Lt => %d",gt,eq,lt);
end
endmodule