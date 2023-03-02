`timescale 1ns / 1ps
module levi_drsnik(
  input clock,
  output [2:0] red, 
  output [2:0] green, 
  output [1:0] blue,
  input reg [9:0] hcount, 
  input reg [9:0] vcount,
  input enable,
  output layer,
  input inp1,
  input inp2
);

assign layer = 0;
reg [25:0] accumx = 0;
reg [8:0] count = 0; 
wire ppsx = (accumx == 0);



/// Slikica na zaslonu v bistvu ozadje

always @ (posedge clock)
begin
  if (enable)
  begin
	  if ( (560 < hcount && hcount < 570) &&  (vcount > count) && (vcount < 100 + count ) ) //Kvadratek
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 
    else 
    begin
      green <= 3'b000;
      blue <= 2'b00; 
      red <= 3'b000;
    end
  end 
end 


always @(posedge clock) 
begin
    accumx <= (ppsx ? 5_000_000 : accumx) - 1;
    if (ppsx) 
	 begin
		if ((inp1 == 0) && (count < 380)) // 480
		begin
			count <= count + 3 ;
		end
		else if ((inp2 == 0) && !(count == 0))
		begin
			count <= count - 3 ;
		end
	end
end
endmodule
