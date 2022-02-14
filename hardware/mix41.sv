module mix41(out, a, b, c, d, s0, s1);
input logic [3:0] a, b, c, d;
input logic s0 ,s1;
output logic [3:0]out;
logic [1:0]sel;
assign sel={s0,s1};
always_comb
case(sel) 
 2'b00 : out = a;
 2'b01 : out = b;
 2'b11 : out = c;
 2'b10 : out = d;
 default: out = 0;
endcase
endmodule 
