module background (clk, reset, backr, backg, backb, hcnt, vcnt, cnt4sec1, cnt4sec10, ccount, wcount);

input clk, reset;
input [11:0] hcnt;
input [10:0] vcnt;
input [3:0] cnt4sec1, cnt4sec10;
input [3:0] ccount, wcount;
output [7:0] backr, backg, backb;

wire clk, reset;
wire [1:0] outp0, outp1, outp2, outp3, outp4, outp5, outp6, outp7, outp10, outp11, outp12, outp13, outp14, outp15, outp16, outp17, outp18, outp19,
outp20, outp21, outp22, outp23, outp24, outp25, outp26, outp27, outp28, outp29, outp30, outp31, outp32, outp33, outp34, outp35, outp36, outp37, outp38, outp39,
 outp40, outp41, outp42, outp43, outp44, outp45, outp46, outp47, outp48, outp49;
wire [3:0] ccount, wcount, cnt4sec1, cnt4sec10;
wire [10:0] vcnt, vd0, vd3, vd6, vd7, vd10;
wire [11:0] addp0, addp1, addp2, addp3, addp4, addp5, addp10, addp11, addp12, addp13, addp14, addp15, addp16, addp17, addp18, addp19, hd0, hd1, hd2, hd3, hd4, hd5, hd6, hd7, hd10, hd11, hd12, hd13, hcnt;
wire [20:0] addp6, addp7;

reg selp0, selp1, selp2, selp3, selp4, selp5, selp6, selp7, selp10, selp11, selp12, selp13, selp14, selp15, selp16, selp17, selp18, selp19,
selp20, selp21, selp22, selp23, selp24, selp25, selp26, selp27, selp28, selp29, selp30, selp31, selp32, selp33, selp34, selp35, selp36, selp37, selp38, selp39,
selp40, selp41, selp42, selp43, selp44, selp45, selp46, selp47, selp48, selp49;
reg [7:0] backr, backg, backb;

parameter backgroundr = 8'd0;
parameter backgroundg = 8'd0;
parameter backgroundb = 8'd0;

parameter staticpicr = 8'd200;
parameter staticpicg = 8'd100;
parameter staticpicb = 8'd100;

assign hd0 = hcnt - 12'd50;
assign hd1 = hcnt - 12'd780;
assign hd2 = hcnt - 12'd1350;
assign hd3 = hcnt - 12'd630;
assign hd4 = hcnt - 12'd1179;
assign hd5 = hcnt - 12'd1749;

assign hd6 = hcnt - 12'd80; // chemei pic left
assign hd7 = hcnt - 12'd1360; // gabojago pic right

assign hd10 = hcnt - 12'd330;
assign hd11 = hcnt - 12'd480;
assign hd12 = hcnt - 12'd1050;
assign hd13 = hcnt - 12'd1620;

assign vd0 = vcnt - 11'd40;
assign vd3 = vcnt - 11'd100;
assign vd7 = vcnt - 11'd450; // chemei pic left, gabojago pic right
assign vd10 = vcnt - 11'd100;

assign addp0 = {vd0[7:2], hd0[7:2]};
assign addp1 = {vd0[7:2], hd1[7:2]};
assign addp2 = {vd0[7:2], hd2[7:2]};
assign addp3 = {vd3[6:1], hd3[6:1]};
assign addp4 = {vd3[6:1], hd4[6:1]};
assign addp5 = {vd3[6:1], hd5[6:1]};

assign addp6 = {vd7[8:0], hd6[8:0]};
assign addp7 = {vd7[8:1], hd7[8:1]};

assign addp10 = {vd10[6:1], hd10[6:1]};
assign addp11 = {vd10[6:1], hd11[6:1]};
assign addp12 = {vd10[6:1], hd12[6:1]};
assign addp13 = {vd10[6:1], hd13[6:1]};

timepic u1 (.address(addp0), .clock(clk), .q(outp0));
rightanswerpic u2 (.address(addp1), .clock(clk), .q(outp1));
wronganswerpic u3 (.address(addp2), .clock(clk), .q(outp2));
secondpic u4 (.address(addp3), .clock(clk), .q(outp3));
piecepic u5 (.address(addp4), .clock(clk), .q(outp4));
piecepic u6 (.address(addp5), .clock(clk), .q(outp5));
chimeipic u7 (.address(addp6), .clock(clk), .q(outp6));
gabojagopic u8 (.address(addp7), .clock(clk), .q(outp7));


