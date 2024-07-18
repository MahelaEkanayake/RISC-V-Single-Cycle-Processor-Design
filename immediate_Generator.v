
module immediate_Generator (
    input [6:0] Opcode,
    input [31:0] instruction,
    output reg [31:0] ImmExt
);

    always @ begin
        case (Opcode)
            7'b0010011: ImmExt = {{20{instruction[31]}},instruction[31:30]}; // I instruction
            7'b0100011: ImmExt = {{20{instruction[31]}},instruction[31:25],instruction[11:7]}; // S instruction
            7'b1100011: ImmExt = {{19{instruction[31]}},instruction[31],instruction[30:25], instruction[11:8], 1'b0}; // SB instruction
            default : ImmExt = {{20{instruction[31]}},instruction[31:30]}; // Default case R instruction
        endcase
    end
endmodule