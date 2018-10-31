`include "comparator_8_bit.v"
module comp_16_bit(A,B,gt,eq,lt);
input [15:0]A,B;
output gt,eq,lt;
wire [1:0]gtmp,etmp,ltmp;
comp_8_bit cp8A({A[15],A[14],A[13],A[12],A[11],A[10],A[9],A[8]},{B[15],B[14],B[13],B[12],B[11],B[10],B[9],B[8]},gtmp[1],etmp[1],ltmp[1]);
comp_8_bit cp8B({A[7],A[6],A[5],A[4],A[3],A[2],A[1],A[0]},{B[7],B[6],B[5],B[4],B[3],B[2],B[1],B[0]},gtmp[0],etmp[0],ltmp[0]);
assign eq=etmp[1]&etmp[0];
assign gt=gtmp[1]|etmp[1]&gtmp[0];
assign lt=ltmp[1]|etmp[1]&ltmp[0];
endmodule