pic0 u10 (.address(addp10), .clock(clk), .q(outp10));
pic1 u11 (.address(addp10), .clock(clk), .q(outp11));
pic2 u12 (.address(addp10), .clock(clk), .q(outp12));
pic3 u13 (.address(addp10), .clock(clk), .q(outp13));
pic4 u14 (.address(addp10), .clock(clk), .q(outp14));
pic5 u15 (.address(addp10), .clock(clk), .q(outp15));
pic6 u16 (.address(addp10), .clock(clk), .q(outp16));
pic7 u17 (.address(addp10), .clock(clk), .q(outp17));
pic8 u18 (.address(addp10), .clock(clk), .q(outp18));
pic9 u19 (.address(addp10), .clock(clk), .q(outp19));

pic0 u20 (.address(addp11), .clock(clk), .q(outp20));
pic1 u21 (.address(addp11), .clock(clk), .q(outp21));
pic2 u22 (.address(addp11), .clock(clk), .q(outp22));
pic3 u23 (.address(addp11), .clock(clk), .q(outp23));
pic4 u24 (.address(addp11), .clock(clk), .q(outp24));
pic5 u25 (.address(addp11), .clock(clk), .q(outp25));
pic6 u26 (.address(addp11), .clock(clk), .q(outp26));
pic7 u27 (.address(addp11), .clock(clk), .q(outp27));
pic8 u28 (.address(addp11), .clock(clk), .q(outp28));
pic9 u29 (.address(addp11), .clock(clk), .q(outp29));

pic0 u30 (.address(addp12), .clock(clk), .q(outp30));
pic1 u31 (.address(addp12), .clock(clk), .q(outp31));
pic2 u32 (.address(addp12), .clock(clk), .q(outp32));
pic3 u33 (.address(addp12), .clock(clk), .q(outp33));
pic4 u34 (.address(addp12), .clock(clk), .q(outp34));
pic5 u35 (.address(addp12), .clock(clk), .q(outp35));
pic6 u36 (.address(addp12), .clock(clk), .q(outp36));
pic7 u37 (.address(addp12), .clock(clk), .q(outp37));
pic8 u38 (.address(addp12), .clock(clk), .q(outp38));
pic9 u39 (.address(addp12), .clock(clk), .q(outp39));

pic0 u40 (.address(addp13), .clock(clk), .q(outp40));
pic1 u41 (.address(addp13), .clock(clk), .q(outp41));
pic2 u42 (.address(addp13), .clock(clk), .q(outp42));
pic3 u43 (.address(addp13), .clock(clk), .q(outp43));
pic4 u44 (.address(addp13), .clock(clk), .q(outp44));
pic5 u45 (.address(addp13), .clock(clk), .q(outp45));
pic6 u46 (.address(addp13), .clock(clk), .q(outp46));
pic7 u47 (.address(addp13), .clock(clk), .q(outp47));
pic8 u48 (.address(addp13), .clock(clk), .q(outp48));
pic9 u49 (.address(addp13), .clock(clk), .q(outp49));



