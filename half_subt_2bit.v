module hfs(A,B,diff,borrow);
input signed A,B;
output signed diff,borrow;
assign diff=A^B;
assign borrow=(~A)&B;
endmodule 