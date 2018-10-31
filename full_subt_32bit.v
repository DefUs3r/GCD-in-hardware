`include "full_subt_2_bit.v"
module subt_32(A,B,op);
input signed [31:0]A,B;
output signed [31:0] op;
wire [31:0]borrow;
wire bor_out;
genvar i;
for (i=0; i<32; i=i+1) begin:construct
if (i==0) 
hfs hfs1(A[0],B[0],op[0],borrow[0]);
else
full_subt fsb(A[i],B[i],borrow[i-1],op[i],borrow[i]);
end
assign bor_out=borrow[31];
endmodule