always @(posedge clk)
begin
   
   if ((vcnt >= 11'd40) && (vcnt < 11'd40 + 11'd256) && (hcnt >= 12'd50) && (hcnt < 12'd306))
         selp0 <= 1'b1; // 0 - display, 1      
   else if ((vcnt >= 11'd40) && (vcnt < 11'd40 + 11'd256) && (hcnt >= 12'd780) && (hcnt < 12'd780 + 12'd256))
         selp1 <= 1'b1; //1
   else if ((vcnt >= 11'd40) && (vcnt < 11'd40 + 11'd256) && (hcnt >= 12'd1350) && (hcnt < 12'd1350 + 12'd256))
         selp2 <= 1'b1; //2
   else if ((vcnt >= 11'd100) && (vcnt < 11'd100 + 11'd128) && (hcnt >= 12'd630) && (hcnt < 12'd630 + 12'd128)) //sec static pic
         selp3 <= 1'b1; //2
   else if ((vcnt >= 11'd100) && (vcnt < 11'd100 + 11'd128) && (hcnt >= 12'd1179) && (hcnt < 12'd1179 + 12'd128))
         selp4 <= 1'b1; //2
   else if ((vcnt >= 11'd100) && (vcnt < 11'd100 + 11'd128) && (hcnt >= 12'd1749) && (hcnt < 12'd1749 + 12'd128))
         selp5 <= 1'b1; //2
	
	else if ((vcnt >= 11'd450) && (vcnt < 11'd450 + 11'd512) && (hcnt >= 12'd80) && (hcnt < 12'd80 + 12'd512)) // chemei pic left
			selp6 <= 1'b1; //2
	
	else if ((vcnt >= 11'd450) && (vcnt < 11'd450 + 11'd512) && (hcnt >= 12'd1360) && (hcnt < 12'd1360 + 12'd512)) // gabojago pic right
			selp7 <= 1'b1; //2
	
	else 
	begin
	     selp0 <= 1'b0; // static image
        selp1 <= 1'b0; // static image
        selp2 <= 1'b0; // static image
        selp3 <= 1'b0; // static image
        selp4 <= 1'b0; // static image
        selp5 <= 1'b0; // static image
		  selp6 <= 1'b0; // chemei pic left
		  selp7 <= 1'b0; // gabojago pic right
	end
        
end




always @(posedge clk)
begin
   if ((vcnt >= 11'd100) && (vcnt < 11'd100 + 11'd128) && (hcnt >= 12'd330) && (hcnt < 12'd330 + 12'd128))
         begin
               case(cnt4sec10) // sec10
               0:selp10<=1'b1;
               1:selp11<=1'b1;
               2:selp12<=1'b1;
               3:selp13<=1'b1;
               4:selp14<=1'b1;
               5:selp15<=1'b1;
               6:selp16<=1'b1;
               7:selp17<=1'b1;
               8:selp18<=1'b1;
               9:selp19<=1'b1;
               endcase
         end   

   else if ((vcnt >= 11'd100) && (vcnt < 11'd100 + 11'd128) && (hcnt >= 12'd480) && (hcnt < 12'd480 + 12'd128))
         begin
               case(cnt4sec1) // sec1
               0:selp20<=1'b1;
               1:selp21<=1'b1;
               2:selp22<=1'b1;
               3:selp23<=1'b1;
               4:selp24<=1'b1;
               5:selp25<=1'b1;
               6:selp26<=1'b1;
               7:selp27<=1'b1;
               8:selp28<=1'b1;
               9:selp29<=1'b1;
               endcase
         end
			
         
   else if ((vcnt >= 11'd100) && (vcnt < 11'd100 + 11'd128) && (hcnt >= 12'd1050) && (hcnt < 12'd1050 + 12'd128))
          begin
               case(ccount) //rightanswer piece
               0:selp30<=1'b1;
               1:selp31<=1'b1;
               2:selp32<=1'b1;
               3:selp33<=1'b1;
               4:selp34<=1'b1;
               5:selp35<=1'b1;
               6:selp36<=1'b1;
               7:selp37<=1'b1;
               8:selp38<=1'b1;
               9:selp39<=1'b1;
               endcase
         end
			

			
   else if ((vcnt >= 11'd100) && (vcnt < 11'd100 + 11'd128) && (hcnt >= 12'd1620) && (hcnt < 12'd1620 + 12'd128))
         begin
               case(wcount)  //wronganswer piece
               0:selp40<=1'b1;
               1:selp41<=1'b1;
               2:selp42<=1'b1;
               3:selp43<=1'b1;
               4:selp44<=1'b1;
               5:selp45<=1'b1;
               6:selp46<=1'b1;
               7:selp47<=1'b1;
               8:selp48<=1'b1;
               9:selp49<=1'b1;
               endcase
         end

   else
      begin
        
         selp10 <= 1'b0; // cnt4sec10 display
         selp11 <= 1'b0;
         selp12 <= 1'b0;
         selp13 <= 1'b0;
         selp14 <= 1'b0;
         selp15 <= 1'b0;
         selp16 <= 1'b0;
         selp17 <= 1'b0;
         selp18 <= 1'b0;
         selp19 <= 1'b0;         
         
         selp20 <= 1'b0; // cnt4sec1 display
         selp21 <= 1'b0;
         selp22 <= 1'b0;
         selp23 <= 1'b0;
         selp24 <= 1'b0;
         selp25 <= 1'b0;
         selp26 <= 1'b0;
         selp27 <= 1'b0;
         selp28 <= 1'b0;
         selp29 <= 1'b0; 
	
			selp30 <= 1'b0; //rightanswer piece
         selp31 <= 1'b0;
         selp32 <= 1'b0;
         selp33 <= 1'b0;
         selp34 <= 1'b0;
         selp35 <= 1'b0;
         selp36 <= 1'b0;
         selp37 <= 1'b0;
         selp38 <= 1'b0;
         selp39 <= 1'b0; 

			selp40 <= 1'b0; //wronganswer piece
         selp41 <= 1'b0;
         selp42 <= 1'b0;
         selp43 <= 1'b0;
         selp44 <= 1'b0;
         selp45 <= 1'b0;
         selp46 <= 1'b0;
         selp47 <= 1'b0;
         selp48 <= 1'b0;
         selp49 <= 1'b0; 
	
      end
end   

always @(posedge clk or negedge reset)
begin
   if (reset == 1'b0)
      begin
      backr <= 8'd0;
      backg <= 8'd0;
      backb <= 8'd0;
      end
   
   else if (selp0 == 1'b1)
      begin
         if (outp0 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else if (outp0 == 1'b1)
            begin
            backr <= staticpicr;
            backg <= staticpicg;
            backb <= staticpicb;
            end
      end
      
   else if (selp1 == 1'b1)
      begin
         if (outp1 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else if (outp1 == 1'b1)
            begin
            backr <= staticpicr;
            backg <= staticpicg;
            backb <= staticpicb;
            end
      end
      
   else if (selp2 == 1'b1)
      begin
         if (outp2 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else if (outp2 == 1'b1)
            begin
            backr <= staticpicr;
            backg <= staticpicg;
            backb <= staticpicb;
            end
      end
      
   else if (selp3 == 1'b1)
      begin
         if (outp3 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else if (outp3 == 1'b1)
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end
      
   else if (selp4 == 1'b1)
      begin
         if (outp4 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else if (outp4 == 1'b1)
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end

   else if (selp5 == 1'b1)
      begin
         if (outp5 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else if (outp5 == 1'b1)
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end

   else if (selp6 == 1'b1) // chimei pic
      begin
         if (outp6 == 2'd0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
			else if (outp6 == 2'd1)
            begin
            backr <= 8'd143;
            backg <= 8'd153;
            backb <= 8'd207;
            end
				
			else if (outp6 == 2'd2)
            begin
            backr <= 8'd252;
            backg <= 8'd242;
            backb <= 8'd206;
            end	
				
      end				
		
   else if (selp7 == 1'b1) // gabojago pic
      begin
         if (outp7 == 2'd0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
			else if (outp7 == 2'd1)
            begin
            backr <= 8'd255;
            backg <= 8'd7;
            backb <= 8'd136;
            end
				
			else if (outp7 == 2'd2)
            begin
            backr <= 8'd255;
            backg <= 8'd171;
            backb <= 8'd0;
            end	
				
			else if (outp7 == 2'd3)
            begin
            backr <= 8'd142;
            backg <= 8'd248;
            backb <= 8'd255;
            end
      end		
		
		
 else if (selp10 == 1'b1)
      begin
         if (outp10 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end

   else if (selp11 == 1'b1)
      begin
         if (outp11 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end

   else if (selp12 == 1'b1)
      begin
         if (outp12 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end
   else if (selp13 == 1'b1)
      begin
         if (outp13 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end      

   else if (selp14 == 1'b1)
      begin
         if (outp14 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end

   else if (selp15 == 1'b1)
      begin
         if (outp15 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end

   else if (selp16 == 1'b1)
      begin
         if (outp16 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end
      
   else if (selp17 == 1'b1)
      begin
         if (outp17 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end
      
   else if (selp18 == 1'b1)
      begin
         if (outp18 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end      


   else if (selp19 == 1'b1)
      begin
         if (outp19 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end      

   else if (selp20 == 1'b1)
      begin
         if (outp20 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end      

   else if (selp21 == 1'b1)
      begin
         if (outp21 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp22 == 1'b1)
      begin
         if (outp22 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp23 == 1'b1)
      begin
         if (outp23 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp24 == 1'b1)
      begin
         if (outp24 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp25 == 1'b1)
      begin
         if (outp25 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp26 == 1'b1)
      begin
         if (outp26 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   
      
   else if (selp27 == 1'b1)
      begin
         if (outp27 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp28 == 1'b1)
      begin
         if (outp28 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp29 == 1'b1)
      begin
         if (outp29 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp30 == 1'b1)
      begin
         if (outp30 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp31 == 1'b1)
      begin
         if (outp31 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   	

   else if (selp32 == 1'b1)
      begin
         if (outp32 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp33 == 1'b1)
      begin
         if (outp33 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp34 == 1'b1)
      begin
         if (outp34 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   		


   else if (selp35 == 1'b1)
      begin
         if (outp35 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   		

   else if (selp36 == 1'b1)
      begin
         if (outp36 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   
		
   else if (selp37 == 1'b1)
      begin
         if (outp37 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   
	
   else if (selp38 == 1'b1)
      begin
         if (outp38 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   	

   else if (selp39 == 1'b1)
      begin
         if (outp39 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp40 == 1'b1)
      begin
         if (outp40 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp41 == 1'b1)
      begin
         if (outp41 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp42 == 1'b1)
      begin
         if (outp42 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp43 == 1'b1)
      begin
         if (outp43 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp44 == 1'b1)
      begin
         if (outp44 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp45 == 1'b1)
      begin
         if (outp45 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp46 == 1'b1)
      begin
         if (outp46 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp47 == 1'b1)
      begin
         if (outp47 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp48 == 1'b1)
      begin
         if (outp48 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   

   else if (selp49 == 1'b1)
      begin
         if (outp49 == 1'b0)
            begin
            backr <= backgroundr;
            backg <= backgroundg;
            backb <= backgroundb;
            end
            
         else
            begin
            backr <= 8'd255;
            backg <= 8'd255;
            backb <= 8'd255;
            end
      end   
		
      
   else
      begin
      backr <= 8'd0;
      backg <= 8'd0;
      backb <= 8'd0;
      end   
      
   
end

      
endmodule