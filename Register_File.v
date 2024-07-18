module Register_File(clk, reset, RegWrite, Rs1, Rs2, Rd, Write_data, Read_data1, Read_data2);

    input clk, reset, RegWrite;
    input [4:0] Rs1, Rs2, Rd;
    input [31:0] Write_data;
    output [31:0] Read_data1, Read_data2;

    reg [31:0] Registers [31:0];

    integer k;

    always @(posedge clk) begin 
        if (reset == 1'b1) 
        begin
            for (k=0; k<32; k = k+1) begin
                Registers[k] = 32'h0;     
            end
        end
        else if (RegWrite == 1'b1)
        begin
            Registers[Rd] = Write_data;
        end
    end

    assign Read_data1 = Registers [Rs1];
    assign Read_data2 = Registers [Rs2];
    

endmodule