`timescale 1ns/1ps

module tb_mux;
   logic [129:0] count;
   logic [31:0]  muxOut;

   mux dut(.f(muxOut), .a(count[129:98]), .b(count[97:66]), .c(count[65:34]), .d(count[33:2]), .sel1(count[1]), .sel2(count[0]));

   initial begin
     $monitor($time,"a = %b | b = %b | c = %b | d = %b | sel1 = %b |sel2 = %b | muxOut = %b", count[129:98], count[97:66], count[65:34], count[33:2], count[1], count[0], muxOut);
     for(count = 0; count != 64; count++) #10;     
     #10 $stop;
   end

endmodule: tb_mux