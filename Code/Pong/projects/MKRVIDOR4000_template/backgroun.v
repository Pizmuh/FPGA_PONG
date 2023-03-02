`timescale 1ns / 1ps
module background(
  input clock,
  output [2:0] red, 
  output [2:0] green, 
  output [1:0] blue,
  input reg [9:0] hcount, 
  input reg [9:0] vcount,
  input enable,
  output layer
  
);

assign layer = 0;



/// Slikica na zaslonu v bistvu ozadje
always @ (posedge clock)
begin
  if (enable)
  begin
  if ( (50 < hcount && hcount < 55 &&  vcount > 10 && vcount < 86 ) || (50 < hcount && hcount < 55 &&  vcount > 106 && vcount < 182) || (50 < hcount && hcount < 55 &&  vcount > 202 && vcount < 278)  || (50 < hcount && hcount < 55 &&  vcount > 298 && vcount < 374)|| (50 < hcount && hcount < 55 &&  vcount > 394 && vcount < 470)) //Leva meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (580 < hcount && hcount < 585 &&  vcount > 10 && vcount < 86 ) || (580 < hcount && hcount < 585 &&  vcount > 106 && vcount < 182) || (580 < hcount && hcount < 585 &&  vcount > 202 && vcount < 278)  || (580 < hcount && hcount < 585 &&  vcount > 298 && vcount < 374)|| (580 < hcount && hcount < 585 &&  vcount > 394 && vcount < 470)) //Desna meja
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
    else if ((hcount < 640 && vcount < 5) || (hcount < 640 && vcount < 480 && vcount > 475)) // Zgornja in zgornja obroba
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
    else if ((hcount < 5 && vcount < 480) || (hcount < 640 && vcount < 480 && hcount > 635)) // Leva in desna obroba 
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




endmodule
