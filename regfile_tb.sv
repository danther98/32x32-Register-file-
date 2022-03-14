module regfile_tb();




//clock and write enable signals
reg[1:0] clk;
reg[1:0] we3;



//output file stuff
integer desc3;
integer handle3;



//inputs to DUT are reg
reg[4:0] ra1;
reg[4:0] ra2;

reg[31:0] wd3;
reg[4:0] wa3;

reg[31:0] rf;

reg [31:0] rd1; 
reg [31:0] rd2;

//DUT instantiation 
regfile dut (
    .clk(clk),
    .we3(we3),
    .ra1(ra1),
    .ra2(ra2),
    .wd3(wd3),
    .rd1(rd1),
    .rd2(rd2),
    .wa3(wa3)

);
//set clock and write enable 
initial begin
    	clk=1'b1;
	we3=1'b1;
    forever #5 clk=~clk;
    forever #5 we3=~we3;
end

initial begin
    handle3=$fopen("rftest.out");
    #2500 $finish;

end

always 
    begin
        desc3= handle3;
        #20 $fdisplay(desc3, "%b | %b %b",wd3, rd1, rd2);//shows write and read data output 
        if(wa3==5'b0)//checking if write address is equal to 0 
        wd3=32'b0;//overwriting any value with 0 
ra1=wa3;//read address is set to write address
ra2=wa3;
    




    
end
//Starting inputs 


initial begin
	#0 rf=32'h0000_0000;
   #0 we3=1'b1;//enabling write 
   #0 ra1=5'b00000;
   #0 ra2=5'b00000;
   #0 wa3=5'b00000;
	#10 wd3=32'h0000_0003;//trying to write random value to register 0
    //writing data and write address after waiting 10
#10 wa3=5'b00001;//2nd
#10 wd3=32'h0000_0001;

#10 wa3=5'b00010;//3rd
#10 wd3=32'h0000_0002;

#10 wa3=5'b00011;//4
#10 wd3=32'h0000_0003;

#10 wa3=5'b00100;//5
#10 wd3=32'h0000_0004;

#10 wa3=5'b00101;//6
#10 wd3=32'h0000_0005;

#10 wa3=5'b00110;//7
#10 wd3=32'h0000_0006;

#10 wa3=5'b00111;//8
#10 wd3=32'h0000_0007;

#10 wa3=5'b01000;//9
#10 wd3=32'h0000_0008;

#10 wa3=5'b01001;//10
#10 wd3=32'h0000_0009;

#10 wa3=5'b01010;//11
#10 wd3=32'h0000_000A;

#10 wa3=5'b01011;//12
#10 wd3=32'h0000_000B;

#10 wa3=5'b01100;//13
#10 wd3=32'h0000_000C;

#10 wa3=5'b01101;//14
#10 wd3=32'h0000_000D;

#10 wa3=5'b01110;//15
#10 wd3=32'h0000_000E;

#10 wa3=5'b01111;//16
#10 wd3=32'h0000_000f;

#10 wa3=5'b10000;//17
#10 wd3=32'h0000_0010;

#10 wa3=5'b10001;//18
#10 wd3=32'h0000_0011;

#10 wa3=5'b10010;//19
#10 wd3=32'h0000_0012;

#10 wa3=5'b10011;//20
#10 wd3=32'h0000_0013;

#10 wa3=5'b10100;//21
#10 wd3=32'h0000_0014;

#10 wa3=5'b10101;//22
#10 wd3=32'h0000_0015;

#10 wa3=5'b10110;//23
#10 wd3=32'h0000_0016;

#10 wa3=5'b10111;//24
#10 wd3=32'h0000_0017;

#10 wa3=5'b11000;//25
#10 wd3=32'h0000_0018;

#10 wa3=5'b11001;//26
#10 wd3=32'h0000_0019;

#10 wa3=5'b11010;//27
#10 wd3=32'h0000_001A;

#10 wa3=5'b11011;//28
#10 wd3=32'h0000_001B;

#10 wa3=5'b11100;//29
#10 wd3=32'h0000_001C;

#10 wa3=5'b11101;//30
#10 wd3=32'h0000_001D;

#10 wa3=5'b11110;//31
#10 wd3=32'h0000_001E;

#10 wa3=5'b11111;//32
#10 wd3=32'h0000_001F;



end






 

//test stimulus
always @(posedge clk)
begin
    if(we3)//continues if write enable is high
    rf[wa3]<=wd3;//writing data into register
rd1<=wd3;//reading data from write
rd2<=wd3;

  
end

 


       
   
   
   
    
    








endmodule