module ifft4(
    input wire signed[7:0] real_in_0,real_in_1,real_in_2,real_in_3,
	 input wire signed[7:0] imag_in_0,imag_in_1,imag_in_2,imag_in_3,
    output wire signed[7:0] real_out_0,real_out_1,real_out_2,real_out_3,
    output wire signed[7:0] imag_out_0,imag_out_1,imag_out_2,imag_out_3
);

wire signed[7:0] real_0, real_1, real_2, real_3;
wire signed[7:0] imag_0, imag_1, imag_2, imag_3;

// 第一级蝴蝶运算
wire signed[7:0] tmp_real_0, tmp_real_1, tmp_real_2, tmp_real_3;
wire signed[7:0] tmp_imag_0, tmp_imag_1, tmp_imag_2, tmp_imag_3;

assign tmp_real_0 = real_in_0 + real_in_2;
assign tmp_real_1 = real_in_0 - real_in_2;
assign tmp_real_2 = real_in_1 + real_in_3;
assign tmp_real_3 = real_in_1 - real_in_3;

assign tmp_imag_0 = imag_in_0 + imag_in_2;
assign tmp_imag_1 = imag_in_0 - imag_in_2;
assign tmp_imag_2 = imag_in_1 + imag_in_3;
assign tmp_imag_3 = imag_in_1 - imag_in_3;

// 第二级蝴蝶运算
wire signed[7:0] tmp2_real_0, tmp2_real_1, tmp2_real_2, tmp2_real_3;
wire signed[7:0] tmp2_imag_0, tmp2_imag_1, tmp2_imag_2, tmp2_imag_3;

assign tmp2_real_0 = tmp_real_0 + tmp_real_2;
assign tmp2_real_1 = tmp_real_1 + tmp_imag_3;
assign tmp2_real_2 = tmp_real_0 - tmp_real_2;
assign tmp2_real_3 = tmp_real_1 - tmp_imag_3;

assign tmp2_imag_0 = tmp_imag_0 + tmp_imag_2;
assign tmp2_imag_1 = tmp_imag_1 - tmp_real_3;
assign tmp2_imag_2 = tmp_imag_0 - tmp_imag_2;
assign tmp2_imag_3 = tmp_imag_1 + tmp_real_3;

// 第三级蝴蝶运算
assign real_out_0 = tmp2_real_0/4;
assign real_out_1 = tmp2_real_1/4;
assign real_out_2 = tmp2_real_2/4;
assign real_out_3 = tmp2_real_3/4;

assign imag_out_0 = tmp2_imag_0/4;
assign imag_out_1 = tmp2_imag_1/4;
assign imag_out_2 = tmp2_imag_2/4;
assign imag_out_3 = tmp2_imag_3/4;

endmodule