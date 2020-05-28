// Code your design here
// Code your design here
module ALU(
  input clk,
  input reset,
  input [3:0]data1,
  input [3:0]data2,
  input [1:0]control,
  input valid,
  output reg ready,
  output reg [8:0]result

);
  parameter cycles = 4;
  
  reg [3:0] reg0;	// operand1
  reg [3:0] reg1;	// operand2
  reg [1:0] reg2;	// operation
  reg [8:0] reg3;	// result
  reg [4:0] reg4;	// count the cycles
  
  assign result = reg3;
  
  always@(posedge clk)
    begin
      if(reset)
        begin
          reg0 <= 0;
          reg1 <= 0;
          reg2 <= 0;
          reg3 <= 0;
          reg4 <= 0;
          ready <= 1;
        end
      else
        begin
          if(valid && ready)
            begin
              reg0 <= data1;
              reg1 <= data2;
              reg2 <= control;
              ready <= 0;
            end
          else
            if(!ready)
              begin
                case(reg2)
                  0:begin
                    	reg3 <= reg1+reg2;
                    	ready <= 1;
                    end
                  1:begin
                    	reg3 <= reg1+reg2;
                    	ready <= 1;
                  	end
                  3:begin
                    	reg3 <= reg1+reg2;
                    	ready <= 1;
                  	end
                  2:begin
                    if(reg4 == cycles)
                      begin
                        reg3 <= reg1*reg2;
                        reg4 <= 0;
                        ready <= 1;
                      end
                    else
                      begin
                      	ready <= 0;
                        reg4 <= reg4 + 1;
                      end
                  end
                    endcase
              end
              else
                ready <= 1;
         end
    end
  
endmodule


