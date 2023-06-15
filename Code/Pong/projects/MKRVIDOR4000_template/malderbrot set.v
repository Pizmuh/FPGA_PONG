`timescale 1ns / 1ps
module malderbrot(
  input clock,
  output [0:0] red, 
  output [0:0] green, 
  output [0:0] blue,
  input reg [9:0] hcount, 
  input reg [9:0] vcount,
  input enable,
  input reg [15:0] timer
 
);

 //Število iteracij preden se odločim odnehati

//reg [7:0] zaslon [100:0][100:0]; 


reg layer = 100; //Število iteracij preden se odločim odnehati

//reg [7:0] zaslon [100:0][100:0]; 
reg [9:0] c = 3;
reg signed [9:0] a = 0;
reg signed [9:0] b = 0;
reg [9:0] x = 0;
reg [9:0] y = 0;
reg [9:0] x1 = 0;
reg [9:0] y1 = 0;
reg [10:0] konec = 0;

reg [1:0] sub_px = 0;
reg [1:0] barva = 0;
reg [10:0] iteration = 255;

/// Slikica na zaslonu v bistvu ozadje

always @ (posedge clock)
begin
 if (enable)
  
  sub_px <= sub_px + 1;
  /* 
	 if (hcount > 5 && hcount < 635 && vcount > 5 && vcount < 475) //Kvadratek
    begin
      blue <= zaslon[hcount][vcount] >> 6; 
	 green <= zaslon[hcount][vcount] >> 3;
    red <= zaslon[hcount][vcount] >> 0;
    end*/
	 /*else if (2*vcount*hcount*100 + c*200 < 200) //Kvadratek
    begin
      green <= zaslon [hcount][vcount];
      blue <= zaslon [hcount][vcount] >> 2; 
      red <= zaslon [hcount][vcount] >> 3;
    end */
	 
    /*else 
    begin
      green <= 3'b000;
      blue <= 2'b00; 
      red <= 3'b000;
    end*/
	 a <= (hcount - 800/2) ;//-timer;
	 b <= (-(vcount - 600/2));
	 //for (int i = 0; i< layer; i++)begin
	 x <= a;
	 y<= b;
	 x1 <= a;
	 y1 <= b;
	 for (  konec = 0; konec<=10; konec++)begin
	 if ((a*a+b*b )<=(400))begin
		barva <= 1'b1;
		end
	 else
		begin
		barva <= 1'b0;
		a<= a*a+ b*b;
		b <= 2 * a * b;
		end
	end
	
	
	 //end
	if (hcount > 0 && hcount < 800 && vcount > 0 && vcount < 600) begin
	 //green <= timer>>10 + a;//{timer[2:0], timer[15:3]}
	   //a <= a - timer;
	   green <= 2'b10 == sub_px;//(a & 2'b01 >= sub_px);
      blue  <= 1'b1;//barva; 
      red   <= 1'b1;
	 end 
	 else begin
	   green <= 1'b0;
      blue <= 1'b0; 
      red <= 1'b0;
	 end
 end




/*
reg [3:0] neki = 0;
always @ (posedge clock)
begin

	for(int i = 0; i<100; i+=1)begin
		for(int j = 0; j<100; j+=1)begin
				zaslon [i][j] <= barve[hcount%8];
		end
	end 
	neki <= neki + 1'b1;

end
*/


endmodule
/*
module simple_dual_port_ram_single_clock
#(parameter DATA_WIDTH=8, parameter ADDR_WIDTH=6)
(
	input [(DATA_WIDTH-1):0] data,
	input [(ADDR_WIDTH-1):0] read_addr, write_addr,
	input we, clk,
	output reg [(DATA_WIDTH-1):0] q
);

	// Declare the RAM variable
	reg [DATA_WIDTH-1:0] ram[2**ADDR_WIDTH-1:0];

	always @ (posedge clk)
	begin
		// Write
		if (we)
			ram[write_addr] <= data;

		// Read (if read_addr == write_addr, return OLD data).	To return
		// NEW data, use = (blocking write) rather than <= (non-blocking write)
		// in the write assignment.	 NOTE: NEW data may require extra bypass
		// logic around the RAM.
		q <= ram[read_addr];
	end

endmodule*/