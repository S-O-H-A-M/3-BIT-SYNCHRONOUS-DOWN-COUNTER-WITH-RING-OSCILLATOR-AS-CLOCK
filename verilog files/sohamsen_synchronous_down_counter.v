module sohamsen_synchronous_down_counter(input clk, reset, output [2:0] counter);

reg [2:0] counter_down;

// synchronous down counter
always @(posedge clk or posedge reset)
begin
if(reset)
 counter_down <= 3'b111;
else
 counter_down <= counter_down - 3'b001;
end 
assign counter = counter_down;
endmodule