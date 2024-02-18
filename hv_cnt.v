
module hv_cnt (clk, reset, hcnt, vcnt);

parameter sync_h = 12'd44;
parameter bp_h = 12'd148;
parameter active_h = 12'd1920;
parameter total_h = 12'd2200;
parameter sync_v = 11'd5;
parameter bp_v = 11'd36;
parameter active_v = 11'd1080;
parameter total_v = 11'd1125;

input clk, reset;
output [11:0] hcnt;
output [10:0] vcnt;

wire clk, reset;
reg [11:0] hcnt;
reg [10:0] vcnt;

always @(posedge clk or negedge reset)
   if (reset == 1'b0)
   begin
   hcnt <= 12'd0;
   vcnt <= 11'd0;
   end

   else if (hcnt == (total_h - 12'd1) && vcnt == (total_v - 11'd1))
   begin
   hcnt <= 12'd0;
   vcnt <= 11'd0;   
   end

   else if (hcnt == (total_h - 12'd1))
   begin
   hcnt <= 12'd0;
   vcnt <= vcnt + 11'd1;
   end
   
   else
   begin
   hcnt <= hcnt + 12'd1;
   end

endmodule