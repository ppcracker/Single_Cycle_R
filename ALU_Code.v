module alu(A,B,ALUControl,Result);
    //declaring inputs
    input [31:0] A,B;
    input [2:0] ALUControl;

    //Declaring outputs
    output [31:0] Result;

    //declaring interim wires
    wire[31:0] a_and_b;
    wire[31:0] a_or_b;
    wire[31:0] not_b;

    wire[31:0] mux_1;

    wire[31:0] sum;

    wire[31:0] mux_2;

    //Logic design
    //AND Operation
    assign a_and_b= A & B;

    //OR operation
    assign a_or_b= A|B;

    //NOT operation on B
    assign not_b = -B;

    //NOT operation on A
    assign not_a = -A;

    //Ternary operator
    assign mux_1= (ALUControl[0]==1'b0) ? B  : not_b;
    
    //Addition / subtraction operation
     assign sum = A + mux_1 + ALUControl[0];
     
     //Designing 4by1 Mux
     assign mux_2 = (ALUControl[1:0] == 2'b00) ? sum :
                    (ALUControl[1:0] == 2'b01) ?sum :
                    (ALUControl[1:0] == 2'b10) ? a_and_b: a_or_b;

     assign Result = mux_2;    
endmodule
