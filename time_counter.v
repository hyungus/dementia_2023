module timecounter (clk, reset, cnt4sec1, cnt4sec10, gameendtimeover, gameendccount);

input clk, reset, gameendccount;

output [3:0] cnt4sec1, cnt4sec10;
output gameendtimeover;

wire clk, reset, gameendccount;

reg gameendtimeover;
reg [3:0] cnt4sec1, cnt4sec10;
reg [25:0] clk_cnt;


always @(posedge clk or negedge reset)
	begin
		if (reset == 1'b0)
			clk_cnt <= 26'd0;
			
		else
			clk_cnt <= clk_cnt + 26'd1;
	end
	
assign clk60s = clk_cnt[25];


always @(posedge clk60s or negedge reset)
begin
	if (reset == 1'b0)
		begin
			cnt4sec1 <= 4'b0;
			cnt4sec10 <= 4'b0;
			gameendtimeover <= 1'b0;
		end

	else if (gameendccount == 1'b1)
		begin
			cnt4sec1 <= cnt4sec1;
			cnt4sec10 <= cnt4sec10;
		end
		
	else if (cnt4sec10 == 4'd5 && cnt4sec1 == 4'd9)
		begin
			gameendtimeover <= 1'b1;
			cnt4sec1 <= cnt4sec1;
			cnt4sec10 <= cnt4sec10;
		end
	
	else if (cnt4sec1 == 4'd9)
		begin
			cnt4sec10 <= cnt4sec10 + 4'd1;
			cnt4sec1 <= 4'd0;
		end
	
	else 
		begin
			
			cnt4sec1 <= cnt4sec1 + 4'd1;
		end

			
end
endmodule
