module gcd_test();
reg [31:0] A,B;
reg clk=0,rst=1;
wire [31:0] op;
always begin #100;clk=~clk;end
initial begin
  $dumpfile("gcd_dump.vcd");
  $dumpvars(0,gcd_test);
  A<=15;B<=6;
  #10000;
  $display("GCD of %d and %d => %d",A,B,op);
  A<=6;B<=20;
  #10000;
  $display("GCD of %d and %d => %d",A,B,op);
  A<=10;B<=10;
  #10000;
  $display("GCD of %d and %d => %d",A,B,op);
  A<=94665;B<=544257;
  #1000000;
  $display("GCD of %d and %d => %d",A,B,op);
  A<=15625;B<=3125;
  #1000000;
  $display("GCD of %d and %d => %d",A,B,op);
  $finish;
end
gcd_fsm dut(A,B,clk,1'b1,op);
endmodule