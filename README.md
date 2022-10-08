# Mixed Signal SoC Design Marathon using eSim and SKY130
# 3 BIT SYNCHRONOUS DOWN COUNTER WITH RING OSCILLATOR AS CLOCK
- [Abstract](#abstract)
- [Reference Circuit Diagram](#reference-circuit-diagram)
- [Reference Waveform](#reference-waveform)
- [Circuit Details](#circuit-details)
- [Software Used](#software-used)
  * [eSim](#esim)
  * [NgSpice](#ngspice)
  * [Makerchip](#makerchip)
  * [Verilator](#verilator)
- [Circuit Diagram in eSim](#circuit-diagram-in-esim)
- [Verilog Code](#verilog-code)
- [Makerchip](#makerchip-1)
- [Makerchip Plots](#makerchip-plots)
- [Netlists](#netlists)
- [NgSpice Plots](#ngspice-plots)
- [Steps to run generate NgVeri Model](#steps-to-run-generate-ngveri-model)
- [Steps to run this project](#steps-to-run-this-project)
- [Author](#author)
- [Acknowlegdements](#acknowlegdements)
- [References](#references)

<small><i><a href='http://ecotrust-canada.github.io/markdown-toc/'>Table of contents generated with markdown-toc</a></i></small>


## Abstract
The paper constitutes the design and analysis of a 3 bit Down Counter. This circuit uses Ring Oscillator as clock. It mainly focuses on the mixed signal circuit design. In this design, a 3 bit down counter is implemented using Verilog code and ring oscillator is implemented using CMOS logic. As computer system consists of sequential  circuits mostly, it is very important to design sequential     circuits effectively and flawlessly for ensuring least power dissipation and architectural simplicity. Counters are very important segments of sequential circuit system. In this paper we have proposed a design scheme to develop a  down counter with ring oscillator as clock input.

## Reference Circuit Diagram
![image](https://user-images.githubusercontent.com/65547096/194720399-ee3ae0d1-31ce-4c98-880a-5890b867d4ae.png)
Figure 1(a): 3 bit Synchronous Down Counter

![image](https://user-images.githubusercontent.com/65547096/194720407-08a9f5ca-a4d4-44d9-9c59-508b3a37b720.png)
Figure 1(b): CMOS Ring Oscillator using 3 inverters
## Reference Waveform
![image](https://user-images.githubusercontent.com/65547096/194720442-e615db12-e3d4-4e5b-a980-77693b3d56b7.png)

## Circuit Details
A Down Counter is an application of shift registers. N number of flipflops are required for N bit counter. For a 3 bit counter, 3 Flipflops are required. It counts from 7 down to 0. Here T flipflop is used. Synchronous counter has one global clock which drives each flipflop so output changes in parallel. CMOS Ring oscillator is the most popular oscillator topology in recent days due to its CMOS technology advantages. In this architecture the last  inverter’s output is connected to the first inverter’s input through a feedback path. It is known as the ring oscillator because of inverters are connected in ring fashion. The number of inverter stages in this oscillator       mainly depends on the frequency which we want to generate from this oscillator.
Time period of ring oscillator(T)=2*n*Td 

Td=Propagation delay of each inverter 

Frequency of ring oscillator(f)=1/T 

n=Number of inverters

The frequency of oscillation is dependent on the number of stages and delay time of each inverter stage.

## Software Used
### eSim
It is an Open Source EDA developed by FOSSEE, IIT Bombay. It is used for electronic circuit simulation. It is made by the combination of two software namely NgSpice and KiCAD.
</br>
For more details refer:
</br>
https://esim.fossee.in/home
### NgSpice
It is an Open Source Software for Spice Simulations. For more details refer:
</br>
http://ngspice.sourceforge.net/docs.html
### Makerchip
It is an Online Web Browser IDE for Verilog/System-verilog/TL-Verilog Simulation. Refer
</br> https://www.makerchip.com/
### Verilator
It is a tool which converts Verilog code to C++ objects. Refer:
https://www.veripool.org/verilator/

## Circuit Diagram in eSim
The following is the schematic in eSim:
![schematic](https://user-images.githubusercontent.com/65547096/194720747-4855fa73-6304-4240-96fd-4de5315dd627.PNG)
## Verilog Code
```
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

```
## Makerchip
```
\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off LATCH*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off NULLPORT*/  /* verilator lint_off EOFNEWLINE*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  /* verilator lint_off */  

//Your Verilog/System Verilog Code Starts Here:
module sohamsen_synchronous_down_counter(input clk, reset, output [3:0] counter);

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

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  [3:0] counter;//output
//The $random() can be replaced if user wants to assign values
		sohamsen_synchronous_down_counter sohamsen_synchronous_down_counter(.clk(clk), .reset(reset), .counter(counter));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule


```
## Makerchip Plots
![waveform_makerchip](https://user-images.githubusercontent.com/65547096/194720540-7b30082b-4b8a-4ed2-aa78-af50f856336e.PNG)

## Netlists
![netlist](https://user-images.githubusercontent.com/65547096/194720671-0398077b-8032-4a8b-ada8-5e656f60d975.PNG)

## NgSpice Plots
![WAVEFORM](https://user-images.githubusercontent.com/65547096/194720682-c89b133d-d11a-438c-ba10-e6b91f4bc583.PNG)

## Steps to run generate NgVeri Model
1. Open eSim
2. Run NgVeri-Makerchip 
3. Add top level verilog file in Makerchip Tab
4. Click on NgVeri tab
5. Add dependency files
6. Click on Run Verilog to NgSpice Converter
7. Debug if any errors
8. Model created successfully
## Steps to run this project
1. Open a new terminal
2. Clone this project using the following command:</br>
```git clone https://github.com/S-O-H-A-M/3-BIT-SYNCHRONOUS-DOWN-COUNTER-WITH-RING-OSCILLATOR-AS-CLOCK ```</br>
3. Change directory:</br>
```cd counter```</br>
4. Run ngspice:</br>
```ngspice counter.cir.out```</br>
5. To run the project in eSim:

  - Run eSim</br>
  - Load the project</br>
  - Open eeSchema</br>
## Author
• Soham Sen , M.Tech (Microelectronics and VLSI), National Institute of Technology Silchar - sohamsen25420001@gmail.com
## Acknowlegdements
1. <a href='https://www.esim.fossee.in/'>FOSSEE Team, IIT Bombay</a></br>
2. <a href='https://www.makerchip.com/'>MakerChip, RedWood EDA</a></br>
3. <a href='https://www.vlsisystemdesign.com/'>VLSI System Design (VSD) Corp. Pvt. Ltd India</a></br>
4. Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd. - kunalpghosh@gmail.com
5. Sumanto Kar, eSim Team, FOSSEE

## References
1.  CMOS Inverter Ring Oscillator. shorturl.at/flMW7
2.  Digital Circuits - Counters. shorturl.at/HKV23

