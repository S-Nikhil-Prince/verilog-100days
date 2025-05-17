System Verilog SV:
------------------
⌂  In order to learn SV, these are the things that you should learn from verilog.

    It is an extension to Verilog.
    *from verilog we should know design and verification.
    *functions and tasks from verilog.
    *arrays and vectors concept.
    *Testbench and testcase.
    *verilog operators and Data Types.
    *Grip on any simulation tool(EDA Playground).
---------------------------------------------------------------------------------------------------
Syntax:
    function name (input, output, inout);
        //function body
    endfunction
Example 1 :
    function int add(int a, int b);
        return a + b;
    endfunction
    initial begin
        int result;
        int c = add(5, 10);
        $display("Result: %d",c);
    end

^.^ Example 2: Adding arr[5:0]'s;
    function sum(a,b);
        return=a+b;
    endfuntion
    for(i=0,i<=5;i=i+1);
        sum(arr1[i],arr2[i]);
        arr3[i]=sum(a,b);
    for(i=0,i<=5,i++);
        print()
------------------------------------------------------------------------------
ARRAYS AND VECTORS:
    Array:
        *An array is a collection of elements of the same data type.
        *Arrays can be one-dimensional or multi-dimensional.
        *Arrays can be declared using the following syntax:
            data_type array_name [size];
        *Example:
            int my_array[10]; // One-dimensional array of integers
            int my_2d_array[5][5];
    Vector:
        *A vector is a special type of array that can hold a fixed number of bits.
        *Vectors are declared using the following syntax:
            data_type [size] vector_name;
        *Example:
            logic [7:0] my_vector; // 8-bit vector
            logic [3:0] my_vector[5]; // 4-bit vector with 5 elements
-------------------------------------------------------------------------------------------------
New operator in sv {inside}
    if(a inside inta[0:5],b,c);
        $display("a is inside the range");
    else
        $display("a is not inside the range");
    end
-------------------------------------------------------------------------------------------------
Why is SV?
 *SystemVerilog is an extension of Verilog that adds new features and capabilities to the language. It is designed to improve the design and verification of digital systems, making it easier to create complex designs and verify their correctness.
 *It is both HDL(Hardware Description Language) and HDVL(Hardware Design Verification Language).
 *It is effecient for Verification.
 *code reusability is there.
 *supports OOPS(Object Oriented Programming).
 *SV gives Compact code.
 *Contains User defined data types.
What is the role of functional verification engineer?
    *He verifies weather the function it was intended to perform is being performed without errors or Not.
    *He Designs the testbench.
What is the role of functional verification?
    *to verify the functionality of the design.
    *to verify the design against the specifications.
--------------------------------------------------------------------------------------------------
   Modular Testbench:
    *SINCE IN SV DI
      |----------|         |----------|
      |          |         |          |
      |Testbench |-------> |   DUT    |
      |          |    |    |          |
      |          |    |    |          |
      |----------|    |    |----------|
                      |
                Port Connection
----------------------------------------------------------------------------------------------------------------
SV TB Architecture:
    *In SV TB all features are implementes as different components.
    What every thing refers to?
        *Stimulus generation.
        *Driving the inpust to the {DUT.Driver\Bus Functional Model}.
        *Monitoring desing input and output.{}
        *Concuct different types of coverages.
        *Predict the output.
        *compare the real and expected output.
        *Display the results.

------------Block Digram of Archetecture of SV TB------------------------------------------------------------

                               +-----------------+                     +-------------+     +------------+
                               | Reference Model |<- Expected output ->|   Checker   | --> | Scoreboard |
                               +-----------------+                     +-------------+     +------------+
                                     M ^                                  ^ 
                                       |                                  |
                                       |                                  |
   + -----------+                +----------+             +-----------------+
   | Functional |<----- M -----> | Monitor  |             |    Monitor      |
   |  Coverage  |                |          |             |                 |
   +------------+                +----------+             +-----------------+
                     Expected output ^                         ^ Actual output
                                     |                         |
                                     |                         |
+------------+     +---------+     +-------------+     +-----+     +-------------+
| Generator  | --> | Mail Box| --> | Driver/BFM  | --> | DUT | --> | Slave Model |
+------------+     +---------+     +-------------+     +-----+     +-------------+
                                          |                |
                                          |                |
                                          v                v
                                     +------------+      +-------------+
                                     | Assertions |      | Assertions  |
                                     +------------+      +-------------+
