`include "half_subt_2bit.v"
module full_subt(A,B,borrow_prev,diff,borrow_nxt);
input signed A,B,borrow_prev;
output signed diff,borrow_nxt;
wire tmp_diff,tmp_borrow1,tmp_borrow2;
//hfs S1(B,borrow_prev,tmp_diff,tmp_borrow1);
//hfs S2(A,tmp_diff,diff,tmp_borrow2);
assign diff=(A^B)^borrow_prev;
assign borrow_nxt=(((~A)&(~B))&borrow_prev)|(((~A)&(B))&(~borrow_prev))|(((~A)&(B))&borrow_prev)|(((A)&(B))&borrow_prev);
endmodule 