module Alu_Decoder(ALUOp, function3, function7, Op5, ALUControl);

input  [2:0]function3; 
input [1:0] ALUOp;
input [6:0]function7,Op;
output  [2:0]ALUControl;

assign ALUControl = (ALUOp == 00) ? 3'b000:
                    (ALUOp == 01) ? 3'b001:
                    (ALUOp == 10) ? (( function3 == 3'b000) ? ((({Op[5],function7[5]}== 2'b00) | ({Op[5],function7[5]}== 2'b01) | ({Op[5],function7[5]}== 2'b10)) ? 3'b000 : 3'b001;): 
                                    (function3 ==3'b010) ? 3'b101:
                                    (function3 ==3'b110) ? 3'b011 :
                                    (function3 ==3'b111) ? 3'b010 : 3'b000):
                                    3'b000;                    



endmodule
