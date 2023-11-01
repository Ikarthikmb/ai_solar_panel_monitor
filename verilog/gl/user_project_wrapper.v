module user_project_wrapper (user_clock2,
    vccd1,
    vccd2,
    vdda1,
    vdda2,
    vssa1,
    vssa2,
    vssd1,
    vssd2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vccd1;
 input vccd2;
 input vdda1;
 input vdda2;
 input vssa1;
 input vssa2;
 input vssd1;
 input vssd2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;


 user_proj_solar mprj (.vccd1(vccd1),
    .vssd1(vssd1),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .analog_io({analog_io[28],
    analog_io[27],
    analog_io[26],
    analog_io[25],
    analog_io[24],
    analog_io[23],
    analog_io[22],
    analog_io[21],
    analog_io[20],
    analog_io[19],
    analog_io[18],
    analog_io[17],
    analog_io[16],
    analog_io[15],
    analog_io[14],
    analog_io[13],
    analog_io[12],
    analog_io[11],
    analog_io[10],
    analog_io[9],
    analog_io[8],
    analog_io[7],
    analog_io[6],
    analog_io[5],
    analog_io[4],
    analog_io[3],
    analog_io[2],
    analog_io[1],
    analog_io[0]}));
endmodule
