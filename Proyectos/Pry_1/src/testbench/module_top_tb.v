`timescale 1ns/1ps

module test;

    reg clk_i = 0;
    reg rst_i;
    reg [3 : 0] codigo_gray_i;

    wire [1 : 0] anodo_o;
    wire [6 : 0] catodo_o;
    wire [3 : 0] codigo_bin_led_o;

    top # (6, 5) DUT (
    
        .clk_pi            (clk_i),
        .rst_pi            (rst_i),
        .codigo_gray_pi    (codigo_gray_i),

        .anodo_po          (anodo_o),
        .catodo_po         (catodo_o),              
        .codigo_bin_led_po (codigo_bin_led_o)
    );

    always begin
        
        clk_i = ~clk_i;
        #10;
    end
    
    initial begin
        
        rst_i = 0;
        codigo_gray_i = 4'b0000;

        #30;

        rst_i = 1;
        codigo_gray_i = 4'b0001;

        #100;
        codigo_gray_i = 4'b0011;

        #100;
        codigo_gray_i = 4'b0010;

        #100;
        codigo_gray_i = 4'b0110;

        #100;
        codigo_gray_i = 4'b0111;

        #100;
        codigo_gray_i = 4'b0101;

        #100;
        codigo_gray_i = 4'b0100;

        #100;
        codigo_gray_i = 4'b1100;

        #100;
        codigo_gray_i = 4'b1101;

        #100;
        codigo_gray_i = 4'b1111;

        #100;
        codigo_gray_i = 4'b1110;

        #100;
        codigo_gray_i = 4'b1010;

        #100;
        codigo_gray_i = 4'b1011;

        #100;
        codigo_gray_i = 4'b1001;

        #100;
        codigo_gray_i = 4'b1000;

        #1000;
        $finish;
    end


    initial begin
        $dumpfile("deco_gray.vcd");
        $dumpvars(0, test);
    end

endmodule