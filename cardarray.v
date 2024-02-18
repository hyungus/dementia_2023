
module cardarray (reset, reset2, clk, hcnt, vcnt, cardr, cardg ,cardb, vsync, key1, key2, xcoord, ycoord, cnt4sec10, cnt4sec1,
memory0, memory1, memory2, memory3, memory4, memory5, memory6, memory7, memory8, memory9, memory10, memory11, memory12, memory13, memory14, memory15,
 flip0, flip1, flip2, flip3, flip4, flip5, flip6, flip7, flip8, flip9, flip10, flip11, flip12, flip13, flip14, flip15);

input reset, reset2, clk, vsync, key1, key2, flip0, flip1, flip2, flip3, flip4, flip5, flip6, flip7, flip8, flip9, flip10, flip11, flip12, flip13, flip14, flip15;
input [1:0] xcoord, ycoord;
input [3:0] cnt4sec10, cnt4sec1;
input [10:0] vcnt;
input [11:0] hcnt;

output [2:0] memory0, memory1, memory2, memory3, memory4, memory5, memory6, memory7, memory8, memory9, memory10, memory11, memory12, memory13, memory14, memory15;
output [7:0] cardr, cardg, cardb;

wire reset, reset2, clk, vsync, key1, key2, feedback, flip0, flip1, flip2, flip3, flip4, flip5, flip6, flip7, flip8, flip9, flip10, flip11, flip12, flip13, flip14, flip15;
wire [1:0] xcoord, ycoord, outp0, outp1, outp2, outp3, outp4, outp5, outp6, outp7, outpm0;
wire [2:0] memory0, memory1, memory2, memory3, memory4, memory5, memory6, memory7, memory8, memory9, memory10, memory11, memory12, memory13, memory14, memory15;
wire [3:0] cnt4sec10, cnt4sec1;
wire [10:0] vcnt, vd0, vd1, vd2, vd3;
wire [11:0] hcnt, hd0, hd1, hd2, hd3, addp0, addp1, addp2, addp3, addp4, addp5, addp6, addp7, addp8, addp9, addp10, addp11, addp12, addp13, addp14, addp15;

reg selp1, selp2, selp3, selp4, selp5, selp6, selp7, selp8, selp9, selp10, selp11, selp12, selp13, selp14, selp15;
reg [3:0] memory[15:0];
reg [3:0] counter;
reg [4:0] selp0;
reg [7:0] cardr, cardg, cardb;
reg [15:0] random;

parameter hblank = 12'd699;
parameter vblank = 11'd400;
parameter hspace = 12'd32;
parameter vspace = 11'd32;
parameter hcspace = 12'd128;
parameter vcspace = 11'd128;

assign hd0 = hcnt - hblank;
assign hd1 = hcnt - hblank - (hcspace + hspace);
assign hd2 = hcnt - hblank - 2*(hcspace + hspace);
assign hd3 = hcnt - hblank - 3*(hcspace + hspace);

assign vd0 = vcnt - vblank;
assign vd1 = vcnt - vblank - (vcspace + vspace);
assign vd2 = vcnt - vblank - 2*(vcspace + vspace);
assign vd3 = vcnt - vblank - 3*(vcspace + vspace);

assign addp0 = {vd0[6:1], hd0[6:1]};
assign addp1 = {vd0[6:1], hd1[6:1]};
assign addp2 = {vd0[6:1], hd2[6:1]};
assign addp3 = {vd0[6:1], hd3[6:1]};
assign addp4 = {vd1[6:1], hd0[6:1]};
assign addp5 = {vd1[6:1], hd1[6:1]};
assign addp6 = {vd1[6:1], hd2[6:1]};
assign addp7 = {vd1[6:1], hd3[6:1]};
assign addp8 = {vd2[6:1], hd0[6:1]};
assign addp9 = {vd2[6:1], hd1[6:1]};
assign addp10 = {vd2[6:1], hd2[6:1]};
assign addp11 = {vd2[6:1], hd3[6:1]};
assign addp12 = {vd3[6:1], hd0[6:1]};
assign addp13 = {vd3[6:1], hd1[6:1]};
assign addp14 = {vd3[6:1], hd2[6:1]};
assign addp15 = {vd3[6:1], hd3[6:1]};

assign feedback = random[3]^random[2];

