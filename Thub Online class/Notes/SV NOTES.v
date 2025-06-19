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
----------------------------------------------------------------------------------------------------------

------ Time and Realtime:
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

27/05/2025
** INTERPROCESS SYNCHRONIZATION \\
    *Interprocess synchronization is a mechanism that allows multiple processes to coordinate their execution and share resources.
    *It is used to ensure that processes do not interfere with each other and can work together effectively.
    *In SystemVerilog, interprocess synchronization can be achieved using semaphores, mailboxes, and events.
    *These constructs allow processes to communicate and synchronize their actions, ensuring that they operate correctly in a concurrent environment.

**What is a process.
    *A process is a sequence of statements that execute in a specific order.
    *In SystemVerilog, processes are typically defined using the `always` or `initial` blocks.

SV defines the following states of aprocess:
    finished
    running
    suspended
    killed/terminated
example:
```systemverilog
initail begin
   begin:p1//process 1
         //process 1 statements
    end:p1
    begin:p2//process 2
            //process 2 statements
     end:p2
end


---------------------------------------------------------------------------------
**SV TB Architecture:**
    *The SystemVerilog Testbench (SV TB) architecture is a structured approach to designing testbenches for verifying digital designs.
    *It consists of several components that work together to generate stimuli, drive inputs to the Design Under Test (DUT), monitor outputs, and check functionality.
    *The main components of the SV TB architecture include:
        - Generator
        - BFM (Bus Functional Model) / Driver
        - Monitor
        - Coverage Block
        - Reference Model
        - Checker
    **These components interact through a mailbox or communication channel to facilitate the flow of data and control signals**

To Generator:
    Generate Scenario/ Stimulus / Test Vectors/ Transactions.
    Give Those Scenarios / Transaction to the BFM / Drive Through Mailbox.
    Get the Response transaction from the Driver / Bfm if needed.

BFM / Driver:
    Get the Transaction from the Generator through Mailbox
    Drives Those Transactions to the DUT through interterface.
    Collect the Response from the DUT through intrerface.
    Give the Resonse back to the Generator.

Monitor:
    Monitors the Interface Transactions.
    Collect the Transaction when transfer is Valid.
    Give the Transactions to the Functional Coverage and Reference Model.

Coverage Block:
    Gets Transaction from Manitor.
    Trigger the Covergruop sampling whenever transaction Completed.

Reference Model:
    Get the Transaction from the Monitor.
    Update the Register Model with Recent transaction from the monitor
    Use the Register Model Programming get the Expected output.
    Prove the Expected Output to the Checker.

Checker:
    Get the Expected Output From the Reference model.
    Get the Actual output from Design interface Monitor.
Compare Transactions from the reference model and Monitor
-----------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
Q. BFM can not Drive a transaction unless Generator gives the Transaction ?
    Ans: This is called Process Dependency.

Q. BFM Can't proceed unless Generator gives the Transaction ?
    Ans: There is a need of Synchronization between the Generator and BFM.
        *** For this kind of Synchronization we use Mailbox.

Mailbox: (Generator and BFM) / (Monitor and Scoreboard)
    => Mailbox is Dynamic Construct. Hence it needs New() for memory allocation.
    => Mailbox memory can be increased / Decreased / Delete at Run time.
    => Mailbox behaviour is similar to FIFO.
    => Mailbox Brings Blocking Nature in between the Communicating Devices (Generator and BFM).
Q. Why Queue can't be used for Connecting Generator and BFM.
    Ans: Queue is also a FIFO.
    => But Queue is not a Blocking Construct.

*so Mailbox is used for communication between Generator and BFM.
    Mailbox is Unidirectiional.

--Mailbox Types:__
    1.Blocking Mailbox:
        -> {put(),get(),peek()}--> Tasks [These are executed at non zero time ]

    2.Non Blocking Mailbox:
        -> {try_put(),try_get(),try_peek()}--> Functions [These are executed at zero time]

--> get()---> wait until data is available and get data drom the mailbox.
--> put()---> wait until space is available and put data into the mailbox.
--> peek()---> wait until data is available and get data from the mailbox without removing it.

--> try_get()---> dosent wait until data is available and returns null if no data is available.
--> try_put()---> dosent wait until space is available and returns 0 if no space is available.
--> try_peek()---> dosent wait until data is available and returns null if no data is available
         
    ---> try() functions are used to avoid blocking nature of mailbox.
            *These functions return 0 or null if the operation cannot be completed immediately.
            *They are useful when you want to check the status of the mailbox without blocking the execution of your code.

**********
    1.Gneric Mailbox:
        *It can get or put any type of data.
        *It is created using the `new()` method without any type parameter.
          Syntax:
                mailbox <mailbox name>;
        *Example:
            mailbox m = new();
            m.put(42); // Putting an integer
            m.put("Hello"); // Putting a string
            int data = m.get(); // Getting data from the mailbox

    2.Parametric Mailbox:
        *It can get or put only a specific type of data.
        *It is created using the `new()` method with a type parameter.
         Syntax:
                mail box #<data type> <name> = new();
        *Example:
            mailbox #int m = new(); // Typed mailbox for integers
            m.put(42); // Putting an integer
            int data = m.get(); // Getting data from the mailbox
            // m.put("Hello"); // This will cause a compile-time error
*********
--based on size--

    1.Bounded Mailbox:
        *It has a fixed size and can hold a limited number of messages.
        *It is created using the `new()` method with a size parameter.
          Syntax:
                mailbox #<data type> <name> = new(<size>);
        *Example:
            mailbox #int m = new(10); // Bounded mailbox for integers with size 10
            m.put(42); // Putting an integer
            int data = m.get(); // Getting data from the mailbox
            // If the mailbox is full, put() will block until space is available

    2.Unbounded Mailbox:
        *It can grow dynamically and has no fixed size.
        *It is created using the `new()` method without a size parameter.
          Syntax:
                mailbox #<data type> <name> = new();
        *Example:
            mailbox #int m = new(); // Unbounded mailbox for integers
            m.put(42); // Putting an integer
            int data = m.get(); // Getting data from the mailbox
            // The mailbox can grow as needed
//this is typed in my mobile. just checking😜
/////////////////////////////////////////////////////////////////////////////////////////////
120625
//////////////////////////////////////////////////////////////////////////////////////////////
UART :
Universal Asynchronous Receiver Transmitter (UART) is a hardware communication protocol used for serial communication between devices. It allows for asynchronous data transmission, meaning that data can be sent and received without the need for a clock signal. UART is commonly used in embedded systems, microcontrollers, and communication interfaces.
UART: Supports Serial Communication
TV Remote to TV Connection
      TV Remote                                    TV
┌─────────────────────┐                    ┌─────────────────────┐
│                     │                    │                     │
│  [CHIP]  │ [UART]   │ ═══ Serial Data ═══│ [UART] │ [Processor]│
│          │ [Txer]   │                    │ [Rxer] │            │
│          │          │                    │        │            │
└─────────────────────┘                    └─────────────────────┘
    
    From Chip to UART Txer Data can be Transmitted in Parallel

Parallel to Serial Conversion

Parallel Data                                          Serial Data

                 ┌───────────────┐                    ┌───────────────┐    
Parallel Data ==>│               │ ═══ Serial Data ═══│               │
                 │   UART Txer   │                    │   UART Rxer   │
                 │               │                    │               │
                 └───────────────┘                    └───────────────┘
                                                              ║
                                                              ║ ═══════════
                                                              ║ ═══════════
                                                              ║ ═══════════
                                                              ║ ═══════════
                                                              ▼
                                                         Parallel Data
Mostly 9600 baud rate is used in UART communication.
the maximum baud rate is 2764800.
----> UART always contains baud rate.
    
     Parity Bit : Is used to detect errors in data transmission.
    *Parity bit is an extra bit added to a binary data to make the number of 1's either even or odd.

     ----> 8 Bit Data : 1000_1001
        ==>Data Contains odd number of 1's then the parity is called Odd Parity.
        ==>Data Contains even number of 1's then the parity is called Even Parity.
    --->In the abouve data 3 1's are there so the parity is Odd Parity.
    --->Whenever the data with odd parity then the parity bit is 1.
    --->1000_1001 = 0100_1001
=======================================================-=-=-=-=-=-=-=-=--=-=-=
 Here's the text from the image:

Interview Questions on UART:

Q1. What are the Different pins of the Simple UART and List them?
- Transmitter and REciver 
     in practical 
       *UART Tx :
        --->Clock and Reset,Newd(1 Bit),din_tx[7:0]==> input
        --->tx(1 bit),tx_done                      ==> output
       *UART Rx :
        --->Clock ,reset and Rx                    ==> input
        --->rx_dout,done                           ==> output

Q2. What are the Application of UART?
- it is basically serial interface short distance communication.
- Commonly used in *Bluetooth * Wifi *GPS *GSM *Modem *RS232 *RS485 *RS422

Q3. Define Bit rate and Baud Rate?
- Bit Rate: The number of bits transmitted per second in a communication channel.
- Baud Rate: The number of bits transmitted per second including parity bits ,satrt,stop..
   > In UART, baud rate is often equal to bit rate, but it can differ in other communication protocols where multiple bits are encoded in a single symbol.

Q4. What is the Significance of baud Rate in UART?
- Baud rate : 9600 (It means that 9600 bits are transmitted per second).
  Baud rate : 2400 (It means that 2400 bits are transmitted per second).
Baud rate is significant in UART because it determines the speed of data transmission between devices.
           A higher baud rate allows for faster communication, but it also requires more precise timing and synchronization between the transmitter and receiver.
          If the baud rate is too high for the devices to handle, it can lead to data loss or corruption. 

Q5. Difference Between the Synchronous and Asynchronous Interface and where uart fits?
- Synchronous Interface: 
-Asynchronous Interface:

Q6. What is the purpose of Start bit, Stop bit and Parity bits?
- Start Bit: 
  - The start bit signals the begi
Q7. What is the use of UART FIFO?

Q8. What is the Maximum Baud Rate value?

Q9. What is the Condition for Idle State?

Q10. How Does UART Transmitter Identifies new Data is Available?

Q11. How Does Slave Comes to Know that Transmitter is Ready to Transmit

Q12. What is the Size of the tx and What its Purpose?

Q13. What are Reasons to get Errors in the Data Transfer?

Q14. What are the Common Configurations used in UART?

Q15. What is Software Control Flow and Hardware Control?

Q16. Type of Communication Supported by the UART?

Q17. Why UART is best Suitable for the Serial Communication?

Q18. What is the Most Commonly Used Baud Rate in UART?

Q19. What is the Significance / Importance of UART?
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
140625


Here's the text from the image:

I2C Protocol : Inter Integrated Circuit Protocol
---> Designed by the Philips Semiconductor in 1982.
---> Supports Multipoint Communication ( Between Multiple masters and Multiple Slaves)
---> I2C Combains the features of UART and SPI
---> I2C Is also Known as TWI ( Two Wired Interface )
---> One Master will Connect with Multiple Slaves / Multiple Masters Control the Multiple Slaves.

Q1. Is I2C is Serail Interface / Parallel Interface?
Ans: Serial Interface

Q2. I2C is Synchronous / Asynchronos Protocol ?
Ans: Synchronous Protocol ( Both Master Slave Shares the Common Clock )

Q3. Is I2C Supports 2 / 4 / 8 / 16 / 32 Data Transfer ?
Ans: 8 Bit Data Transfer

Q4. Is I2C Supports Simple / Half Duplex / Full Duplex ?
Ans: Half Duplex Communication

Q5. How Master will Control the Slave / Slaves ?
Ans: Master will ContrL the SLave by using the line called S

*** I2C Contains 2 wires:
SCL ( Serial Clock): Serial Clock is Always Generated by the Master and it is given to the

"=====Simple I2C Digram===="
            
            Master                                Slaves
┌─────────────────────┐                   ┌─────────────────────┐
│                     │                   │                     │      > It Has 2 wires.
│            SCL      │ ----------------> │                     │      > SCL : Serial Clock.
│                     │                   │                     │          │      > it is always generated by the master and given to the salve to control it ("Unidirectional").
│            SDA      │ <------- -------> │                     │      > SDA : Serial Data.
│                     │                   │                     │          |      > it is used to transfer the data between master and slave. ("Bidirectional").
│_____________________│                   │_____________________|


            __________________________________________
           |          │                 │             │
           | Header   │   Payload/Data  │ Footer      │   
           |__________|_________________|_____________|

 _____________________                     _____________________
|                     │                   │                     │
│     I2C Master      │ =============>    │    T2C Slave        │
│                     │                   │                     │   
└─────────────────────┘                   └─────────────────────┘
    
    Data = 1001_1010
    Header=Sender Adresss
    Footer=Reciver Address
    Payload = Data
[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[[{{{{{{}}}}}}]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]]
Here's the information from the image, rewritten for clarity and conciseness:

**I2C Packet Format:**

* **Start Condition:** This is signaled by a high-to-low transition on the Serial Data Line (SDA) while the Serial Clock Line (SCL) is held high.
* **Stop Condition:** This is signaled by a low-to-high transition on the SDA line while the SCL is held high.

**Addressing:**

I2C supports both 7-bit and 10-bit addressing modes.

* An I2C address typically consists of:
    * The 7-bit or 10-bit device address.
    * A 1-bit Read/Write (R/W') bit, which indicates the desired operation:
        * `R/W' = 1` for Read
        * `R/W' = 0` for Write

