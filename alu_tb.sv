// Code your testbench here
// or browse Examples
module test();
  
  reg clk;
  reg reset;
  reg [3:0]data1;
  reg [3:0]data2;
  reg [1:0]control;
  reg valid;
  wire ready;
  wire [8:0]result;
  
  reg [2:0] delay;
  
  bit [9:0] input_gen [$];
  bit [8:0] output_gen [$];

  
  ALU a1(clk,reset,data1,data2,control,valid,ready,result);
  
  initial
    begin
      	$dumpfile("test.vcd");
    	$dumpvars;
      	clk = 0;
      	reset = 0;
    	#5;
      	reset = 1;
      	#7;
      	reset = 0;


      repeat(20)
        begin          
          wait(ready == 1);
          output_gen.push_back(result);
          delay = $random;
          #(delay);
          data1 = $random;
          data2 = $random;
          control = $random;
          valid = 1;
          wait(ready == 1);		// wait for ALU to be ready
          @(posedge clk);		// This indicates that data is latched in ALU
          input_gen.push_back({data1,data2,control});
        end
      
      $display("%p",input_gen);
      $display("Inputs : %d",input_gen.size());

      $display("Outputs :%d",output_gen.size());

      $finish;
      
    end
  
  always #5 clk = ~clk;

endmodule