assign memory0 = memory[0][2:0];
assign memory1 = memory[1][2:0];
assign memory2 = memory[2][2:0];
assign memory3 = memory[3][2:0];
assign memory4 = memory[4][2:0];
assign memory5 = memory[5][2:0];
assign memory6 = memory[6][2:0];
assign memory7 = memory[7][2:0];
assign memory8 = memory[8][2:0];
assign memory9 = memory[9][2:0];
assign memory10 = memory[10][2:0];
assign memory11 = memory[11][2:0];
assign memory12 = memory[12][2:0];
assign memory13 = memory[13][2:0];
assign memory14 = memory[14][2:0];
assign memory15 = memory[15][2:0];

colorcardpic u1 (.address(addp0), .clock(clk), .q(outp0));
colorcardpic u2 (.address(addp1), .clock(clk), .q(outp1));
colorcardpic u3 (.address(addp2), .clock(clk), .q(outp2));
colorcardpic u4 (.address(addp3), .clock(clk), .q(outp3));
colorcardpic u5 (.address(addp4), .clock(clk), .q(outp4));
colorcardpic u6 (.address(addp5), .clock(clk), .q(outp5));
colorcardpic u7 (.address(addp6), .clock(clk), .q(outp6));
colorcardpic u8 (.address(addp7), .clock(clk), .q(outp7));
colorcardpic u9 (.address(addp8), .clock(clk), .q(outp8));
colorcardpic u10 (.address(addp9), .clock(clk), .q(outp9));
colorcardpic u11 (.address(addp10), .clock(clk), .q(outp10));
colorcardpic u12 (.address(addp11), .clock(clk), .q(outp11));
colorcardpic u13 (.address(addp12), .clock(clk), .q(outp12));
colorcardpic u14 (.address(addp13), .clock(clk), .q(outp13));
colorcardpic u15 (.address(addp14), .clock(clk), .q(outp14));
colorcardpic u16 (.address(addp15), .clock(clk), .q(outp15));

colorcardpic u17 (.address(addpm0), .clock(clk), .q(outpm0));

// ------------------random maker-----------------------

