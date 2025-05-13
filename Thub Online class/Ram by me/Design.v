module memory (
  input clk,
  input [1:0]inp,
  input cntrl,
  output reg [1:0]mem,
  output reg [1:0]read
);
always @(posedge clk) 
  begin
  if (cntrl == 1'b0) 
    begin
      mem <= inp;
      read <= 2'b00;
    end 
  else if (cntrl == 1'b1)
    begin
      read <= mem;
    end 
  else 
    begin
      read <= 2'b00;
    end
end
endmodule