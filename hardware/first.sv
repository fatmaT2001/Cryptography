module first (reset,clk,s,an,sseg);
input logic reset ,clk;
input logic [1:0]s;
output logic [3:0]an;
output logic [7:0]sseg;
logic [3:0]first,second,third,forth;
not (resetbar,reset);
mix41 firstletter(first,4'b0011,4'b0011,4'b0101,4'b0000,s[0],s[1]); //mix41(out, a, b, c, d, s0, s1);
mix41 secondletter(second,4'b0010,4'b0110,4'b0100,4'b0011,s[0],s[1]); 
mix41 thiredletter(third,4'b0100,4'b0000,4'b0000,4'b1000,s[0],s[1]); 
mix41 forthletter(forth,4'b0101,4'b0111,4'b1000,4'b1000,s[0],s[1]); 
disp_hex_mux out1 (clk,resetbar,first,second,third,forth,4'b1111,an,sseg);
endmodule
