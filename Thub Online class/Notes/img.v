System Task: An identifier which starts with a $ symbol is called a system task. A System Task must return one or more values.

    $display: Used to display information and automatically adds a new line character.
    
    $monitor: Used to monitor a statement and display information if any changes occur.
    
    $strobe: Used to print the values at the end of the current simulation time.
    
    $write: Used to display information in a single line.
    
    $finish: Indicates the end of the simulation. No more statements are executed after $finish.
    
    $stop: Gives a temporary halt to the simulation, or holds the simulation for some time, or suspends the simulation.
    
    $random: Used to provide random values from a given range. Example: a[63:0]
    
    $time: Used to show the current simulation time.

Compilier Directives:
    `include:{Used to copy the content of one file into another file}.

    `define:{Used to define the macros to improve the readability}.
                macro: a piece of code that can be reused in the program by defining it once as a macro.
    
    `undef:{Used to undefine the macros}.

    `ifdef:{Used to check if a macro is defined or not}.
    
    `timescale:{Unit of time scale used in the simulation}.

    `resetall:{Used to reset all the compiler directives}.
FSM: Finite State Machine
    A finite state machine is a model of computation that can be in one of a finite number of states at any given time. It can transition between states based on inputs and conditions.
    
    Types of FSM:
        1. Moore FSM: The output depends only on the current state.
        2. Mealy FSM: The output depends on both the current state and the input.
    Example: Traffic Light
        Red=0
        Yellow=1
        Green=1
    Digram of moore and mealy