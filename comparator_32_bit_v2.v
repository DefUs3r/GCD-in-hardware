`include "comparator_16_bit.v"
module comp_32_bit_v2(A,B,gt,eq,lt);
input [31:0] A,B;
output gt,eq,lt;
wire [1:0] gtmp,etmp,ltmp;
comp_16_bit cp16A(A[31:16],B[31:16],gtmp[1],etmp[1],ltmp[1]);
comp_16_bit cp16B(A[15:0],B[15:0],gtmp[0],etmp[0],ltmp[0]);
assign eq=etmp[1]&etmp[0];
assign gt=gtmp[1]|etmp[1]&gtmp[0];
assign lt=ltmp[1]|etmp[1]&ltmp[0];
endmodule