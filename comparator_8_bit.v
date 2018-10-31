`include "comparator_4_bit.v"
module comp_8_bit(A,B,gt,eq,lt);
input [7:0]A,B;
output gt,eq,lt;
wire [1:0]gtmp,etmp,ltmp;
comp_4_bit cp4A({A[7],A[6],A[5],A[4]},{B[7],B[6],B[5],B[4]},gtmp[1],etmp[1],ltmp[1]);
comp_4_bit cp4B({A[3],A[2],A[1],A[0]},{B[3],B[2],B[1],B[0]},gtmp[0],etmp[0],ltmp[0]);
assign eq=etmp[1]&etmp[0];
assign gt=gtmp[1]|etmp[1]&gtmp[0];
assign lt=ltmp[1]|etmp[1]&ltmp[0];
endmodule