`timescale 1ns / 1ps
module background_color(
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

reg xpozicija = 200;
reg ypozicija = 200;
reg presledek = 50; 
reg piksel = 10;

/// Slikica na zaslonu v bistvu ozadje

always @ (posedge clock)
begin
  if (enable)
  begin
    if (hcount < 80 && vcount < 480)
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b111;
    end
    else if (hcount < 160 && vcount < 480) 
    begin
      green <= 3'b111;
      blue <= 2'b00; 
      red <= 3'b111;
    end
    else if (hcount < 240 && vcount < 480)
    begin
      green <= 3'b111;
      blue <= 2'b11; 
      red <= 3'b000;
    end
    else if (hcount < 320 && vcount < 480)
    begin
      green <= 3'b111;
      blue <= 2'b00; 
      red <= 3'b000;
    end
    else if (hcount < 400 && vcount < 480)
    begin
      green <= 3'b000;
      blue <= 2'b11; 
      red <= 3'b111;
    end
    else if (hcount < 480 && vcount < 480)
    begin
      green <= 3'b000;
      blue <= 2'b00; 
      red <= 3'b111;
    end
    else if (hcount < 560 && vcount < 480)
    begin
      green <= 3'b000;
      blue <= 2'b11; 
      red <= 3'b000;
    end
    else if (hcount < 640 && vcount < 480)
    begin
      green <= 3'b000;
      blue <= 2'b00; 
      red <= 3'b000;
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
