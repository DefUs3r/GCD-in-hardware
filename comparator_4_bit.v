`include "comparator_2_bit.v"
module comp_4_bit(A,B,gt,eq,lt);
input [3:0]A,B;
output gt,eq,lt;
wire [1:0]etmp,ltmp,gtmp;
comp_2_bit cp2A({A[3],A[2]},{B[3],B[2]},gtmp[1],etmp[1],ltmp[1]);
comp_2_bit cp2B({A[1],A[0]},{B[1],B[0]},gtmp[0],etmp[0],ltmp[0]);
assign eq=etmp[1]&etmp[0];
assign gt=gtmp[1]|etmp[1]&gtmp[0];
assign lt=ltmp[1]|etmp[1]&ltmp[0];
endmodule