**Example 7-bit Address:**

* `1111001`

**8-bit Transmission Format (for 7-bit addressing):**

When transmitting an address, it's typically combined with the R/W' bit to form an 8-bit byte.

* `a7 a6 a5 a4 a3 a2 a1 a0` (This represents the 8-bit byte being transmitted)
    * `a7 a6 a5 a4 a3 a2 a1` represents the 7-bit device address.
    * `a0` represents the R/W' bit.
    =====> (Adress(7Bit),R/W)={a7,a6,a5,a4,a3,a2,a1,a0}
                             = {1,1,1,1,0,0,1,0} (Address=0)
                             = {1,1,1,1,0,0,1,1} (Address=1)
        
+-------------------+                                                                    +------------------+
|      Master       |                                                                    |      Slave       |
+-------------------+                                                                    +------------------+

            +-------+---------+-----+-----+----------+-----------+----------+-----------+-----+
            | Start | Address | R/W | ACK | 8-bit   | ACK/NACK  | 8-bit    | ACK/NACK  | Stop|
            | (1b)  | (7b)    |(1b) |/NACK|  Data   |  (1b)     |  Data    |  (1b)     |(1b) |
            +-------+---------+-----+-----+----------+-----------+----------+-----------+-----+
                |        |      |      |       |          |          |           |         |
                |        |      |      |       |          |          |           |         |
                V        V      V      V       V          V          V           V         V

            Start  7-bit   R/W=1:Read   ACK=+ve    8-bit     ACK=+ve     8-bit      ACK=+ve   Stop
            Cond.  Addr.   R/W=0:Write  NACK=-ve   Data      NACK=-ve    Data       NACK=-ve  Cond.

            Legend:
            Start Condition: SDA goes low while SCL is high
            Stop Condition:  SDA goes high while SCL is high
            ACK = Acknowledge (+ve)
            NACK = Not Acknowledge (-ve)

            SCL:  __|‾‾‾‾‾‾|_____
            SDA:  ‾‾|_____|‾‾‾‾‾‾

            (Start Condition: SDA falls while SCL is high)

            SCL:  __|‾‾‾‾‾‾|_____
            SDA:  __|‾‾‾‾‾‾|_____

            (Stop Condition: SDA rises while SCL is high)
