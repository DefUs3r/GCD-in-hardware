module tb_comparator;  
 reg [1:0] A, B;  
 wire gt,eq,lt;  
 integer i;  
 comp_2_bit dut(A,B,gt,eq,lt);  
 initial begin
 $dumpfile("2 bit comp.vcd");
 $dumpvars(0,tb_comparator);  
      for (i=0;i<4;i=i+1)  
      begin   
           A = i;  
           B = i + 1;  
           #20;  
      end   
      for (i=0;i<4;i=i+1)  
      begin   
           A = i;  
           B = i;  
           #20;  
      end   
      for (i=0;i<4;i=i+1)  
      begin   
           A = i+1;  
           B = i;  
           #20;  
      end   
 end   
 endmodule   