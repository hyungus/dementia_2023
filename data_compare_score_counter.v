
module data_compare_score_counter (data1, data2, clk, reset, ccount, wcount, NewKB, KB_DAT, keyenter, datareset, gameendccount,
memory0, memory1, memory2, memory3, memory4, memory5, memory6, memory7, memory8, memory9, memory10, memory11, memory12, memory13, memory14, memory15,
flip0, flip1, flip2, flip3, flip4, flip5, flip6, flip7, flip8, flip9, flip10, flip11, flip12, flip13, flip14, flip15);

input clk, reset, NewKB;
input [3:0]data1, data2;
input [2:0] memory0, memory1, memory2, memory3, memory4, memory5, memory6, memory7, memory8, memory9
, memory10, memory11, memory12, memory13, memory14, memory15;
input [7:0] KB_DAT;

output keyenter, datareset, gameendccount, flip0, flip1, flip2, flip3, flip4, flip5, flip6, flip7, flip8, flip9, flip10, flip11, flip12, flip13, flip14, flip15;
output [3:0] ccount, wcount;

wire clk, reset, NewKB, newclk;
wire[2:0] memory0, memory1, memory2, memory3, memory4, memory5, memory6, memory7, memory8, memory9
, memory10, memory11, memory12, memory13, memory14, memory15;
wire [3:0] data1, data2;
wire [7:0] KB_DAT;

reg keyenter, datareset, gameendccount, flip0, flip1, flip2, flip3, flip4, flip5, flip6, flip7, flip8, flip9, flip10, flip11, flip12, flip13, flip14, flip15;
reg [2:0] compare1, compare2;
reg [3:0] ccount, wcount;

assign newclk = clk;

always @(posedge newclk or negedge reset)
begin // 1
	if(reset == 1'b0)
		begin//10

			keyenter <= 1'b0;
			ccount <= 4'b0;
			wcount <= 4'b0;
			flip0 <= 1'b0;
			flip1 <= 1'b0;
			flip2 <= 1'b0;
			flip3 <= 1'b0;
			flip4 <= 1'b0;
			flip5 <= 1'b0;
			flip6 <= 1'b0;
			flip7 <= 1'b0;
			flip8 <= 1'b0;
			flip9 <= 1'b0;
			flip10 <= 1'b0;
			flip11 <= 1'b0;
			flip12 <= 1'b0;
			flip13 <= 1'b0;
			flip14 <= 1'b0;
			flip15 <= 1'b0;
		end//10

	else if(NewKB==1'b1)
		begin //2
			if(KB_DAT==8'h5A)
				begin //3
					
					if (gameendccount == 1'b1)
						begin
						ccount <= ccount;
						wcount <= wcount;
						end
					
					
					else if(compare1 == compare2)
					begin
						ccount <= ccount + 4'b1;
						keyenter <= 1'b1;
						datareset <= 1'b1;
						
						case(data1)
						4'b0000 : flip0 <= 1'b1;
						4'b0100 : flip1 <= 1'b1;
						4'b1000 : flip2 <= 1'b1;
						4'b1100 : flip3 <= 1'b1;
						4'b0001 : flip4 <= 1'b1;
						4'b0101 : flip5 <= 1'b1;
						4'b1001 : flip6 <= 1'b1;
						4'b1101 : flip7 <= 1'b1;
						4'b0010 : flip8 <= 1'b1;
						4'b0110 : flip9 <= 1'b1;
						4'b1010 : flip10 <= 1'b1;
						4'b1110 : flip11 <= 1'b1;
						4'b0011 : flip12 <= 1'b1;
						4'b0111 : flip13 <= 1'b1;
						4'b1011 : flip14 <= 1'b1;
						4'b1111 : flip15 <= 1'b1;
						endcase	
						
						case(data2)
						4'b0000 : flip0 <= 1'b1;
						4'b0100 : flip1 <= 1'b1;
						4'b1000 : flip2 <= 1'b1;
						4'b1100 : flip3 <= 1'b1;
						4'b0001 : flip4 <= 1'b1;
						4'b0101 : flip5 <= 1'b1;
						4'b1001 : flip6 <= 1'b1;
						4'b1101 : flip7 <= 1'b1;
						4'b0010 : flip8 <= 1'b1;
						4'b0110 : flip9 <= 1'b1;
						4'b1010 : flip10 <= 1'b1;
						4'b1110 : flip11 <= 1'b1;
						4'b0011 : flip12 <= 1'b1;
						4'b0111 : flip13 <= 1'b1;
						4'b1011 : flip14 <= 1'b1;
						4'b1111 : flip15 <= 1'b1;
						endcase							
		
					end
					
					else if (compare1 != compare2)
					begin
						wcount <= wcount + 4'b1;
						keyenter <= 1'b1;
						datareset <= 1'b1;
					end
					
				end // 3

			else
				begin
					keyenter <= 1'b0;
					datareset <= 1'b0;
				end				
		end //2

end // 1

always @(posedge clk or negedge reset)
begin
	if (reset == 1'b0)
		begin
			compare1 <= 3'h0;
			compare2 <= 3'h1; // not equal
		end
	
	else
					case(data1)
						4'b0000 : compare1<= memory0;
						4'b0100 : compare1<= memory1;
						4'b1000 : compare1<= memory2;
						4'b1100 : compare1<= memory3;
						4'b0001 : compare1<= memory4;
						4'b0101 : compare1<= memory5;
						4'b1001 : compare1<= memory6;
						4'b1101 : compare1<= memory7;
						4'b0010 : compare1<= memory8;
						4'b0110 : compare1<= memory9;
						4'b1010 : compare1<= memory10;
						4'b1110 : compare1<= memory11;
						4'b0011 : compare1<= memory12;
						4'b0111 : compare1<= memory13;
						4'b1011 : compare1<= memory14;
						4'b1111 : compare1<= memory15;
						endcase

					case(data2)
						4'b0000 : compare2<= memory0;
						4'b0100 : compare2<= memory1;
						4'b1000 : compare2<= memory2;
						4'b1100 : compare2<= memory3;
						4'b0001 : compare2<= memory4;
						4'b0101 : compare2<= memory5;
						4'b1001 : compare2<= memory6;
						4'b1101 : compare2<= memory7;
						4'b0010 : compare2<= memory8;
						4'b0110 : compare2<= memory9;
						4'b1010 : compare2<= memory10;
						4'b1110 : compare2<= memory11;
						4'b0011 : compare2<= memory12;
						4'b0111 : compare2<= memory13;
						4'b1011 : compare2<= memory14;
						4'b1111 : compare2<= memory15;
						endcase


end

always @(posedge clk or negedge reset)
begin
	if(reset == 1'b0)
		gameendccount <= 1'b0;

	else if(ccount == 4'd8 || wcount == 4'd8)
		gameendccount <= 1'b1;
end






endmodule