///////////////////////////////////////////////////////////////////////
APB PROTOCOL interview questions:

Multidrop Comm: Communication between the Single Master and Multiple Slave.
Multipoint Comm: Communication Between Multiple Masters and Multiple Slaves.

Q4. How APB Master Selects the APB Slave ?
Ans: APB Master Selects the APB Slave by Asserting the pselx Pin (psel=1).

Q5. What is the Condition for Write Transfer with and without Wait Condition ?
Ans:
Write Transfer With Wait Condition:
Write Transfer Without Wait Condition:

psel=1, penable=1, paddr=8'hAB, Pwrite=1, Pwdata=8'h12 and pready=0
psel=1, penable=1, paddr=8'hAB, Pwrite=1, Pwdata=8'h12 and pready=1

Q6. Why APB Protocol is called Simple Interface ?
Ans:
APB Protocol Contains the Simple Signals Description.

I

Q7. What is the Condition for Slave Error in APB protocol ?
Ans:
pslverr=1 ( Failure Transaction)
pslverr=0 (Success Transaction)

Q8. What is the use of Bridge in AMBA Architecture ?
Ans: In AMBA Architecture Bridge is used in between the High Speed and Low Speed Components. It can be used to match the Speeds.
Clock Crossing ( Speed Match)

Q9. What are called Response Signals and How they will Work ?
Ans:
pready =1 (Slave is Ready to Accept the Data from the Master)
=0 (Slave is not Ready to Accept the Data From the Master)
pslverr =1 (Failure Transaction)
=0 (Success Transaction)

