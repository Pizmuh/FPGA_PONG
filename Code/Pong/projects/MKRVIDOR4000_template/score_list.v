`timescale 1ns / 1ps
module score_list(
  input clock,
  output [2:0] red, 
  output [2:0] green, 
  output [1:0] blue,
  input reg [9:0] hcount, 
  input reg [9:0] vcount,
  input enable,
  output layer,
  input reg [9:0] score1,
  input reg [9:0] score2,
  output score,
  input menu
  
);

assign layer = 0;



/// Slikica na zaslonu v bistvu ozadje
always @ (posedge clock)
begin
  if (enable)
  begin
  

  if ( (10 < hcount && hcount < 40 &&  vcount > 10  && vcount < 86  ) && (score1 >= 1) ) //Leva meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (10 < hcount && hcount < 40 &&  vcount > 10 * 2 && vcount < 86 *2 ) && (score1 >= 2) ) //Leva meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (10 < hcount && hcount < 40 &&  vcount > 10 * 3 && vcount < 86 *3 ) && (score1 >= 3) ) //Leva meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (10 < hcount && hcount < 40 &&  vcount > 10 * 4 && vcount < 86 *4 ) && (score1 >= 4) ) //Leva meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (10 < hcount && hcount < 40 &&  vcount > 10 * 5 && vcount < 86 *5 ) && (score1 >= 5) ) //Leva meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
		
    end
	else if ( (600 < hcount && hcount < 640 &&  vcount > 10  && vcount < 86  ) && (score2 >= 1) ) //Desna meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (600 < hcount && hcount < 640 &&  vcount > 10 * 2 && vcount < 86 *2 ) && (score2 >= 2) ) //Leva meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (600 < hcount && hcount < 640 &&  vcount > 10 * 3 && vcount < 86 *3 ) && (score2 >= 3) ) //Leva meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (600 < hcount && hcount < 640 &&  vcount > 10 * 4 && vcount < 86 *4 ) && (score2 >= 4) ) //Leva meja 
    begin
      green <= 3'b11;
      blue <= 2'b11; 
      red <= 3'b111;
    end
	 else if ( (600 < hcount && hcount < 640 &&  vcount > 10 * 5 && vcount < 86 *5 ) && (score2 >= 5) ) //Leva meja 
    begin
      green <= 3'b11;
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
