module dementia (reset, reset2, clk, ps2clk, ps2dat, hsync, vsync, sync, de, clk0, r, g, b);

input clk, reset, reset2, ps2clk, ps2dat;
output hsync, vsync, sync, de, clk0;
output [7:0] r, g, b;

wire clk, reset, reset2, NewKB, gameendtimeover, gameendccount, hsync, vsync, de, sync, keyenter, datareset, 
flip0, flip1, flip2, flip3, flip4, flip5, flip6, flip7, flip8, flip9, flip10, flip11, flip12, flip13, flip14, flip15;
wire [1:0] xcoord, ycoord;
wire [2:0] memory0, memory1, memory2, memory3, memory4, memory5, memory6, memory7, memory8, memory9, memory10, memory11, memory12, memory13, memory14, memory15;
wire [3:0] cnt4sec1, cnt4sec10, ccount, wcount, data1, data2;
wire [7:0] r, g, b, KB_DAT, backr, backg, backb, cardr, cardg, cardb, cursorr, cursorg, cursorb, gameoverr, gameoverg, gameoverb;
wire [10:0] vcnt;
wire [11:0] hcnt;

RxKB u1 (.PS_CLK(ps2clk), .PS_DAT(ps2dat), .CLK(clk0), .RESET(reset), .NewKB(NewKB), .KB_DAT(KB_DAT));
coordsystem_data u2 (.clk(clk0), .reset(reset), .NewKB(NewKB), .KB_DAT(KB_DAT), .xcoord(xcoord), .ycoord(ycoord), .data1(data1), .data2(data2),
  .key1(key1), .key2(key2), .datareset(datareset));
timecounter u3 (.clk(clk), .reset(reset), .cnt4sec1(cnt4sec1), .cnt4sec10(cnt4sec10), .gameendtimeover(gameendtimeover), .gameendccount(gameendccount));

data_compare_score_counter u4 (.clk(clk0), .reset(reset), .data1(data1), .data2(data2), .ccount(ccount), .wcount(wcount), .NewKB(NewKB), .KB_DAT(KB_DAT), .keyenter(keyenter), .datareset(datareset),
 .memory0(memory0), .memory1(memory1), .memory2(memory2), .memory3(memory3), .memory4(memory4), .memory5(memory5), .memory6(memory6), .memory7(memory7), .memory8(memory8),
 .memory9(memory9), .memory10(memory10), .memory11(memory11), .memory12(memory12), .memory13(memory13), .memory14(memory14), .memory15(memory15),
 .flip0(flip0), .flip1(flip1), .flip2(flip2), .flip3(flip3), .flip4(flip4), .flip5(flip5), .flip6(flip6), .flip7(flip7), .flip8(flip8),
 .flip9(flip9), .flip10(flip10), .flip11(flip11), .flip12(flip12), .flip13(flip13), .flip14(flip14), .flip15(flip15), .gameendccount(gameendccount));


hv_sync u11 (.clk(clk0), .reset(reset), .hsync(hsync), .vsync(vsync), .hcnt(hcnt), .vcnt(vcnt), .de(de), .sync(sync));
clockGen u12 (.inclk0(clk), .c0(clk0));

cardarray u13 (.clk(clk0), .reset(reset), .reset2(reset2), .hcnt(hcnt), .vcnt(vcnt), .cardr(cardr), .cardg(cardg), .cnt4sec1(cnt4sec1), .cnt4sec10(cnt4sec10),
 .cardb(cardb), .vsync(vsync), .key1(key1), .key2(key2), .xcoord(xcoord), .ycoord(ycoord),
 .memory0(memory0), .memory1(memory1), .memory2(memory2), .memory3(memory3), .memory4(memory4), .memory5(memory5), .memory6(memory6), .memory7(memory7), .memory8(memory8),
 .memory9(memory9), .memory10(memory10), .memory11(memory11), .memory12(memory12), .memory13(memory13), .memory14(memory14), .memory15(memory15),
  .flip0(flip0), .flip1(flip1), .flip2(flip2), .flip3(flip3), .flip4(flip4), .flip5(flip5), .flip6(flip6), .flip7(flip7), .flip8(flip8),
 .flip9(flip9), .flip10(flip10), .flip11(flip11), .flip12(flip12), .flip13(flip13), .flip14(flip14), .flip15(flip15));
 
background u14 (.clk(clk0), .reset(reset), .backr(backr), .backg(backg), .backb(backb), .hcnt(hcnt), .vcnt(vcnt), .cnt4sec1(cnt4sec1), .cnt4sec10(cnt4sec10), .ccount(ccount), .wcount(wcount));
cursor u15 (.clk(clk0), .reset(reset), .hcnt(hcnt), .vcnt(vcnt), .xcoord(xcoord), .ycoord(ycoord), .cursorr(cursorr), .cursorg(cursorg), .cursorb(cursorb));

gameover u16 (.clk(clk0), .reset(reset), .gameoverr(gameoverr), .gameoverg(gameoverg), .gameoverb(gameoverb), .hcnt(hcnt), .vcnt(vcnt), .cnt4sec1(cnt4sec1), .cnt4sec10(cnt4sec10), .ccount(ccount), .wcount(wcount));

mux u21 (.clk(clk0), .reset(reset), .vcnt(vcnt), .hcnt(hcnt), .cursorr(cursorr), .cursorg(cursorg), .cursorb(cursorb), .xcoord(xcoord), .ycoord(ycoord), .gameendtimeover(gameendtimeover), .gameendccount(gameendccount),
.cardr(cardr), .cardg(cardg), .cardb(cardb), .backr(backr), .backg(backg), .backb(backb), .gameoverr(gameoverr), .gameoverg(gameoverg), .gameoverb(gameoverb), .r(r), .g(g), .b(b));





endmodule