Q10. How APB Master will get the Response of the Slave ?
Ans: By Using preadySignal
pready = 1 (Slave is Ready to Accept the Data from the Master)
= 0 (Slave is not Ready to Accept the Data From the Master)

Q11. How can we get the Status of the Data Transfer from Master to Slave (In APB) ?
Ans: pstrb ( Strob Signal ) ---> It can be only for Write
Srobe Signal Size: 4 bit
0001---> 8 bit Data Transfer is Completed
0011--->16 bit Data Transfer is Completed
0111---> 24 bit Data Transfer is Completed
1111---> 32 bit Data Transfer is Completed

Q12. What is the Difference between the APB Interface and Control Iterface?
Ans:
APB Interface : It is used to define the Signals in Master Point of View
Control Interface: It is used to define the Signals in Slave Point of View.

Q13. What is the Use of PPROT ?
Ans: Protect Signal:
To permit the Normal and Priviliged Access.

Q14. Why APB Requires the 2 Clock Cycles for Data Transfer ?
Ans:
One Cycle: psel
One Cycle: penable

Q15. Define Idle, Setup and Access States?
Ans:
idle: psel=0 and penable=0
setup: psel=1 and penable=0
Access: psel=1 and penable=1

Q16. Fine the kinfd of Operation Replicated from the following ?
A. (psel && penable && pwrite)=1 (Write Operation)
B. (psel && penable && !pwrite)=1 (Read Operation)

Q17.
psel<=1
penable<=1
ready<=0
Find the State ?
Ans: Access State with Wait Condition

Q18. Disadvantages of Single Master in APB?
Ans:
---> Low Throughput
---> Low Performance
---> Non Pipelined
///////////////////////////////////////////////////////////////////////////////////////////////////
SPI Protocol:(Serial Peripheral Interconnect)

>Developed by Motorola in 1980.
>Serial Protocol
>Used for multidrop communication.(Single master and multiple slaves)
>It can be used in most of Architecture like 8051(Micro_controller).
                                             x86(8086,80286,80386,80486)
                                             ARM(Advanced RISC Machine)
                                             PIC(peripheral interface contoller)
                                             AVR (advanceVirtual RISC)
{"Risk = Reduced Instruction Set Computer"}

Android Mobiles : Processor (CISC or RISC)
IPHONE : RISC V Processor.

--> SPI is a Synchronous Protocol. (Master and Slave run at same speed)
--> SPI CLock is Generated by the Master. and it is applied to the slave.