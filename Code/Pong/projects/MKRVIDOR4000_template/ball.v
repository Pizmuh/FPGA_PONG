`timescale 1ns / 1ps
module ball(
  input clock,
  output [0:0] red, 
  output [0:0] green, 
  output [0:0] blue,
  
  
  input reg [9:0] hcount, 
  input reg [9:0] vcount,
  input enable,
  output layer,
  input inp1,
  input inp2,
  input inp3,
  input inp4,
  input smerx,
  input maks,
  output reg [9:0] score1,
  output reg [9:0] score2
  
);

assign layer = 0;
reg smery = 1;
reg countRx = 0;
reg countRy = 0;

/// Slikica na zaslonu v bistvu ozadje

always @ (posedge clock)
begin
  if (enable)
  begin
    
	 //if ((county < vcount && vcount < county + 15) && (countx < hcount && hcount < countx + 10))//Kvadratek
	 if ((hcount - countx-10)**2 + (vcount-county-10)**2 < 100)
    begin
      green <= 1'b1;
      blue <= 1'b1;
      red <= 1'b1;
    end
	 
    else 
    begin
      green <= 1'b0;
      blue <= 1'b0; 
      red <= 1'b0;
    end
  end 
end 


reg [25:0] accumx = 0;
reg [25:0] accumy = 0;
reg [9:0] countx = 0;
reg [8:0]county = 0;
reg [8:0] count1 = 0;
reg [8:0] count2 = 0; 
reg [8:0] count = 0; 

wire ppsx = (accumx == 0);
wire ppsy = (accumy == 0);

reg prev_inp1 = 0;
reg prev_inp2 = 0;



always @(posedge clock) 
begin
    
	accumy <= (ppsy ? 5_000_000 : accumy) - 1;
 if (ppsy) 
	begin
	if (county <= 5 ) // 480
	begin
		smery <= 1;
	end
	else if (county >= 460 )
	begin
		smery <= 0;		
	end

		if (smery == 1)
			begin
				county <= county + 3;
			  //… things to do once per second 1 = 50 000 000 …
		 end
		else if (smery == 0)
			begin
				county <= county - 3;
			  //… things to do once per second 1 = 50 000 000 …
		end
	end
	
	
	 
end


always @(posedge clock) 
begin
    
	accumx <= (ppsx ? 5_000_000 : accumx) - 1;
 if (ppsx) 
	begin


	
	//Premikanje
	
	if ((smerx == 0) && (countRx == 0))
		begin
			countx <= countx + 3;
		  //… things to do once per second 1 = 50 000 000 …
	 end
	else if ((smerx == 1) && (countRx == 0))
		begin
			countx <= countx - 3;
		  //… things to do once per second 1 = 50 000 000 …
		end
	end
	
	
	
	//score
	if ((countx <= 55 ) )
		begin
			score1 <= score1 + 1;
			countx <= 250;
			
	 end
	else if ((countx >= 570) )
	begin
			score2 <= score2 + 1;
			countx <= 250;	
	end
	
	if ((score1 >= 5) && (inp4 == 0))
	begin
		score1 <= 0;
		score2 <= 0;
	end
	else if ((score2 >= 5) && (inp3 == 0))
	begin
		score1 <= 0;
		score2 <= 0;
	end
	
	
	
	

	
end

// input spreminja pozicije x in y

endmodule
