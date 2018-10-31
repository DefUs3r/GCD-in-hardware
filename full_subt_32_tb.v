`include "full_subt_2_bit.v"
module subt_32_test();
reg signed [31:0] A;
reg signed [31:0] B;
wire signed [31:0] op;
initial begin
$dumpfile("subt_32_dump.vcd");
$dumpvars(0,subt_32_test);
  A=478;
  B=219;
  #100;
  $display("Output = %d",op);
  A=-209;
  B=104;
  #100;
  $display("Output = %d",op);
  A=9;
  B=68;
  #100;
  $display("Output = %d",op);
  A=-4;
  B=5;
  #100;
  $display("Output = %d",op);
end
subt_32 test(.A(A),.B(B),.op(op));
endmodule