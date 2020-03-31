`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 30.03.2020 22:02:55
// Design Name: 
// Module Name: laba1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module laba1(
    input [9:0] sw,
    output reg [6:0] hex,
    output [7:0] AN
	);
	
	assign AN=8'b1111_1110;
	wire [3:0] inv_sw;
	wire [3:0] dc1;
	assign inv_sw=~sw [3:0];
	assign dc1=inv_sw[0]+inv_sw[1]+inv_sw[2]+inv_sw[3];
	
	wire [3:0] dc2;
	assign dc2=sw[7:4]^4'b0111;

	wire f;
	assign f=(~sw[0])^(~sw[2])|(sw[2]&sw[3]);

	reg [3:0] mux;

	always@(*) begin
		case (sw[9:8])
		2'b00: mux=dc1;
		2'b01: mux=dc2;
		2'b10: mux=f;
		2'b11: mux=sw[3:0];
		endcase
	end
    
	always@(*) begin
		case (mux)
		4'd0:hex=7'b1000000;
		4'd1:hex=7'b1111001;
		4'd2:hex=7'b0100100;
		4'd3:hex=7'b0110000;
		4'd4:hex=7'b0011001;
		4'd5:hex=7'b0010010;
		4'd6:hex=7'b0000010;
		4'd7:hex=7'b1111000;
		4'd8:hex=7'b0000000;
		4'd9:hex=7'b0010000;
		4'd10:hex=7'b0001000;
		4'd11:hex=7'b0000011;
		4'd12:hex=7'b1000110;
		4'd13:hex=7'b0100001;
		4'd14:hex=7'b0000110;
		4'd15:hex=7'b0001110;
		endcase
	end
endmodule
