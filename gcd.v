`include "comparator_32_bit_v2.v"
`include "full_subt_32bit.v"
module gcd_fsm(A,B,clk,rst,op);
input [31:0] A,B;
input clk,rst;
reg [31:0] tmpA,tmpB;
output reg [31:0] op;
wire gt,eq,lt;
reg [1:0]state=2'b0;
wire [31:0]tmp,tmp1;


comp_32_bit_v2 cmp(tmpA,tmpB,gt,eq,lt);
subt_32 subgt(tmpA,tmpB,tmp);
subt_32 sublt(tmpB,tmpA,tmp1);

// tmpA=A;
// tmpB=B;
always @(posedge clk or negedge rst) begin
if (!rst) begin state<=2'b00;tmpA=0;tmpB=0;op=0; end
if (clk)begin
case (state)
  2'b00:
  begin
    tmpA=A;
    tmpB=B;
    if (gt)begin
      state=2'b01;
      tmpA=tmp;
    end 
      
    if (lt)begin
      state=2'b10;
      tmpB=tmp1;
    end 
    if (eq||tmpA==0||tmpB==0)begin
    state=2'b11; 
    end
  end
  2'b01:
  begin
    if (gt)begin tmpA=tmp;state=2'b01;end
    if (lt)begin tmpB=tmp1;state=2'b10;end
    if (eq||tmpA==0) state=2'b11;
  end
  2'b10:
  begin
    if (gt)begin tmpA=tmp;state=2'b01;end
    if (lt)begin tmpB=tmp1;state=2'b10;end
    if (eq||tmpB==0)begin state=2'b11;end
  end
  2'b11:
  begin
    if (tmpA==0 && tmpB==0)begin $display("Error"); end
    if (tmpA==0||eq)begin op=tmpB; end
    if (tmpB==0)begin op=tmpA;end
    // if (tmpA==A||tmpA==B) begin
      state=2'b00;
    // end
   // $display("Gcd of %d and %d is %d",A,B,op);
  end 
endcase
end
end

endmodule