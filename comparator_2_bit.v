module comp_2_bit(A,B,gt,eq,lt);
input [1:0]A,B;
output gt,eq,lt;
// assign gt=($signed(A) > $signed(B));
// assign eq=($signed(A) == $signed(B));
// assign lt=($signed(A) < $signed(B));
assign eq=(~(A[1]^B[1]))&(~(A[0]^B[0]));
assign lt=(~A[0]&~A[1]&B[0])|(~A[1]&B[1])|(~A[0]&B[1]&B[0]);
assign gt=(~B[0]&~B[1]&A[0])|(~B[1]&A[1])|(~B[0]&A[1]&A[0]);
endmodule

