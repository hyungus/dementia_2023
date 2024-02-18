module cursor (clk, reset, xcoord, ycoord, hcnt, vcnt, cursorr, cursorg, cursorb);

input clk, reset;
input [1:0] xcoord, ycoord; // x좌표 ,y좌표 
input [10:0] vcnt;
input [11:0] hcnt;

output [7:0] cursorr, cursorg, cursorb;

wire clk, reset, outp0;
wire [1:0] xcoord, ycoord;
wire [10:0] vd0, vcnt;
wire [11:0] hcnt, addp0, hd0;

reg selp0;
reg [7:0] cursorr, cursorg, cursorb;

parameter hblank = 12'd700;
parameter vblank = 11'd536;
parameter hspace = 12'd32;
parameter vspace = 11'd32;
parameter hcspace = 12'd128;
parameter vcspace = 11'd16;
parameter vmovespace = 11'd128;

assign hd0 = hcnt - hblank - xcoord*(12'd160);
assign vd0 = vcnt - vblank - ycoord*(11'd160);
assign addp0 = {vd0[3:1], hd0[6:1]};

cursorpic u1 (.address(addp0), .clock(clk), .q(outp0));
      
always @(posedge clk)
begin
   
   if ((vcnt >= vblank + ycoord*(11'd160)) && (vcnt < vblank + vcspace + ycoord*(11'd160)) &&
	(hcnt >= hblank + xcoord*(12'd160)) && (hcnt < hblank + hcspace + xcoord*(12'd160)))
	
			selp0 <= 1'b1; // 0 - display, 1		
	
	else
			selp0 <= 1'b0; // 0 - not display
			
end	


always @(posedge clk or negedge reset)
begin
	if (reset == 1'b0)
		begin
		cursorr <= 8'd0;
		cursorg <= 8'd0;
		cursorb <= 8'd0;
		end
	
	else if (selp0 == 1'b1)
		begin
			if (outp0 == 1'd0)
				begin
				cursorr <= 8'd255;
				cursorg <= 8'd123;
				cursorb <= 8'd93;
				end
			
				
			else
				begin
				cursorr <= 8'd85;
				cursorg <= 8'd103;
				cursorb <= 8'd53;
				end
		end
		
	
		
	else
		begin
		cursorr <= 8'd0;
		cursorg <= 8'd0;
		cursorb <= 8'd0;
		end
end




endmodule		
		
		
		
		
	
