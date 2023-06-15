`timescale 1ns / 1ps
module menu(
  input clock,
  output [2:0] red, 
  output [2:0] green, 
  output [1:0] blue,
  input reg [11:0]  hcount, 
  input reg  [11:0] vcount,
  input enable,
  output layer,
  inout menu,
  input inp3,
  input inp4
);

assign layer = 1;



/// Slikmica na zaslonu v bistvu ozadje

always @ (posedge clock)
begin
  if (enable)
  begin
	 if ( hcount == vcount) 
	 begin
		green <= 3'b111;
		blue <= 2'b11; 
		red <= 3'b111;
	 end
	 else 
	 begin
		green <= 3'b111;
		blue <= 2'b11; 
		red <= 3'b111;
	end
	end
	else 
	 begin
		green <= 3'b000;
		blue <= 2'b00; 
		red <= 3'b000;
	end
end 






endmodule
