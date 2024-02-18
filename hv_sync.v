
module hv_sync (clk, reset, hsync, vsync, hcnt, vcnt, de, sync);

parameter sync_h = 12'd44;
parameter bp_h = 12'd148;
parameter active_h = 12'd1920;
parameter total_h = 12'd2200;
parameter sync_v = 11'd5;
parameter bp_v = 11'd36;
parameter active_v = 11'd1080;
parameter total_v = 11'd1125;

input clk, reset;
output hsync, vsync, de, sync;
output [11:0] hcnt;
output [10:0] vcnt;


wire clk, reset, de, sync;
wire [11:0] hcnt;
wire [10:0] vcnt;
reg hsync, vsync, hde, vde;


hv_cnt u1 (.clk(clk), .reset(reset), .hcnt(hcnt), .vcnt(vcnt));

always @(posedge clk)
   begin
   
   if ( hcnt <= (active_h - 12'd1) ) // 0 to active
   begin
   hsync <= 1'b1;
   hde <= 1'b1;
   end

   else if( hcnt <= (total_h - bp_h - sync_h - 12'b1) ) // active to sync(begin)
   begin
   hsync <= 1'b1;
   hde <= 1'b0;
   end

   else if ( hcnt <= (total_h - bp_h - 12'd1) ) // sync(begin) to back porch
   begin
   hsync <= 1'b0;
   hde <= 1'b0;   
   end

   else
   begin
   hsync <= 1'b1;
   hde <= 1'b0;
   end
   
   end
   
always @(posedge clk)
   begin

   if ( vcnt <= (active_v - 11'd1) ) // 0 to active
   begin
   vsync <= 1'b1;
   vde <= 1'b1;
   end

   else if ( vcnt <= (total_v - bp_v - sync_v - 11'b1) ) // active to sync(begin)
   begin
   vsync <= 1'b1;
   vde <= 1'b0;
   end

   else if ( vcnt <= (total_v - bp_v - 11'd1) ) // sync(begin) to back porch
   begin
   vsync <= 1'b0;
   vde <= 1'b0;
   end

   else
   begin
   vsync <= 1'b1;
   vde <= 1'b0;
   end
   
   end


assign de = hde && vde;
assign sync = hsync && vsync;

	
endmodule