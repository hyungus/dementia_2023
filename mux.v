
module mux(clk, reset, vcnt, hcnt, cursorr, cursorg, cursorb, cardr, cardg, cardb, backr, backg, backb, gameoverr, gameoverg, gameoverb, 
r, g, b, xcoord, ycoord, gameendtimeover, gameendccount);

input clk, reset, gameendtimeover, gameendccount;
input [1:0] xcoord, ycoord;
input [7:0] cursorr, cursorg, cursorb, cardr, cardg, cardb, backr, backg, backb, gameoverr, gameoverg, gameoverb;
input [10:0] vcnt;
input [11:0] hcnt;

output [7:0] r, g, b;

wire clk, reset, gameendtimeover, gameendccount;
wire [1:0] xcoord, ycoord;
wire [7:0] cursorr, cursorg, cursorb, cardr, cardg, cardb, backr, backg, backb, gameoverr, gameoverg, gameoverb;
wire [10:0] vcnt;
wire [11:0] hcnt;

reg [2:0] sel;
reg [7:0] r, g, b;

always @(posedge clk or negedge reset)
begin
	if(reset == 1'b0)
		begin
		sel <= 3'd0;
		end
	
	else if(gameendtimeover == 1'b1 || gameendccount == 1'b1) // gameover
		begin
			if ((vcnt >= 11'd25) && (vcnt < 11'd676))
				sel <= 3'd4;  
		end
	
	else if((vcnt >= 11'd536 + ycoord*11'd160) && (vcnt <= 12'd552 + ycoord*11'd160) &&
				(hcnt >= 12'd700 + xcoord*12'd160) && (hcnt <= 12'd828 + xcoord*12'd160)) // cursor region
		sel <= 3'd1;
		
	else if((vcnt >= 11'd400) && (vcnt <= 11'd528) && (hcnt >= 12'd700) && (hcnt <= 12'd828)) // color card region
		begin
		sel <= 3'd2;
		
		end
	else if((vcnt >= 11'd400) && (vcnt <= 11'd528) && (hcnt >= 12'd700 + 12'd160) && (hcnt <= 12'd828 + 12'd160)) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400) && (vcnt <= 11'd528) && (hcnt >= 12'd700 + 2*(12'd160)) && (hcnt <= 12'd828 + 2*(12'd160))) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400) && (vcnt <= 11'd528) && (hcnt >= 12'd700 + 3*(12'd160)) && (hcnt <= 12'd828 + 3*(12'd160))) // color card region
		sel <= 3'd2;	

	else if((vcnt >= 11'd400 + 11'd160) && (vcnt <= 11'd528 + 11'd160) && (hcnt >= 12'd700) && (hcnt <= 12'd828)) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400 + 11'd160) && (vcnt <= 11'd528 + 11'd160) && (hcnt >= 12'd700 + 12'd160) && (hcnt <= 12'd828 + 12'd160)) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400 + 11'd160) && (vcnt <= 11'd528 + 11'd160) && (hcnt >= 12'd700 + 2*(12'd160)) && (hcnt <= 12'd828 + 2*(12'd160))) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400 + 11'd160) && (vcnt <= 11'd528 + 11'd160) && (hcnt >= 12'd700 + 3*(12'd160)) && (hcnt <= 12'd828 + 3*(12'd160))) // color card region
		sel <= 3'd2;	

	else if((vcnt >= 11'd400 + 2*(11'd160)) && (vcnt <= 11'd528 + 2*(11'd160)) && (hcnt >= 12'd700) && (hcnt <= 12'd828)) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400 + 2*(11'd160)) && (vcnt <= 11'd528 + 2*(11'd160)) && (hcnt >= 12'd700 + 12'd160) && (hcnt <= 12'd828 + 12'd160)) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400 + 2*(11'd160)) && (vcnt <= 11'd528 + 2*(11'd160)) && (hcnt >= 12'd700 + 2*(12'd160)) && (hcnt <= 12'd828 + 2*(12'd160))) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400 + 2*(11'd160)) && (vcnt <= 11'd528 + 2*(11'd160)) && (hcnt >= 12'd700 + 3*(12'd160)) && (hcnt <= 12'd828 + 3*(12'd160))) // color card region
		sel <= 3'd2;	
		
	else if((vcnt >= 11'd400 + 3*(11'd160)) && (vcnt <= 11'd528 + 3*(11'd160)) && (hcnt >= 12'd700) && (hcnt <= 12'd828)) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400 + 3*(11'd160)) && (vcnt <= 11'd528 + 3*(11'd160)) && (hcnt >= 12'd700 + 12'd160) && (hcnt <= 12'd828 + 12'd160)) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400 + 3*(11'd160)) && (vcnt <= 11'd528 + 3*(11'd160)) && (hcnt >= 12'd700 + 2*(12'd160)) && (hcnt <= 12'd828 + 2*(12'd160))) // color card region
		sel <= 3'd2;
	else if((vcnt >= 11'd400 + 3*(11'd160)) && (vcnt <= 11'd528 + 3*(11'd160)) && (hcnt >= 12'd700 + 3*(12'd160)) && (hcnt <= 12'd828 + 3*(12'd160))) // color card region
		sel <= 3'd2;			
	
	
		
	else // background
		begin
		sel <= 3'd3;
		end
end

always @(posedge clk or negedge reset)
begin
	if(reset == 1'b0)
	begin
		r <= 8'd0;
		g <= 8'd0;
		b <= 8'd0;
	end
	else if (sel == 3'd0)
	begin
		r <= 8'd0;
		g <= 8'd0;
		b <= 8'd0;
	end
	
	else if (sel == 3'd1)
	begin
		r <= cursorr;
		g <= cursorg;
		b <= cursorb;
	end
	
	else if (sel == 3'd2)
	begin
		r <= cardr;
		g <= cardg;
		b <= cardb;
	end
	
	else if (sel == 3'd3)
	begin
		r <= backr;
		g <= backg;
		b <= backb;
	end
	
	else if (sel == 3'd4)
	begin
		r <= gameoverr;
		g <= gameoverg;
		b <= gameoverb;
	end
	
end


endmodule
