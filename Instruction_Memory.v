module Instruction_Memory(clk, reset, read_address, Instructions_out);

    input [31:0] read_address;
    output [31:0] Instructions_out;
    reg [31:0] Imemory [63:0];
    integer k;
    assign Instructions_out = Imemory[read_address];

    always @(posedge clk)
    begin
        if(reset == 1'b1) 
        begin
            for(k=0; k<64; k=k+1)
                Imemory[k] = 32'b0;
        end
    end

endmodule