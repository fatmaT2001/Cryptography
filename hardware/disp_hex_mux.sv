module disp_hex_mux
(
input logic clk, reset,
input logic [3:0] hex3 , hex2 , hex1, hex0, // hex digits
input logic [3:0] dp_in , // 4 decimal points
output logic [3:0] an, // enable 1— out— of— 4 asserted low
output logic [7:0] sseg // led segments
) ;
// constant declaration
// refreshing rate around 800 Hz (50 MHz/2^16)
localparam N = 18; // real
//localparam N = 4; //simulation
// internal signal declaration
logic [N-1:0] q_reg;
wire [N-1:0] q_next;
logic [3:0] hex_in;
logic dp;
// N— bit counter
// register
always_ff @(posedge clk, posedge reset)
if (reset)
q_reg <= 0;
else
q_reg <= q_next ;
// next - state logic
assign q_next = q_reg + 1;
// 2 MSBs of counter to control 4— to— l multiplexing
// and to generate active— low enable signal
always_comb
case (q_reg[N-1:N-2])
2'b00:
begin
	an = 4'b0001; //e hex
	hex_in = hex0;
	dp = dp_in[0];
end
2'b01:
begin
	an = 4'b0010; //d hex
	hex_in = hex1;
	dp = dp_in[1];
end
2'b10:
begin
	an = 4'b0100; //b hex
	hex_in = hex2;
	dp = dp_in[2];
end
default :
begin
	an = 4'b1000; //7 hex
	hex_in = hex3;
	dp = dp_in[3];
end
endcase
// hex to seven —segment led display
always_comb
begin
case(hex_in)	 //   abcdefg
4'h0: sseg[6:0] = 7'B0001000;  				// 01 in hex A
4'h1: sseg[6:0] = 7'b0010000;					// 4F in hex 
4'h2: sseg[6:0] = 7'b0110000;					// 12 in hex E
4'h3: sseg[6:0] = 7'b1001000;					// 06 in hex H
4'h4: sseg[6:0] = 7'b1110001;					// 4C in hex L
4'h5: sseg[6:0] = 7'b0011000;					// 24 in hex P
4'h6: sseg[6:0] = 7'b1111001;					// 20 in hex i
4'h7: sseg[6:0] = 7'b1110000;					// 0F in hex t
4'h8: sseg[6:0] = 7'b0001001;					// 00 in hex N
4'h9: sseg[6:0] = 7'b0000001;					// 04 in hex f
4'ha: sseg[6:0] = 7'b0001000;					// 08 in hex R
4'hb: sseg[6:0] = 7'b1100000;					// 60 in hex
4'hc: sseg[6:0] = 7'b0110001;					// 31 in hex
4'hd: sseg[6:0] = 7'b1000010;					// 42 in hex
4'he: sseg[6:0] = 7'b0110000;					// 30 in hex
default: sseg[6:0] = 7'b0111000; //4â€™hf character  38 in hex
endcase
end
endmodule
