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