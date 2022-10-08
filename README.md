# Mixed Signal SoC Design Marathon using eSim and SKY130
# 2x1-Multiplexer
- [Abstract](#abstract)
- [Reference Circuit Diagram](#reference-circuit-diagram)
- [Reference Waveform](#reference-waveform)
- [Circuit Details](#circuit-details)
- [Truth Table](#truth-table)
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
The paper constitutes the design and analysis of a 2:1 Multiplexer. Multiplexer is a combinational circuit that has maximum of 2n data inputs, ‘n’ selection lines and single output line. One of these data inputs will be connected to the output based on the values of selection lines. Since there are ‘n’ selection lines, there will be 2n possible combinations of zeros and ones. So, each combination will select only one data input. Multiplexer is also called as Mux. The 2:1 Multiplexer has been designed using CMOS.
## Reference Circuit Diagram
![image](https://user-images.githubusercontent.com/65547096/156544513-a56eb771-0f57-4460-8687-24f0c9832626.png)
## Reference Waveform
![image](https://user-images.githubusercontent.com/65547096/156544570-7c6d072d-c50e-46d3-9477-8fa27022ec93.png)
## Circuit Details
The given 2:1 MUX has two inputs(i0,i1), one selection input (sel), and one output line(y). Therefore, it can have only two achievable combinations, i.e., 0,1. When selection input is ‘0’ then input line ‘i1’ is preferred and is directed to the output, y. Similarly, when selection input is ‘1’ then input line ‘i1’ is preferred and is directed to the output, y. CMOS based 2:1 MUX is a build-up of two sections namely, pull up lattice and pull-down lattice. Pull up lattice is known as PMOS, and pull-down lattice is known as NMOS. In this model, the PMOS device is connected to the supply voltage (VDD) and NMOS is connected to the ground (GND). Both PMOS and NMOS substrate is given to the source terminal (given to VDD in case of PMOS and GND in case of NMOS). From the circuit, if both i1 and i2 inputs are high, then both the NMOS transistors will conduct, neither of the PMOS transistors will conduct, and a conductive path will be established between the output and VDD, bringing the output low. If both i1and i2 inputs are low, then neither of the NMOS transistors will conduct, while both PMOS transistors will conduct, establishing a conductive path between the output and VDD, bringing the output high. If either of the i1 or i2 inputs is low, one of the NMOS transistors will not conduct, one of the PMOS transistors will, and a conductive path will be established between the output and VDD, bringing the output high.
## Truth Table

| Sel  | i0 | i1 |y |
| ------------- | ------------- | ------------- | ------------- | 
| 0  | 0| 0| 0|
| 0  | 0| 1| 0|
| 0  | 1| 0| 1|
| 0  | 1| 1| 1|
| 1  | 0| 0| 0|
| 1  | 0| 1| 1|
| 1  | 1| 0| 0|
| 1  | 1| 1| 1|

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
![schematic](https://user-images.githubusercontent.com/65547096/156545586-af09b852-7e16-4db4-a572-a8bf164a2350.PNG)
## Verilog Code
![verilog_code](https://user-images.githubusercontent.com/65547096/156546310-1f243d14-6a85-4926-a8d2-27699fa9d426.PNG)
## Makerchip
```
\TLV_version 1d: tl-x.org
\SV
/* verilator lint_off UNUSED*/  /* verilator lint_off DECLFILENAME*/  /* verilator lint_off BLKSEQ*/  /* verilator lint_off WIDTH*/  /* verilator lint_off SELRANGE*/  /* verilator lint_off PINCONNECTEMPTY*/  /* verilator lint_off DEFPARAM*/  /* verilator lint_off IMPLICIT*/  /* verilator lint_off COMBDLY*/  /* verilator lint_off SYNCASYNCNET*/  /* verilator lint_off UNOPTFLAT */  /* verilator lint_off UNSIGNED*/  /* verilator lint_off CASEINCOMPLETE*/  /* verilator lint_off UNDRIVEN*/  /* verilator lint_off VARHIDDEN*/  /* verilator lint_off CASEX*/  /* verilator lint_off CASEOVERLAP*/  /* verilator lint_off PINMISSING*/  /* verilator lint_off BLKANDNBLK*/  /* verilator lint_off MULTIDRIVEN*/  /* verilator lint_off WIDTHCONCAT*/  /* verilator lint_off ASSIGNDLY*/  /* verilator lint_off MODDUP*/  /* verilator lint_off STMTDLY*/  /* verilator lint_off LITENDIAN*/  /* verilator lint_off INITIALDLY*/  

//Your Verilog/System Verilog Code Starts Here:
module sensoham_2to1mux (input i0 , input i1 , input sel , output reg y);
always @ (*)
begin
	if(sel)
		y <= i1;
	else 
		y <= i0;
end
endmodule

//Top Module Code Starts here:
	module top(input logic clk, input logic reset, input logic [31:0] cyc_cnt, output logic passed, output logic failed);
		logic  i0;//input
		logic  i1;//input
		logic  sel;//input
		logic  y;//output
//The $random() can be replaced if user wants to assign values
		assign i0 = $random();
		assign i1 = $random();
		assign sel = $random();
		sensoham_2to1mux sensoham_2to1mux(.i0(i0), .i1(i1), .sel(sel), .y(y));
	
\TLV
//Add \TLV here if desired                                     
\SV
endmodule


```
## Makerchip Plots
![makerchip ghraph_2](https://user-images.githubusercontent.com/65547096/156555274-818b9fdd-9ea2-4903-b648-e82169e1b655.PNG)

## Netlists
![netlistcirout](https://user-images.githubusercontent.com/65547096/156550274-6acc7a11-773b-4a18-b7d8-0b707098dc34.PNG)

## NgSpice Plots
![ngspice](https://user-images.githubusercontent.com/65547096/156550536-bbc115f1-b275-4a3a-8acb-0bffd7342619.PNG)

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
```git clone https://github.com/S-O-H-A-M/2x1-Multiplexer.git ```</br>
3. Change directory:</br>
```cd eSim_project_files/multiplexer```</br>
4. Run ngspice:</br>
```ngspice Multiplexer.cir.out```</br>
5. To run the project in eSim:

  - Run eSim</br>
  - Load the project</br>
  - Open eeSchema</br>
## Author
• Soham Sen , B.Tech (Electronics and Communication Engineering), Amity University Kolkata - sohamsen25420001@gmail.com
## Acknowlegdements
1. <a href='https://www.esim.fossee.in/'>FOSSEE Team, IIT Bombay</a></br>
2. <a href='https://www.makerchip.com/'>MakerChip, RedWood EDA</a></br>
3. <a href='https://www.vlsisystemdesign.com/'>VLSI System Design (VSD) Corp. Pvt. Ltd India</a></br>
4. Kunal Ghosh, Co-founder, VSD Corp. Pvt. Ltd. - kunalpghosh@gmail.com
5. Sumanto Kar, eSim Team, FOSSEE

## References
1.  Shyam Sankalp Pattnaik. Design of 2 to 1 Multiplexer in eSIM. https://cutt.ly/UAwYMew.
2.  N. H. E. Weste. Cmos vlsi design: A circuits and systems perspective. https://cutt.ly/InNnZPb.

