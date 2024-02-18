module coordsystem_data(clk, reset, NewKB, KB_DAT, xcoord, ycoord, data1, data2, key1, key2, datareset);

input NewKB, clk, reset, datareset;
input [7:0]	KB_DAT;

output key1, key2;
output [1:0] xcoord, ycoord;
output [4:0] data1, data2;

wire NewKB, clk, reset, datareset;
wire [7:0] KB_DAT;

reg key1, key2;
reg [1:0] xcoord, ycoord;
reg [3:0] data1, data2;

always @(posedge clk or negedge reset or posedge datareset)
	begin
	
		if(reset == 1'b0 || datareset == 1'b1)
			begin
				xcoord <= 2'b00;
				ycoord <= 2'b00;
				data1 <= 4'b0000;
				data2 <= 4'b0001;
				key1 <= 1'b0;
				key2 <= 1'b0;
			end
	
		else if(NewKB==1'b1 && KB_DAT==8'h74) // press right key -> xcoord+1
			xcoord <= xcoord + 2'b1;
			
			
		else if(NewKB==1'b1 && KB_DAT==8'h6B) // press left key -> xcoord-1
			xcoord <= xcoord - 2'b1;
	
	
		else if(NewKB==1'b1 && KB_DAT==8'h75) // press up key -> ycoord+1
			ycoord <= ycoord - 2'b1;
			
			
		else if(NewKB==1'b1 && KB_DAT==8'h72) // press down key -> ycoord-1
			ycoord <= ycoord + 2'b1;	
			
			
		else if(NewKB==1'b1)
			begin
				if(KB_DAT==8'h16)
					begin
					data1 <= {xcoord, ycoord};// press num1 key -> data1, 첫번째
					key1 <= 1'b1;
					
					end
					
				else if(KB_DAT==8'h1E)
					begin
					data2 <= {xcoord, ycoord};// press num2 key -> data1, 첫번째
					key2 <= 1'b1;
					end
			
				else
					begin
					key1 <= 1'b0;
					key2 <= 1'b0;
					end
			end
			
	end


endmodule