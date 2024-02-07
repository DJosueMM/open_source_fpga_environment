module module_top # (

     parameter INPUT_REFRESH = 2700000,
     parameter DISPLAY_REFRESH = 27000

)(
    
    input                  clk_pi,
    input                  rst_pi,
    input [3 : 0]          codigo_gray_pi,

    output  [1 : 0]     anodo_po,
    output  [6 : 0]     catodo_po,              
    output  [3 : 0]     codigo_bin_led_po

);
    
    wire [3 : 0] codigo_bin;
    wire [7 : 0] codigo_bcd;

    module_lectura_deco_gray # (4,INPUT_REFRESH) SUBMODULO_LECTURA (

        .clk_i         (clk_pi),
        .rst_i         (rst_pi),
        .codigo_gray_i (codigo_gray_pi),

        .codigo_bin_o  (codigo_bin)
    );

    assign codigo_bin_led_po = ~codigo_bin;

    module_bin_to_bcd # (4) SUBMODULO_BIN_BCD (

        .clk_i (clk_pi),
        .rst_i (rst_pi),
        .bin_i (codigo_bin),

        .bcd_o (codigo_bcd)
    );

    module_7_segmentos # (DISPLAY_REFRESH) SUBMODULO_DISPLAY (

        .clk_i    (clk_pi),
        .rst_i    (rst_pi),
        .bcd_i    (codigo_bcd),

        .anodo_o  (anodo_po),
        .catodo_o (catodo_po)    
    );

endmodule