--------------------------------------------------------------------------------------------------------------
============
Data Types:
============
    *Data types are used to define the type of data that can be stored in a variable.
>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    ------------Program for Size and default of data types-----------------
****Format specifier to do so is %0d.
****Format specifier to do so is %0d.
-program-
module tb;
    bit a;
    byte b;
    shortint c;
    int d;
    longint e;
    logic f;
    integer g;
    time h;
    realtime i;
    reg j;
    initial
     begin;
      $display("Bit: 	  Size = %0d, Value = %0b", $bits(a),a);
      $display("Byte: 	  Size = %0d, Value = %0b", $bits(b),b);
      $display("Shortint: Size = %0d, Value = %0b", $bits(c),c);
      $display("Int: 	  Size = %0d  Value = %0d", $bits(d),d);
      $display("longint:  Size = %0d, Value = %0b", $bits(e),e);
      $display("logic 	  Size = %0d, Value = %0b", $bits(f),f);
      $display("Integer:  Size = %0d, Value = %0d", $bits(g),g);
      $display("Time: 	  Size = %0d, Value = %0t", $bits(h),h);
      $display("Realtime: Size = %0d, Value = %0f", $bits(i),i);
      $display("Reg:	  Size = %0d, Value = %0b", $bits(j),j);
    end
endmodule
---Output----
================================================|
# KERNEL: Bit: 	    Size = 1, Value = 0         |
# KERNEL: Byte: 	Size = 8, Value = 0         |   
# KERNEL: Shortint: Size = 16, Value = 0        |
# KERNEL: Int: 	    Size = 32  Value = 0        |
# KERNEL: longint:  Size = 64, Value = 0        |
# KERNEL: logic 	Size = 1, Value = x         |
# KERNEL: Integer:  Size = 32, Value = x        |
# KERNEL: Time: 	Size = 64, Value = 0        |
# KERNEL: Realtime: Size = 64, Value = 0.000000 |
# KERNEL: Reg:	    Size = 1, Value = x         |       
================================================|
-----------------------------------------------------------------------------------------------------------------------------
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
-----------------------------------------------------------------------------------------------------------------------------
/////////////////////////////////////////////////////////////////////////////////
Bit and byte:
____________________________
    *bit and Byte are Binary.
    *Bit is unsigned, while byte is signed.
module tb;
    bit [7:0]a;
    byte b;
    initial begin
        a=-50;
        b=-50;
        $display("Bit: %0b",a);
        $display("Byte: %0b",b);
        end
    endmodule
--------Output----------
a=204; --- a=256-50=204
b=-50; ---- b=-50;
------------------------
another case:
------------------------
module tb;
    bit signed [7:0]a;
    byte b;
    initial begin
        a=-50;
        b=-50;
        $display("Bit: %0b",a);
        $display("Byte: %0b",b);
        end
    endmodule
--------Output----------
a=-50; ----- bit is converted to signed bit;
b=-50;
------------------------------------------------------------------------------------------------------------
Int and Integer:
    *Int is 2 state, while Integer is 4 state.
____________________________
module tb;
    int a;
    integer b;
    initial begin
        a=16'h10xz;
        b=16'h10xz;
        $display("Int: %0d",a);
        $display("Integer: %0d",b);
        end
    endmodule
--------Output------------------------
a=1000;   ---- 2 state only 1 and 0;
b=10xz;   ----- 4 state 1,0,x,z;
--------------------------------------
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
----------------------------------------------------------------------------------------------------------
\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
Time and Realtime:
__________________
`timescale 1ns/1ns;
module tb;
    time a;
    realtime rt;
    initial begin
    #10.3;
        t=$time;
        rt=$realtime;
        $display("Time: %0t",a);
        $display("Realtime: %0f",b);
        end
    endmodule
--------Output----------
time=10;
realtime=10.00000;
-------------------------
another case:
-------------------------
`timescale 1ns/1ps
module tb;
    time a;
    realtime rt;
    initial begin
        #10.3;
        a=$time;
        rt=$realtime;
        $display("Time: %0t",a);
        $display("Realtime: %0f",b);
        end
    endmodule
--------Output----------
time=10;
realtime=10.30000;
--------------------------------------------------------------------
--------------------------------------------------------------------