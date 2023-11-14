`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 01:42:44 PM
// Design Name: 
// Module Name: debouncing
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module debouncing(
    input RAW,
    input CLK,
    output reg CLEAN
    );
    //internal counter and TC signal
    reg [2:0] counter;
    wire TC;
    
    always @ (posedge CLK) begin
        if(~RAW)
            counter <= 3'b000;
        else
            counter <= counter + 3'b001;
    end
    
    assign TC = (counter==3'b111);
    
    //change output signal
    //when counter reaches max
    always @ (posedge CLK) begin
        if(~RAW)
            CLEAN <= 1'b0;
        else if(TC)
            CLEAN <= 1'b1;
        end 
        
endmodule
