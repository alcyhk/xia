# xia
## X inside Architecture

## Description
xia (also known as X inside Architecture) is a family of grid instruction set computer (GISC) instruction set architectures.

## Overview
xia is designed to be the barebone of any electronic device. xia_1st is designed to be a smart device which is capable to perform basic touch, display and wireless feature. xia_1st allows developers to connect various modules via FSMC, DDR, TTL, SPI, TWI and GPIO. A workable demo would be performed by a FPGA Chip.

## Demo
<Video/Gif>


##Getting Started
In order to start the demo, you may need to properly setup your working environment beforehand. The extension board is taylormade for the ease of connecting wire. Please feel free to download the cad file and print it yourself. If you are okay to connect the jumper wires, which is about 40 of these, it should work too.

HW(Hardware) Setup
			Arty 35T
       <pic/official link>
			Alientek TFT LCD 4:3 800x480(NT35510+GT9117)
       <pic/official link>
   
			Waveshare MMC Module
       <pic/official link>

			Extension Board Or Direct GPIOs
       <pic/official link>

			USB Cable 
      <pic/official link>

Environment Setup
		OS Setup
			Linux,Windows,Mac
			gcc
			OpenFPGA Loader
			hexfiend Mac or hexedit(optional)
   
		SW Setup
			Git clone 
			GISC+ Compiler
			bitstream
			


Tutorial

	Hello World
		sh hack.sh
		lain.err
		print("hello world");

	Beginner
		Example: GPIO

		Example: Touch

assign(b,0);
while(1==1){
	chkNoTouch(a);
	if(a==b){
		getTouch(x,y);
		setc0(x);
	}


}
	
		Example: Pointer

assign(a,16774146);
assign(b,30);
assign(c,55);

pts(a,b);
ptg(c,a);

setc0(c);
setc0(a);

		Example: Draw 

assign(xs,0);
	assign(ys,0);
	assign(xe,479);
	assign(ye,799);

	assign(s,xs);
	assign(e,xe);

		
	mul(s,65536);
	add(s,ys);

	arith(e,16,34);
	//mul(e,65536);
	add(e,ye);

	drawFill(0,s,e);
	assign(d,0);
	while(d < 50){
	add(d,1);
	}


		Example: Calculation

assign(a,33);
assign(b,22);
add(a,b);
setc0(a);

		Example: Draw Text
#link<font.err>

fontSetup();
assign(a,491594);
assign(b,0);
drb(a,b);

		Example: Load Data from MMC to Memory

assign(block,0);
assign(memory,12582912);
blk2Mem(memory, block);



ptg(out,memory);
setc0(out);






		Example: Save Data from Memory to MMC



assign(block,491000);
assign(memory,12582912);
assign(out,1);
pts(memory,out);


assign(memory,12582912);

mem2Blk(block, memory);

		
		Example: function
		Example: Multiple Files
		Example: nested if
		if(A > B){
setc0(50);

		}else if(A==B){
setc0(60);

		}
		Example: nested loop
assign(a,0);
assign(b,0);
while(a<25){
	while(b<20){
		setc0(b);
		add(b,1);
	}
	setc0(a);	
	add(a,1);
}


	Intermediate
		touch panel to demo gpio, analog, twi, spi, ttl echo and draw
		CRUD Create Read Update Delete(No Delete to save MMC Lifetime)

		MMC Format
		1. Code Print 
		2. Content
		3. x78000*x200, fonts

		1st Block == pointer to the content


		upper typing area
		lower keyboard

	Advanced 
		All Purpose OS, Knock






Error Language Syntax
Error is case-sensitive, so var_a and var_A are different.

Comments

A single line comment starts with // and tells Verilog compiler to treat everything after this point to the end of the line as a comment.

Whitespace

White space is a term used to represent the characters for spaces, tabs, newlines and formfeeds, and is usually ignored by Verilog except when it separates tokens. In fact, this helps in the indentation of code to make it easier to read.

Keywords

chkc0
setc0
getc0
assign
if 
else
while

arith
add
sub
mul
div
mod
function
end

drawBlk
chkNoTouch
getTouch

setx0
drawFill
drb
gpioSet
gpioGet
anaSet
anaGet

arith 
pts
ptg

blk2Mem
mem2Blk
assignNum

chkc
setc
getc

spiSet
spiGet
chkSpi

twiSet
twiGet
chktwi

blk2Draw
drawMem




one line description then example

API

Method
	chkc0(a);
Description	
check char from uart rx0 
		return the rx0 status to a

	setc0(a);
		print a to uart tx0
		accept ascii decimal number 
	"getc0",//2	1p x
		get char from uart rx0
		save the result in the variable
	"assign",//3  2p x
		assign variable b or number to variable a

	if, else, else if

	while ()

	arith(a,b,c);
		define the operator with c
		a op b then assign to a 

	"add",//10	2p x
	"sub",//11	2p x
	"mul",//12	2p x
	"div",//13	2p x
	"mod",//14	2p x
	
	
	"function",//17
		function name
	"end",//18

	"callFunc",//19
		call function



	"drawBlk",//20 3p var, pos

	"chkNoTouch",//21 1p 
		check if touch event exists, assign the return value to the variable, 1 if no touch, 0 if touched

	"getTouch",//22 2p
		get the coordinate if there is touch
	"setx0",//23 1p

	"drawFill",//24 3p color, pos
	"drb",//25 2p
		load specific block from mmc and display to lcd
	"gpioSet",//26 1p
		accept hex or variable
		set gpio in 32 bit hex, 
		ex. gpio 0,2,4,6 on (05)
	"gpioGet",//27 1p
		get gpio in 32 bit hex
		ex. return (0a) if gpios 1,3,5,7 are on

	"anaSet",//28 2p 
		analog Set
		set analog a in power b
	"anaGet",//29 2p
		analog get
		get analog a and assign the power to variable b

	"arith"//30	3p 

	,"pts"//31	2p 
		set pointer a to variable b
	,"ptg"//32	2p 
		get pointer a and set to variable b

	,"blk2Mem"//33	2p read opval1 block to opval0 ddr
		load block b to ddr a
	,"mem2Blk"//34	2p write opval1 ddr to opval0 block
		save ddr b to block a
	,"assignNum"//35  3p x

	,"spiSet"//39 2p var SPI no.
		spi Set
		set spi a in number b
	,"spiGet"//40 2p var spi no.
		spi Get
		get spi a in number b
	,"chkSpi"//41 1p var spi no.
		check if spi empty
	,"twiSet"//42 2p var TWI no.
		set twi a in number b

	,"twiGet"//43 2p var spi no.
		get twi a in number b

	,"chktwi"//44 1p var spi no.


Code Example