always @(posedge clk or negedge reset2)
begin 
   if(reset2 == 1'b0)
      random<=4'hf;
      
   else
      random <= {random[2:0], feedback};

end


always @(posedge clk or negedge reset)
begin
   if(reset == 1'b0)
      counter <= 4'd0;

   else
      begin
         if(counter != 4'd15)
            begin
            memory[counter] <= random;
            counter <= counter + 4'd1;
            end
      end
end 

//------------------------card array----------------------

always @(posedge clk or negedge reset)
begin
   if (reset == 1'b0)
		begin
			selp0 <= 5'd16;
		end
	
   else if ((vcnt >= vblank) && (vcnt < vblank + vcspace + 11'd1) && (hcnt >= hblank) && (hcnt < hblank + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd0;
		
			else if (flip0 == 1'b1)
				selp0 <= 5'd0;
		
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b0000 )
            begin
               selp0 <= 5'd0;
				end
				
			else
					selp0 <= 5'd16;

      end   
         
   else if ((vcnt >= vblank) && (vcnt < vblank + vcspace + 11'd1) && (hcnt >= hblank + (hcspace + hspace)) && (hcnt < hblank + (hcspace + hspace) + hcspace))
      begin
         if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd1;

			else if (flip1 == 1'b1)
				selp0 <= 5'd1;				
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b0100)
             begin
               selp0 <= 5'd1;
             end

         else
            selp0 <= 5'd16;
      end   

   
         
   else if ((vcnt >= vblank) && (vcnt < vblank + vcspace + 11'd1) && (hcnt >= hblank + 2*(hcspace + hspace)) && (hcnt < hblank + 2*(hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd2;

			else if (flip2 == 1'b1)
				selp0 <= 5'd2;				
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b1000)
            begin
               selp0 <= 5'd2;
            end
				
         else
            selp0 <= 5'd16;
      end   
   
   
   else if ((vcnt >= vblank) && (vcnt < vblank + vcspace + 11'd1) && (hcnt >= hblank + 3*(hcspace + hspace)) && (hcnt < hblank + 3*(hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd3;

			else if (flip3 == 1'b1)
				selp0 <= 5'd3;				
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b1100 )
            begin
               selp0 <= 5'd3; 
            end
				
         else
            selp0 <= 5'd16;
      end   
   
   
   else if ((vcnt >= vblank + (vspace+vcspace)) && (vcnt < vblank + (vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank) && (hcnt < hblank + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd4;

			else if (flip4 == 1'b1)
				selp0 <= 5'd4;				
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b0001)
            begin
              selp0 <= 5'd4;
             end
				 
         else
            selp0 <= 5'd16;
      end
   
   
   else if ((vcnt >= vblank + (vspace+vcspace)) && (vcnt < vblank + (vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank + (hcspace + hspace)) && (hcnt < hblank + (hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd5;

			else if (flip5 == 1'b1)
				selp0 <= 5'd5;				
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b0101)
            begin
              selp0 <= 5'd5;
            end
				
         else
            selp0 <= 5'd16;
      end
   
   
   else if ((vcnt >= vblank + (vspace+vcspace)) && (vcnt < vblank + (vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank + 2*(hcspace + hspace)) && (hcnt < hblank + 2*(hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd6;

			else if (flip6 == 1'b1)
				selp0 <= 5'd6;				
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b1001)
            begin
              selp0 <= 5'd6;
            end
				
         else
            selp0 <= 5'd16;
      end
   
   
   else if ((vcnt >= vblank + (vspace+vcspace)) && (vcnt < vblank + (vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank + 3*(hcspace + hspace)) && (hcnt < hblank + 3*(hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd7;

			else if (flip7 == 1'b1)
				selp0 <= 5'd7;				
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b1101)
            begin
              selp0 <= 5'd7;
				end
				
         else
            selp0 <= 5'd16;
      end
   
   
   else if ((vcnt >= vblank + 2*(vspace+vcspace)) && (vcnt < vblank + 2*(vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank) && (hcnt < hblank + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd8;

			else if (flip8 == 1'b1)
				selp0 <= 5'd8;					
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b0010)
            begin
              selp0 <= 5'd8;
            end
				
         else
            selp0 <= 5'd16;
      end
   
      
   else if ((vcnt >= vblank + 2*(vspace+vcspace)) && (vcnt < vblank + 2*(vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank + (hcspace + hspace)) && (hcnt < hblank + (hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd9;

			else if (flip9 == 1'b1)
				selp0 <= 5'd9;					
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b0110)
           begin
             selp0 <= 5'd9;
           end
			  
         else
            selp0 <= 5'd16;
      end
   
      
   else if ((vcnt >= vblank + 2*(vspace+vcspace)) && (vcnt < vblank + 2*(vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank + 2*(hcspace + hspace)) && (hcnt < hblank + 2*(hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd10;

			else if (flip10 == 1'b1)
				selp0 <= 5'd10;					
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b1010)
            begin
               selp0 <= 5'd10;;
            end
				
         else
            selp0 <= 5'd16;
      end   
   
   else if ((vcnt >= vblank + 2*(vspace+vcspace)) && (vcnt < vblank + 2*(vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank + 3*(hcspace + hspace)) && (hcnt < hblank + 3*(hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd11;

			else if (flip11 == 1'b1)
				selp0 <= 5'd11;		
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b1110)
             begin
               selp0 <= 5'd11;
             end
				 
         else
            selp0 <= 5'd16;
      end
   
   else if ((vcnt >= vblank + 3*(vspace+vcspace)) && (vcnt < vblank + 3*(vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank) && (hcnt < hblank + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd12;

			else if (flip12 == 1'b1)
				selp0 <= 5'd12;						
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b0011)
            begin
              selp0 <= 5'd12;
            end
				
         else
           selp0 <= 5'd16;
      end   
   
      
   else if ((vcnt >= vblank + 3*(vspace+vcspace)) && (vcnt < vblank + 3*(vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank + (hcspace + hspace)) && (hcnt < hblank + (hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd13;

			else if (flip13 == 1'b1)
				selp0 <= 5'd13;						
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b0111)
            begin
              selp0 <= 5'd13;
            end
				
         else
            selp0 <= 5'd16;
      end      

      
      
   else if ((vcnt >= vblank + 3*(vspace+vcspace)) && (vcnt < vblank + 3*(vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank + 2*(hcspace + hspace)) && (hcnt < hblank + 2*(hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd14;

			else if (flip14 == 1'b1)
				selp0 <= 5'd14;						
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b1011)
            begin
              selp0 <= 5'd14;
            end
				
         else
           selp0 <= 5'd16;
      end
   
   
   else if ((vcnt >= vblank + 3*(vspace+vcspace)) && (vcnt < vblank + 3*(vspace+vcspace) + vcspace + 11'd1) && (hcnt >= hblank + 3*(hcspace + hspace)) && (hcnt < hblank + 3*(hcspace + hspace) + hcspace))
      begin
			if ({cnt4sec10, cnt4sec1} < 8'd5)
				selp0 <= 5'd15;

			else if (flip15 == 1'b1)
				selp0 <= 5'd15;						
				
         else if(((key1 == 1'b1) || (key2 == 1'b1)) && {xcoord, ycoord} == 4'b1111)
            begin
              selp0 <= 5'd15;
            end
				
         else
				begin
				selp0 <= 5'd16;
				end
      end

end   



always @(posedge clk or negedge reset)
begin
   if (reset == 1'b0)
      begin
      cardr <= 8'd0;
      cardg <= 8'd0;
      cardb <= 8'd0;
      end
		
   else if (selp0 == 5'd0)
      begin
         if (outp0 == 1'd0)
            begin
					if (memory0 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory0 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory0 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory0 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory0 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory0 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory0 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory0 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end

   else if (selp0 == 5'd1)
      begin
         if (outp1 == 1'd0)
            begin
					if (memory1 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory1 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory1 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory1 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory1 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory1 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory1 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory1 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd2)
       begin
         if (outp2 == 1'd0)
            begin
					if (memory2 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory2 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory2 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory2 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory2 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory2 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory2 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory2 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd3)
      begin
         if (outp3 == 1'd0)
            begin
					if (memory3 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory3 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory3 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory3 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory3 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory3 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory3 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory3 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd4)
       begin
         if (outp4 == 1'd0)
            begin
					if (memory4 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory4 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory4 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory4 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory4 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory4 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory4 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory4 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end

   else if (selp0 == 5'd5)
       begin
         if (outp5 == 1'd0)
            begin
					if (memory5 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory5 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory5 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory5 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory5 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory5 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory5 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory5 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd6)
       begin
         if (outp6 == 1'd0)
            begin
					if (memory6 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory6 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory6 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory6 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory6 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory6 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory6 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory6 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd7)
       begin
         if (outp7 == 1'd0)
            begin
					if (memory7 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory7 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory7 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory7 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory7 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory7 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory7 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory7 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd8)
        begin
         if (outp8 == 1'd0)
            begin
					if (memory8 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory8 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory8 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory8 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory8 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory8 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory8 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory8 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end

   else if (selp0 == 5'd9)
      begin
         if (outp9 == 1'd0)
            begin
					if (memory9 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory9 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory9 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory9 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory9 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory9 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory9 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory9 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end

		
   else if (selp0 == 5'd10)
       begin
         if (outp10 == 1'd0)
            begin
					if (memory10 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory10 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory10 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory10 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory10 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory10 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory10 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory10 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd11)
        begin
         if (outp11 == 1'd0)
            begin
					if (memory11 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory11 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory11 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory11 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory11 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory11 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory11 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory11 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd12)
      begin
         if (outp12 == 1'd0)
            begin
					if (memory12 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory12 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory12 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory12 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory12 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory12 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory12 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory12 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd13)
       begin
         if (outp13 == 1'd0)
            begin
					if (memory13 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory13 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory13 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory13 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory13 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory13 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory13 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory13 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd14)
       begin
         if (outp14 == 1'd0)
            begin
					if (memory14 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory14 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory14 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory14 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory14 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory14 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory14 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory14 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end


   else if (selp0 == 5'd15)
       begin
         if (outp15 == 1'd0)
            begin
					if (memory15 == 3'h0)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd0;
						end
						
					else if (memory15 == 3'h1)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd0;
						end		
					
					else if (memory15 == 3'h2)
						begin
							cardr <= 8'd0;
							cardg <= 8'd0;
							cardb <= 8'd200;						
						end

					else if (memory15 == 3'h3)
						begin
							cardr <= 8'd200;
							cardg <= 8'd200;
							cardb <= 8'd0;						
						end						
					
					else if (memory15 == 3'h4)
						begin
							cardr <= 8'd200;
							cardg <= 8'd0;
							cardb <= 8'd200;					
						end							

					else if (memory15 == 3'h5)
						begin
							cardr <= 8'd0;
							cardg <= 8'd200;
							cardb <= 8'd200;			
						end			

					else if (memory15 == 3'h6)
						begin
							cardr <= 8'd180;
							cardg <= 8'd180;
							cardb <= 8'd180;	
						end				
					
					else if (memory15 == 3'h7)
						begin
							cardr <= 8'd255;
							cardg <= 8'd102;
							cardb <= 8'd0;	
						end			
				end
		end

		
	else if (selp0 == 5'd16)
      begin
      cardr <= 8'd255;
      cardg <= 8'd255;
      cardb <= 8'd255;
      end
   
   else
      begin
      cardr <= 8'd0;
      cardg <= 8'd0;
      cardb <= 8'd0;
      end
end




endmodule