`timescale 1ns / 1ps
module VGA_GAME(
  input clock,
  output reg [0:0 ] red_F, 
  output reg [0:0 ] green_F, 
  output reg [0:0 ] blue_F,
  output reg hsync, 
  output reg vsync,
  input inp1,
  input inp2,
  input inp3,
  input inp4
);

reg layer = 0;

reg red = 0;
reg green = 0;
reg blue = 0;

reg R1 = 0;
reg G1 = 0;
reg B1 = 0;

reg R2 = 0;
reg G2 = 0;
reg B2 = 0;

reg R3 = 0;
reg G3 = 0;
reg B3 = 0;

reg R4 = 0;
reg G4 = 0;
reg B4 = 0;

reg R5 = 0;
reg G5 = 0;
reg B5 = 0;

reg R6 = 0;
reg G6 = 0;
reg B6 = 0;

reg R7 = 0;
reg G7 = 0;
reg B7 = 0;

reg smerx = 0;
reg smery = 0;
reg menu = 0;

reg L1;
reg L2;
reg L3;
reg L4;
reg L5;
reg L6;

reg maks = 5; ///maksimalen score

reg [3:0] score1;
reg [3:0] score2;

reg [11:0] hcount = 0;
reg [11:0] vcount = 0;
reg [1:0] counter = 0;
reg enable;




reg COLOUR_DATA = 0;

// sinhronizacija VGA zaslona
always @ (posedge clock)
begin
  if (counter == 2)
  begin
    counter <= 1'b0;
    enable <= 1'b1;
  end
  else
  begin
    counter <= counter + 1'b1;
    enable <= 1'b0;
  end
end

always @(posedge clock)
begin
  if (enable == 1)
  begin
    if(hcount == 1055)
    begin
      hcount <= 0;
		if(vcount == 627)
		  vcount <= 0;
      else 
        vcount <= vcount+1'b1;
    end
    else
      hcount <= hcount+1'b1;

  if (vcount >= 601 && vcount < 605) 
    vsync <= 1'b0;
  else
    vsync <= 1'b1;

  if (hcount >= 840 && hcount < 968) 
    hsync <= 1'b0;
  else
    hsync <= 1'b1;
  end
end


//timer
reg [23:0] steti = 0;
reg [7:0] timer = 1;
always @ (posedge clock)
begin
  if (steti == 0)
  begin
    steti <= 1'b1;
    timer <= timer + 1;
  end
  else
  begin
    steti <= steti + 1'b1;
  end
end



// upravljanje layerjev


always @ (posedge clock)
begin
	
	
	//$readmemh ("picture.hex", COLOUR_DATA); ////neki bere nvm ce dela
	

	
	if (score1 > 5)
  begin
		
	 red_F <= R5;
      blue_F <= B5; 
      green_F <= G5;
 
  end
  else if (score2 > 5)
  begin
	 red_F <= R1;
    blue_F <= B1; 
    green_F <= G1;
	end
  else
  begin
   
    if ((R1 != 0) || (G1 != 0) || (B1 != 0))
    begin
       red_F <= R1; 
		 green_F <= G1; 
		 blue_F <= B1; 
    end
    else if ((R2 != 0) || (G2 != 0) || (B2 != 0))
    begin
       red_F <= R2;
		 green_F <= G2;
		 blue_F <= B2;
    end
	 else if ((R4 != 0) || (G4 != 0) || (B4 != 0))
    begin
       red_F <= R4;
		 green_F <= G4;
		 blue_F <= B4;
    end
	 else if ((R5 != 0) || (G5 != 0) || (B5 != 0))
    begin
       red_F <= R5;
		 green_F <= G5;
		 blue_F <= B5;
    end
	 else if ((R6 != 0) || (G6 != 0) || (B6 != 0))
    begin
       red_F <= R6;
		 green_F <= G6;
		 blue_F <= B6;
    end
	/* else if ((R7 != 0) || (G7 != 0) || (B7 != 0))
    begin
       red_F <= R7;
		green_F <= G7;
		blue_F <= B7;
    end */
	 else
	 begin
		red_F <= 1'b0;
      blue_F <= 1'b0; 
      green_F <= 1'b0;
  end 
 end
end 


// Phisycal engine za žogico 


reg [25:0] accumx = 0;

wire ppsx = (accumx == 0);

always @(posedge clock) 
begin
	if ((R1 == R4) && (R4 != 0)) 
	begin
		smerx <= 0;
	end
	else if ((R5 == R4) && (R4 != 0)) 
	begin
		smerx <= 1;
	end
end




 
 
 //Klicanje lajerjev
game_object game_object_inst
	(
	.clock(clock),
	.red(R1),
	.green(G1),
	.blue(B1),
	.hcount(hcount),
	.vcount(vcount),
	.enable(enable),
	.layer(L1),
	.inp1(inp1),
	.inp2(inp2)
	);
	
levi_drsnik levi_drsnik_inst
	(
	.clock(clock),
	.red(R5),
	.green(G5),
	.blue(B5),
	.hcount(hcount),
	.vcount(vcount),
	.enable(enable),
	.layer(L5),
	.inp1(inp1),
	.inp2(inp2)
	);

background background_inst
	(
	.clock(clock),
	.red(R2),
	.green(G2),
	.blue(B2),
	.hcount(hcount),
	.vcount(vcount),
	.enable(enable),
	.layer(L2)
	);
malderbrot malderbrot_inst
	(
	.clock(clock),
	.red(R7),
	.green(G7),
	.blue(B7),
	.hcount(hcount),
	.vcount(vcount),
	.enable(enable),
	.timer(timer)
	
	);
	
 
menu menu_inst
	(
	.clock(clock),
	.red(R3),
	.green(G3),
	.blue(B3),
	.hcount(hcount),
	.vcount(vcount),
	.enable(enable),
	.layer(L3),
	.menu(menu1),
	.inp3(inp3),
	.inp4(inp4)
	);
	
ball ball_inst
	(
	.clock(clock),
	.red(R4),
	.green(G4),
	.blue(B4),
	.hcount(hcount),
	.vcount(vcount),
	.enable(enable),
	.layer(L4),
	.inp3(inp3),
	.inp4(inp4),
	.maks(maks),
	.smerx(smerx),
	.score1(score1),
	.score2(score2)
	);

score_list score_list_inst
	(
	.clock(clock),
	.red(R6),
	.green(G6),
	.blue(B6),
	.hcount(hcount),
	.vcount(vcount),
	.enable(enable),
	.layer(L6),
	.score1(score1),
	.score2(score2),
	.menu(menu1)
	);
	
endmodule

