#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "defineGisc.h"















#define SYSTEM_PTR  0xfff800







#define FUNC_STACK_DEPTH 0xfe0000




#define FUNC_STACK_BASE  	0xfff400



#define USER_PTR_BASE  0x00fe0000





#define USER_PTR_SIZE 0x1f7ff + 1



#define USER_APP_BASE 0x700000 
#define USER_RAM_BASE 0xfdc000 

					




#define USER_APP_MMC 0x210000 




#define USER_MEM_SIZE  0xfdfe 
#define USER_MEM_DEPTH 0xfdd001

#define OP_NULL_TEXT "0x00000000"

 









void verbose(char* code){
	int line;
	while(*code != 0){
		printf("%d %s", line++, code);

	}
}

char* hexToText(unsigned int currParaVar);
void op_x(unsigned int op, unsigned int a, unsigned int b, unsigned int l);
void op_t(unsigned int op, unsigned int a, char* b, unsigned int l);



char** statements;
char** tokens;

int stmtNumLines = 0;
int stmtNumChars = 0;

int tokNumLines = 0;
int tokNumChars = 0;

int numTokens = 0;

	FILE *fileWrite;
 	FILE *fileRead;

int debug = 0;

#define MAXTOKENS 1048575

#define MAXBRACKETRECUR 65536
#define NUMOFFUNCS 49










char funcName[][40] =
{ 
	"chkc0",
	"setc0",
	"getc0",
	"assign",
	"ifs",
	"wh{",
	"wh}",
	"whs",
	"if{",
	"ef}",
	"add",
	"sub",
	"mul",
	"div",
	"mod",
	
	"eli",
	"els",
	"function",
	"end",
	"callFunc",
	"drawBlk",
	"chkNoTouch",
	"getTouch",
	"setx0",
	"drawFill",
	"drb",
	"gpioSet",
	"gpioGet",
	"anaSet",
	"anaGet",

	"arith"
	,"pts"//pointer set
	,"ptg"//pointer get

	,"blk2Mem"
	,"mem2Blk"
	,"assignNum"

	,"chkc"
	,"setc"
	,"getc"

	,"spiSet"
	,"spiGet"
	,"chkSpi"

	,"twiSet"
	,"twiGet"
	,"chkTwi"
	,"if}"
	,"blk2Draw"
	,"drawMem"
	,"ldb"
	

	


};



char* currFunc;
char* currFunc3;
char* currPara;
char* currPara0;
char* currPara1;
char* currPara2;

char* currPara3;
char* currPara4;

char* currPara5;
char* currPara6;

char* currParaTmp0;
char* currParaTmp1;


char* currPara32_0;
char* currPara32_1;




void statement(char* code){

	
	char* codeCursor = code;
	int line = 0;
	statements = malloc(MAXTOKENS); 
	*statements = malloc(256); 
	*(statements) = malloc(256); 

	 while(*codeCursor != 0){

	 	if(*codeCursor != '\r' && *codeCursor != '\n'){

	 		if(*codeCursor == ';' && *(codeCursor+1) == '\n'){
	 			

	 			
	 			(*statements) = (*statements) - stmtNumChars;
	 			stmtNumChars = 0;
	 			statements++;
	 			*(statements) = malloc(256); 

	 			
	 			stmtNumLines++;
	 		}
	 		else{
	 			
	 			(**statements) = *codeCursor;
	 			(*statements)++;
	 			stmtNumChars++;
	 		}
	 	}
	 	codeCursor++;
	 		 	
	 	

	 }
	 
	 statements = statements - stmtNumLines;

	
	
	
	
	
	
}






char* test;
void tokenize(){

	
	int line = 0; 
	tokens = malloc(MAXTOKENS); 
	
	
	
	char* tmp;
	int n = 0;
	int m = 0;
	



 
	
	
	
	

	int flagQuoteSpace = 0;

	for(int i = 0; i < stmtNumLines; i++){

	 	
	 	tmp = *(statements+i);
	 	

	 	
	 	
	 	
	 	*(tokens+numTokens) = malloc(8*100); 
		
		flagQuoteSpace = 0;
	 	while(*(tmp+n) != 0){

	 		if(*(tmp+n) == 34 && flagQuoteSpace == 0){
	 			flagQuoteSpace = 1;
			} else if(*(tmp+n) == 34 && flagQuoteSpace == 1){
				flagQuoteSpace = 0;

			}

			if(*(tmp+n) == ' ' && flagQuoteSpace == 1){
				*(*(tokens+numTokens)+m) = *(tmp+n); 
	 		 	m++;
			}else 

	 		if(*(tmp+n) != ' '){
	 		 *(*(tokens+numTokens)+m) = *(tmp+n);
	 		 

	 		 
	 		 m++;
	 		}else {
	 		
	 		
	 		m = 0;
	 		 numTokens++;	
	 		*(tokens+numTokens) = malloc(8*100); 

	 		 
	 		}
	 		n++;

	 		
	 	}
	 		 		 

	  	
	 	
	 	n = 0;
	 	
	 	

	}


}



#define SHOWLINE
#ifdef SHOWLINE
void parse(){
	
	
	int goLine0 = 0;
	int goLine1 = 0;
	int goLine2 = 0;
	int goLine3 = 0;
	int goLine4 = 0;
	int tmpLine = 0;
	char* tmpStr = NULL;
	unsigned int funcDepth = 0;


	int i = 0;
	int r = 0;
	int line = 0;
	int* bktRecur = malloc(MAXBRACKETRECUR);
	int b = 0;

	
	while(*(tokens+i) != NULL){
		
		
		
		
		int currParaPos;
		int currParaIndex;
		int currParaNum;
		int currParaNumTmp;


		int currParaVar0;
		int currParaVar1;
		int currParaVar2;
		int currParaVar3;
		int currParaVar4;

		int currParaVar32_0;
		int currParaVar32_1;
		int currParaVar;

		char* tmpHexToTexta;
		char* tmpHexToTextb;

		

		
		currFunc = "";
		currFunc3 = "";
		
		for(int n = 0; n < NUMOFFUNCS; n++){
			r = strcmp(*(tokens+i), funcName[n]);
			
			if(r == 0){

				
				currFunc = funcName[n];
				
				n = NUMOFFUNCS;
				
			}
			else{
			 	
				currFunc3 = malloc(4);	
				*currFunc3 = *(*(tokens+i));	
				*(currFunc3+1) = *(*(tokens+i)+1);	
				*(currFunc3+2) = *(*(tokens+i)+2);	
				*(currFunc3+3) = 0;	
			 	
			 	
			 	r =	strcmp(currFunc3,funcName[n]);
			 	currFunc3 = 0;
			 	free(currFunc3);
				if(r == 0){
					currFunc = funcName[n];
					
					n = NUMOFFUNCS;
				}

			 }

		}
		
		if(strcmp(currFunc,funcName[0]) == 0){
			i++;
			i++;
			currPara = *(tokens+i);	
			
			i++;
			i++;


				
				

				
				sscanf(currPara, "p%d", &currParaVar);

				if(currParaVar < USER_PTR_SIZE){
					currParaVar +=  USER_PTR_BASE;
				}else{
					printf("Error(getc0): Pointer Size Overflow\n");
				}
				
				
				



				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_1BIT_GROUP_SET,line++);
				op_x(OP_SET,SGV_PARA0_B0,PMV_1BIT_G0_UART_RX0_EMPTY,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_MASK_AND,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar,PMV_PARA0_C,line++);


				


				
				

				
				


		}else if(strcmp(currFunc,funcName[1]) == 0){
			i++;
			i++;
		

			currPara = *(tokens+i);	
			

			
			i++;
			i++;

			
			

				if(*currPara != 'p'){
					sscanf(currPara, "%d", &currParaVar);
					
					

					op_x(OP_ASN,SGV_8BIT_GROUP_SET_TX0,currParaVar,line++);




				}else {
					sscanf(currPara, "p%d", &currParaVar);

					if(currParaVar < USER_PTR_SIZE){
						currParaVar +=  USER_PTR_BASE;
					}else{
						printf("Error(putc0): Pointer Size Overflow\n");
					}

					
					

				

		
				


				
				
					

				
				


				
				

				

				op_x(OP_CPY,SGV_8BIT_GROUP_SET_TX0,currParaVar,line++);


				}
				

				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX0,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);
				op_x(OP_SYN,0,0,line++);



		}else if(strcmp(currFunc,funcName[2]) == 0){
			i++;
			i++;
			currPara = *(tokens+i);	
			
			i++;
			i++;


				
				
				
				
				

				

				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_RX0_REC_SET,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);



				


				
				





				
				

				
				sscanf(currPara, "p%d", &currParaVar);

				if(currParaVar < USER_PTR_SIZE){
					currParaVar +=  USER_PTR_BASE;
				}else{
					printf("Error(getc0): Pointer Size Overflow\n");
				}
				
				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar,PMV_8BIT_GROUP_GET_RX0,line++);



				
				
				
				
				
				


				
				
				

				
				





		}else if(strcmp(currFunc,funcName[3]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
	
			
			
			sscanf(currPara0, "p%d", &currParaVar0);	

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 +=  USER_PTR_BASE;
			}else{
				printf("%d:Error(assign0 ) %d %s: Pointer Size Overflow\n",line,currParaVar0, currPara0);
			}

			

			if(*currPara1 != 'p'){
				sscanf(currPara1, "%d", &currParaVar1);
				

				
				op_x(OP_ASN,currParaVar0,currParaVar1,line++);


				

			}else {
				sscanf(currPara1, "p%d", &currParaVar1);
				
				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 +=  USER_PTR_BASE;
				}else{
					printf("Error(assign1): Pointer Size Overflow\n");
				}


				
				op_x(OP_CPY,currParaVar0,currParaVar1,line++);


				
				
				
				

				

				


			}

			
			
				
				
				
				op_x(OP_SYN,0,0,line++);
			
		
			
			i++;
			i++;
			
		}else if(strcmp(currFunc,funcName[4]) == 0){
			
			currPara = *(tokens+i);
			sscanf(currPara, "ifs%d", &currParaVar);


			i++;
			i++;
		
			

			

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			i++;
			currPara2 = *(tokens+i);	
			

			if(*currPara2 != 'p'){
				sscanf(currPara2, "%d", &currParaVar2);
				

				op_x(OP_ASN,SGV_PARA0_B0,currParaVar2,line++);


				

			}else {
				sscanf(currPara2, "p%d", &currParaVar2);

				if(currParaVar2 < USER_PTR_SIZE){
					currParaVar2 += USER_PTR_BASE;
				}else{
					printf("Error(if): Pointer Size Overflow\n");
				}
				
				
				
				
				
				op_x(OP_CPY,SGV_PARA0_B0,currParaVar2,line++);


			}
			
			

			if(*currPara0 != 'p'){
				sscanf(currPara0, "%d", &currParaVar0);
				

				op_x(OP_ASN,SGV_PARA0_A0,currParaVar0,line++);


				

			}else {
				sscanf(currPara0, "p%d", &currParaVar0);
				
				if(currParaVar0 < USER_PTR_SIZE){
					currParaVar0 += USER_PTR_BASE;
				}else{
					printf("Error(ifs1): Pointer Size Overflow\n");
				}

				
				
				
				
				op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);

			}


			

			if(strcmp(currPara1,"<") == 0){
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_SMALLER,line++);
			}else if(strcmp(currPara1,">") == 0){
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_GREATER,line++);
			}else if(strcmp(currPara1,"==") == 0){
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
			}else if(strcmp(currPara1,"!=") == 0){
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0,line++);

			}else{
				printf("if0 error parse\n");
			}
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_REGVAL6,PMV_PARA0_C,line++);




			
			i++;
			currPara = *(tokens+i);


			
	
	

			while(strcmp(currPara, ")") != 0){
				
						
			
				i++;
				
				
				if(strcmp(currPara, "&&") == 0 || strcmp(currPara, "||") == 0){
					
					currPara0 = *(tokens+i);	
					
					i++;
					currPara1 = *(tokens+i);	
					
					i++;
					currPara2 = *(tokens+i);	
					




					if(*currPara2 != 'p'){
						sscanf(currPara2, "%d", &currParaVar2);
						

						

						op_x(OP_ASN,SGV_PARA0_B0,currParaVar2,line++);

					}else {
						sscanf(currPara2, "p%d", &currParaVar2);

						if(currParaVar2 < USER_PTR_SIZE){
							currParaVar2 += USER_PTR_BASE;
						}else{
							printf("Error(if2): Pointer Size Overflow\n");
						}
						

						
						
						
						
						op_x(OP_CPY,SGV_PARA0_B0,currParaVar2,line++);						


					}
					
					

					if(*currPara0 != 'p'){
						sscanf(currPara0, "%d", &currParaVar0);
						

						op_x(OP_ASN,SGV_PARA0_A0,currParaVar0,line++);
						

						

					}else {
						sscanf(currPara0, "p%d", &currParaVar0);
						
						if(currParaVar0 < USER_PTR_SIZE){
							currParaVar0 += USER_PTR_BASE;
						}else{
							printf("Error(if3): Pointer Size Overflow\n");
						}

						
						
						
						
						op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);


					}

					if(strcmp(currPara1,"<") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_SMALLER,line++);
					}else if(strcmp(currPara1,">") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_GREATER,line++);
					}else if(strcmp(currPara1,"==") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
					}else if(strcmp(currPara1,"!=") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
						op_x(OP_ASN,SGV_PARA0_B0,0,line++);


					}else{
						printf("if1 error parse\n");
					}
					op_x(OP_SYN,0,0,line++);
					
					op_x(OP_CPY,SGV_PARA0_B0,PMV_PARA0_C,line++);


					if(strcmp(currPara, "&&") == 0 ){
						
						
						op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL6,line++);
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_AND,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_REGVAL6,PMV_PARA0_C,line++);


					
					}else if(strcmp(currPara, "||") == 0 ){

						
						op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL6,line++);
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_OR,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_REGVAL6,PMV_PARA0_C,line++);

					}else {
						printf("%x ERROR !\n",line++ );

					}
				}
				i++;
				currPara = *(tokens+i);
				

			}
			
			



			
			



			
			
			
			

			
			
			
			op_x(OP_CPY,SGV_CODE_ADDR_COND,PMV_PARA0_C,line++);

			tmpStr = malloc(4);
			sprintf(tmpStr,"if{%d",currParaVar);	
			op_t(OP_ASN,SGV_CODE_ADDR,tmpStr,line++);
			free(tmpStr);

			op_x(OP_SYN,0,0,line++);
			
			op_x(OP_GO,0,0,line++);

			tmpStr = malloc(4);
			sprintf(tmpStr,"if}%d",currParaVar);	
			op_t(OP_ASN,SGV_CODE_ADDR,tmpStr,line++);
			free(tmpStr);


			
			op_x(OP_ASN,SGV_CODE_ADDR_COND,1,line++);
			op_x(OP_SYN,0,0,line++);
			op_x(OP_GO,0,0,line++);



			i++;
		
		}else if(strcmp(currFunc,funcName[5]) == 0){
			
			currPara = *(tokens+i);
			sscanf(currPara, "wh{%d", &currParaVar);
			i++;
			
			
			
			
			
			
			
			
			

			
			
			

			

			tmpStr = malloc(4);
			sprintf(tmpStr,"wh{%d",currParaVar);	
			op_t(OP_DMY,0,tmpStr,line++);

			free(tmpStr);


		}else if(strcmp(currFunc,funcName[6]) == 0){
			currPara = *(tokens+i);
			sscanf(currPara, "wh}%d", &currParaVar);
			
			i++;
			
			
			
			
			
			
			
				
				
				
				
			
			
			

			

			op_x(OP_ASN,SGV_CODE_ADDR_COND,1,line++);

			tmpStr = malloc(4);
			sprintf(tmpStr,"whs%d",currParaVar);	
			op_t(OP_ASN,SGV_CODE_ADDR,tmpStr,line++);
			free(tmpStr);

		
			op_x(OP_SYN,0,0,line++);

			op_x(OP_GO,0,0,line++);
	

			tmpStr = malloc(4);
			sprintf(tmpStr,"wh}%d",currParaVar);	
			op_t(OP_DMY,0,tmpStr,line++);
			free(tmpStr);



			
			
			
			

		
		}else if(strcmp(currFunc,funcName[7]) == 0){
			currPara = *(tokens+i);
			sscanf(currPara, "whs%d", &currParaVar);


			

			i++;
			i++;
		
			

			

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			i++;
			currPara2 = *(tokens+i);	
			
			
			
			
			
			


			tmpStr = malloc(4);
			sprintf(tmpStr,"whs%d",currParaVar);	
			
			op_t(OP_DMY,0,tmpStr,line++);

			free(tmpStr);


			
			

			if(*currPara2 != 'p'){
				sscanf(currPara2, "%d", &currParaVar2);
				

				op_x(OP_ASN,SGV_PARA0_B0,currParaVar2,line++);
				

				

			}else {
				sscanf(currPara2, "p%d", &currParaVar2);

				if(currParaVar2 < USER_PTR_SIZE){
						currParaVar2 += USER_PTR_BASE;
					}else{
						printf("Error(while0): Pointer Size Overflow\n");
					}
				

				
				
				
				
				op_x(OP_CPY,SGV_PARA0_B0,currParaVar2,line++);


			}
			
			

			if(*currPara0 != 'p'){
				sscanf(currPara0, "%d", &currParaVar0);
				

				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				op_x(OP_ASN,SGV_PARA0_A0,currParaVar0,line++);


				

			}else {
				sscanf(currPara0, "p%d", &currParaVar0);
				
				if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 += USER_PTR_BASE;
					}else{
						printf("Error(while1): Pointer Size Overflow\n");
					}

				
				
				
				
				op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);


			}

					if(strcmp(currPara1,"<") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_SMALLER,line++);
					}else if(strcmp(currPara1,">") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_GREATER,line++);
					}else if(strcmp(currPara1,"==") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
					}else if(strcmp(currPara1,"!=") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
						op_x(OP_ASN,SGV_PARA0_B0,0,line++);


					}else{
						printf("if error parse\n");
					}
					
					op_x(OP_SYN,0,0,line++);
					op_x(OP_CPY,SGV_REGVAL6,PMV_PARA0_C,line++);


			
			i++;
			currPara = *(tokens+i);

			while(strcmp(currPara, ")") != 0){
				
				
				i++;
				
				
				if(strcmp(currPara, "&&") == 0 || strcmp(currPara, "||") == 0){

					currPara0 = *(tokens+i);	
					
					i++;
					currPara1 = *(tokens+i);	
					
					i++;
					currPara2 = *(tokens+i);
					

					sscanf(currPara0, "p%d", &currParaVar0);

					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 += USER_PTR_BASE;
					}else{
						printf("Error(while2): Pointer Size Overflow\n");
					}

					
					sscanf(currPara2, "p%d", &currParaVar2);

					if(currParaVar2 < USER_PTR_SIZE){
						currParaVar2 += USER_PTR_BASE;
					}else{
						printf("Error(while3): Pointer Size Overflow\n");
					}

					
					
					

					
					
					

					
					
					
					
					op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);

					
					
					
					op_x(OP_CPY,SGV_PARA0_B0,currParaVar2,line++);



					if(strcmp(currPara1,"<") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_SMALLER,line++);
					}else if(strcmp(currPara1,">") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_GREATER,line++);
					}else if(strcmp(currPara1,"==") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
					}else if(strcmp(currPara1,"!=") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
						op_x(OP_ASN,SGV_PARA0_B0,0,line++);


					}else{
						printf("if error parse\n");
					}
					
					op_x(OP_SYN,0,0,line++);
					op_x(OP_CPY,SGV_PARA0_B0,PMV_PARA0_C,line++);


					if(strcmp(currPara, "&&") == 0 ){
						
						
						op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL6,line++);
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_AND,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_REGVAL6,PMV_PARA0_C,line++);


					
					}else if(strcmp(currPara, "||") == 0 ){

						
						op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL6,line++);
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_OR,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_REGVAL6,PMV_PARA0_C,line++);

					}else {
						printf("%x ERROR !\n",line++ );

					}
				}
				i++;
				currPara = *(tokens+i);
				

			}
			
			
			
			
			



			
			



			
			
			
			

			
			
			
			op_x(OP_SYN,0,0,line++);
			op_x(OP_CPY,SGV_CODE_ADDR_COND,PMV_PARA0_C,line++);


			tmpStr = malloc(4);
			sprintf(tmpStr,"wh{%d",currParaVar);	
			
			op_t(OP_ASN,SGV_CODE_ADDR,tmpStr,line++);

			free(tmpStr);





			op_x(OP_GO,0,0,line++);

			tmpStr = malloc(4);
			sprintf(tmpStr,"wh}%d",currParaVar);	
			
			op_t(OP_ASN,SGV_CODE_ADDR,tmpStr,line++);
			free(tmpStr);



			op_x(OP_ASN,SGV_CODE_ADDR_COND,1,line++);
			op_x(OP_SYN,0,0,line++);
			op_x(OP_GO,0,0,line++);


			i++;
			
		}else if(strcmp(currFunc,funcName[8]) == 0){
			currPara = *(tokens+i);
			sscanf(currPara, "if{%d", &currParaVar);
			i++;
			
			
			


			tmpStr = malloc(4);
			sprintf(tmpStr,"if{%d",currParaVar);	
			
			op_t(OP_DMY,0,tmpStr,line++);
			free(tmpStr);


		}else if(strcmp(currFunc,funcName[9]) == 0){
			currPara = *(tokens+i);
			sscanf(currPara, "ef}%d", &currParaVar);
			
			i++;
				
				
			

			tmpStr = malloc(4);
			sprintf(tmpStr,"ef}%d",currParaVar);	
			
			op_t(OP_DMY,0,tmpStr,line++);
			free(tmpStr);

			b--;

			
		}else if(strcmp(currFunc,funcName[10]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
	
			
			
			sscanf(currPara0, "p%d", &currParaVar0);	

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 += USER_PTR_BASE;
			}else{
				printf("Error(add0): Pointer Size Overflow\n");
			}

				
				
				
				op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);



			if(*currPara1 != 'p'){
				sscanf(currPara1, "%d", &currParaVar1);
				

				
				op_x(OP_ASN,SGV_PARA0_B0,currParaVar1,line++);

				

			}else {
				sscanf(currPara1, "p%d", &currParaVar1);

				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 += USER_PTR_BASE;
				}else{
					printf("Error(add1): Pointer Size Overflow\n");
				}
				
				
				
				
				op_x(OP_CPY,SGV_PARA0_B0,currParaVar1,line++);

			}
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_ADD,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);
				op_x(OP_SYN,0,0,line++);

				
				
				
			i++;
			i++;
		


		}else if(strcmp(currFunc,funcName[11]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
	
			
			
			sscanf(currPara0, "p%d", &currParaVar0);	

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 += USER_PTR_BASE;
			}else{
				printf("Error(sub1): Pointer Size Overflow\n");
			}

				
				
				
				op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);



			if(*currPara1 != 'p'){
				sscanf(currPara1, "%d", &currParaVar1);
				

				
				op_x(OP_ASN,SGV_PARA0_B0,currParaVar1,line++);

				

			}else {
				sscanf(currPara1, "p%d", &currParaVar1);

				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 += USER_PTR_BASE;
				}else{
					printf("Error(sub1): Pointer Size Overflow\n");
				}
				
				
				
				
				op_x(OP_CPY,SGV_PARA0_B0,currParaVar1,line++);

			}
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_SUB,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);
				op_x(OP_SYN,0,0,line++);

				
				
				
			i++;
			i++;
		}else if(strcmp(currFunc,funcName[12]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
	
			
			
			sscanf(currPara0, "p%d", &currParaVar0);	

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 += USER_PTR_BASE;
			}else{
				printf("Error(mul1): Pointer Size Overflow\n");
			}

				
				
				
				op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);



			if(*currPara1 != 'p'){
				sscanf(currPara1, "%d", &currParaVar1);
				

				
				op_x(OP_ASN,SGV_PARA0_B0,currParaVar1,line++);

				

			}else {
				sscanf(currPara1, "p%d", &currParaVar1);

				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 += USER_PTR_BASE;
				}else{
					printf("Error(mul1): Pointer Size Overflow\n");
				}
				
				
				
				
				op_x(OP_CPY,SGV_PARA0_B0,currParaVar1,line++);

			}
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_MUL,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);
				op_x(OP_SYN,0,0,line++);

				
				
				
			i++;
			i++;
		}else if(strcmp(currFunc,funcName[13]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
	
			
			
			sscanf(currPara0, "p%d", &currParaVar0);	

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 += USER_PTR_BASE;
			}else{
				printf("Error(div1): Pointer Size Overflow\n");
			}

				
				
				
				op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);



			if(*currPara1 != 'p'){
				sscanf(currPara1, "%d", &currParaVar1);
				

				
				op_x(OP_ASN,SGV_PARA0_B0,currParaVar1,line++);

				

			}else {
				sscanf(currPara1, "p%d", &currParaVar1);

				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 += USER_PTR_BASE;
				}else{
					printf("Error(div1): Pointer Size Overflow\n");
				}
				
				
				
				
				op_x(OP_CPY,SGV_PARA0_B0,currParaVar1,line++);

			}
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_DIV,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);
				op_x(OP_SYN,0,0,line++);

				
				
				
			i++;
			i++;
		}else if(strcmp(currFunc,funcName[14]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
	
			
			
			sscanf(currPara0, "p%d", &currParaVar0);	

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 += USER_PTR_BASE;
			}else{
				printf("Error(mod0): Pointer Size Overflow\n");
			}

				
				
				
				op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);



			if(*currPara1 != 'p'){
				sscanf(currPara1, "%d", &currParaVar1);
				

				
				op_x(OP_ASN,SGV_PARA0_B0,currParaVar1,line++);

				

			}else {
				sscanf(currPara1, "p%d", &currParaVar1);

				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 += USER_PTR_BASE;
				}else{
					printf("Error(mod1): Pointer Size Overflow\n");
				}
				
				
				
				
				op_x(OP_CPY,SGV_PARA0_B0,currParaVar1,line++);

			}
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_MOD,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);
				op_x(OP_SYN,0,0,line++);

				
				
				
			i++;
			i++;
		

		
		}else if(strcmp(currFunc,funcName[15]) == 0){
			
			currPara = *(tokens+i);
			sscanf(currPara, "eli%d", &currParaVar);


			i++;
			i++;
		
			

			

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			i++;
			currPara2 = *(tokens+i);	
			

			if(*currPara2 != 'p'){
				sscanf(currPara2, "%d", &currParaVar2);
				

				op_x(OP_ASN,SGV_PARA0_B0,currParaVar2,line++);


				

			}else {
				sscanf(currPara2, "p%d", &currParaVar2);

				if(currParaVar2 < USER_PTR_SIZE){
					currParaVar2 += USER_PTR_BASE;
				}else{
					printf("Error(elseif1): Pointer Size Overflow\n");
				}
				
				
				
				
				
				op_x(OP_CPY,SGV_PARA0_B0,currParaVar2,line++);


			}
			
			

			if(*currPara0 != 'p'){
				sscanf(currPara0, "%d", &currParaVar0);
				

				op_x(OP_ASN,SGV_PARA0_A0,currParaVar0,line++);


				

			}else {
				sscanf(currPara0, "p%d", &currParaVar0);
				
				if(currParaVar0 < USER_PTR_SIZE){
					currParaVar0 += USER_PTR_BASE;
				}else{
					printf("Error(elseif1): Pointer Size Overflow\n");
				}

				
				
				
				
				op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);

			}


			

			if(strcmp(currPara1,"<") == 0){
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_SMALLER,line++);
			}else if(strcmp(currPara1,">") == 0){
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_GREATER,line++);
			}else if(strcmp(currPara1,"==") == 0){
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
			}else if(strcmp(currPara1,"!=") == 0){
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0,line++);

			}else{
				printf("elseif error parse\n");
			}
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_REGVAL6,PMV_PARA0_C,line++);




			
			i++;
			currPara = *(tokens+i);

			while(strcmp(currPara, ")") != 0){
				
				
				i++;
				
				
				if(strcmp(currPara, "&&") == 0 || strcmp(currPara, "||") == 0){
					
					currPara0 = *(tokens+i);	
					
					i++;
					currPara1 = *(tokens+i);	
					
					i++;
					currPara2 = *(tokens+i);	
					

					if(*currPara2 != 'p'){
						sscanf(currPara2, "%d", &currParaVar2);
						

						

						op_x(OP_ASN,SGV_PARA0_B0,currParaVar2,line++);

					}else {
						sscanf(currPara2, "p%d", &currParaVar2);

						if(currParaVar2 < USER_PTR_SIZE){
							currParaVar2 += USER_PTR_BASE;
						}else{
							printf("Error(elseif2): Pointer Size Overflow\n");
						}
						

						
						
						
						
						op_x(OP_CPY,SGV_PARA0_B0,currParaVar2,line++);						


					}
					
					

					if(*currPara0 != 'p'){
						sscanf(currPara0, "%d", &currParaVar0);
						

						op_x(OP_ASN,SGV_PARA0_A0,currParaVar0,line++);
						

						

					}else {
						sscanf(currPara0, "p%d", &currParaVar0);
						
						if(currParaVar0 < USER_PTR_SIZE){
							currParaVar0 += USER_PTR_BASE;
						}else{
							printf("Error(elseif3): Pointer Size Overflow\n");
						}

						
						
						
						
						op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);


					}

					if(strcmp(currPara1,"<") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_SMALLER,line++);
					}else if(strcmp(currPara1,">") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_GREATER,line++);
					}else if(strcmp(currPara1,"==") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
					}else if(strcmp(currPara1,"!=") == 0){
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
						op_x(OP_ASN,SGV_PARA0_B0,0,line++);


					}else{
						printf("elseif error parse\n");
					}
					op_x(OP_SYN,0,0,line++);
					
					op_x(OP_CPY,SGV_PARA0_B0,PMV_PARA0_C,line++);


					if(strcmp(currPara, "&&") == 0 ){
						
						
						op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL6,line++);
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_AND,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_REGVAL6,PMV_PARA0_C,line++);


					
					}else if(strcmp(currPara, "||") == 0 ){

						
						op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL6,line++);
						op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_OR,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_CPY,SGV_REGVAL6,PMV_PARA0_C,line++);

					}else {
						printf("%x ERROR elseif!\n",line++ );

					}
				}
				i++;
				currPara = *(tokens+i);
				

			}
			
			



			
			



			
			
			
			

			
			
			
			op_x(OP_SYN,0,0,line++);
			op_x(OP_CPY,SGV_CODE_ADDR_COND,PMV_PARA0_C,line++);


			tmpStr = malloc(4);
			
			sprintf(tmpStr,"ei{%d",currParaVar);	
			op_t(OP_ASN,SGV_CODE_ADDR,tmpStr,line++);
			free(tmpStr);



			op_x(OP_GO,0,0,line++);


			tmpStr = malloc(4);
			
			sprintf(tmpStr,"ei}%d",currParaVar);	
			op_t(OP_ASN,SGV_CODE_ADDR,tmpStr,line++);
			free(tmpStr);



			op_x(OP_ASN,SGV_CODE_ADDR_COND,1,line++);
			op_x(OP_SYN,0,0,line++);
			op_x(OP_GO,0,0,line++);



			i++;
		
		
		}else if(strcmp(currFunc,funcName[16]) == 0){
			
			currPara = *(tokens+i);
			sscanf(currPara, "els%d", &currParaVar);


			tmpStr = malloc(4);
			sprintf(tmpStr,"els%d",currParaVar);	
			op_t(OP_DMY,0,tmpStr,line++);
			free(tmpStr);

			

			i++;
		
		}else if(strcmp(currFunc,funcName[17]) == 0){
 			

			

			i++;
			i++;
			currPara = *(tokens+i);		
			
			i++;
			i++;

			sscanf(currPara, "%d", &currParaVar);
			
			
			 
			 

			if(debug){printf("%x OP_DMY 0x00000000 0x00000000 !\n",line );}
			 
			op_x(OP_DMY,0,0,line++);

			 
			 
			/*
			 
				if(currParaVar <= 0x0000000f){
					if(debug){printf("%x OP_FUNCTION 0x00000000 0x0000000%x !\n",line++, currParaVar );}
					fprintf(fileWrite,"OP_FUNCTION 0x00000000 0x0000000%x !\n", currParaVar);
					
				}else if(currParaVar <= 0x000000ff){
					if(debug){printf("%x OP_FUNCTION 0x00000000 0x000000%x !\n",line++, currParaVar );}
					fprintf(fileWrite,"OP_FUNCTION 0x00000000 0x000000%x !\n", currParaVar);
					
				}else if(currParaVar <= 0x00000fff){
					if(debug){printf("%x OP_FUNCTION 0x00000000 0x00000%x !\n",line++, currParaVar );}
					fprintf(fileWrite,"OP_FUNCTION 0x00000000 0x00000%x !\n", currParaVar);
					
				}else if(currParaVar <= 0x0000ffff){
					if(debug){printf("%x OP_FUNCTION 0x00000000 0x0000%x !\n",line++, currParaVar );}
					fprintf(fileWrite,"OP_FUNCTION 0x00000000 0x0000%x !\n", currParaVar);
				}else if(currParaVar <= 0x000fffff){
					if(debug){printf("%x OP_FUNCTION 0x00000000 0x000%x !\n",line++, currParaVar );}
					fprintf(fileWrite,"OP_FUNCTION 0x00000000 0x000%x !\n", currParaVar);
				}else if(currParaVar <= 0x00ffffff){
					if(debug){printf("%x OP_FUNCTION 0x00000000 0x00%x !\n",line++, currParaVar );}
					fprintf(fileWrite,"OP_FUNCTION 0x00000000 0x00%x !\n", currParaVar);
				}else if(currParaVar <= 0x0fffffff){
					if(debug){printf("%x OP_FUNCTION 0x00000000 0x0%x !\n",line++, currParaVar );}
					fprintf(fileWrite,"OP_FUNCTION 0x00000000 0x0%x !\n", currParaVar);
				}else if(currParaVar <= 0xffffffff){
					if(debug){printf("%x OP_FUNCTION 0x00000000 0x%x !\n",line++, currParaVar );}
					fprintf(fileWrite,"OP_FUNCTION 0x00000000 0x%x !\n", currParaVar);


				}else{
					printf("parse overflowed\n");
				}
			*/
					fprintf(fileWrite,"OP_FUNCTION 0x00000000 %s !\n", hexToText(currParaVar));
					line++;


			

			
		}else if(strcmp(currFunc,funcName[18]) == 0){
			i++;
			i++;
			currPara = *(tokens+i);		
			
			i++;
			i++;

			sscanf(currPara, "%d", &currParaVar);

			


				
				op_x(OP_CPY,SGV_PARA0_A0,FUNC_STACK_BASE,line++);
				op_x(OP_SET,SGV_PARA0_B0,0x1,line++);
				op_x(OP_SET,SGV_PARA0_S, PARA_SELECT_ARITH_SUB,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,FUNC_STACK_BASE,PMV_PARA0_C,line++);

				
				op_x(OP_CPY,SGV_PARA0_A0,FUNC_STACK_BASE,line++);
				op_x(OP_SET,SGV_PARA0_B0,FUNC_STACK_DEPTH,line++);
				op_x(OP_SET,SGV_PARA0_S, PARA_SELECT_ARITH_ADD,line++);

				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_REGVAL3,PMV_PARA0_C,line++);
				

				
				op_x(OP_PTG,SGV_CODE_ADDR,SGV_REGVAL3,line++);
				op_x(OP_ASN,SGV_CODE_ADDR_COND,1,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_GO ,0,0,line++);


		}else if(strcmp(currFunc,funcName[19]) == 0){
			i++;
			i++;
			currPara = *(tokens+i);		
			
			i++;
			i++;

			sscanf(currPara, "%d", &currParaVar);

			
			
			
			
				op_x(OP_CPY,SGV_PARA0_A0,FUNC_STACK_BASE,line++);
				op_x(OP_SET,SGV_PARA0_B0,FUNC_STACK_DEPTH,line++);
				op_x(OP_SET,SGV_PARA0_S, PARA_SELECT_ARITH_ADD,line++);

				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_REGVAL3,PMV_PARA0_C,line++);
				



				
				op_x(OP_CPY,SGV_PARA0_A0,FUNC_STACK_BASE,line++);
				op_x(OP_SET,SGV_PARA0_B0,0x1,line++);
				op_x(OP_SET,SGV_PARA0_S, PARA_SELECT_ARITH_ADD,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,FUNC_STACK_BASE,PMV_PARA0_C,line++);

				tmpStr = malloc(4);
				
				sprintf(tmpStr,"f{%x}",currParaVar);	
				op_t(OP_ASN,SGV_CODE_ADDR,tmpStr,line++);
				free(tmpStr);
				op_x(OP_ASN,SGV_CODE_ADDR_COND,1,line++);

				tmpLine = line + 4;
				op_x(OP_ASN,SGV_REGVAL2,tmpLine,line++);
				op_x(OP_PTS,SGV_REGVAL3,SGV_REGVAL2,line++);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_GO ,0,0,line++);
				
		
		}else if(strcmp(currFunc,funcName[20]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			i++;
			currPara2 = *(tokens+i);	
			
			
			

			
			
			
			
			
			
			

			
			
			
			
			
			
			
			sscanf(currPara0, "p%d", &currParaVar0);

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 +=  USER_PTR_BASE;
			}else{
				printf("Error(drawBlk0): Pointer Size Overflow\n");
			}




			
			sscanf(currPara1, "p%d", &currParaVar1);

			if(currParaVar1 < USER_PTR_SIZE){
				currParaVar1 +=  USER_PTR_BASE;
			}else{
				printf("Error(drawBlk1): Pointer Size Overflow\n");
			}

			sscanf(currPara2, "p%d", &currParaVar2);

			if(currParaVar2 < USER_PTR_SIZE){
				currParaVar2 +=  USER_PTR_BASE;
			}else{
				printf("Error(drawBlk2): Pointer Size Overflow\n");
			}

			
			op_x(OP_CPY,SGV_FMC_BRAM_ADDR,currParaVar0,line++);


			

			op_x(OP_CPY,SGV_FMC_START_POINT,currParaVar1,line++);
			op_x(OP_CPY,SGV_FMC_END_POINT,currParaVar2,line++);

			
			op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_FMC_DO,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);
				op_x(OP_SYN,0,0,line++);



			i++;
			i++;

		
		}else if(strcmp(currFunc,funcName[24]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			i++;
			currPara2 = *(tokens+i);	
			
	
			

			
			
			
			
			

				
			
				



			if(*currPara0 != 'p'){
				sscanf(currPara0, "%x", &currParaVar0);

				op_x(OP_ASN,SGV_FMC_DATA_WRITE,currParaVar0,line++);


			}else {
				sscanf(currPara0, "p%d", &currParaVar0);

				if(currParaVar0 < USER_PTR_SIZE){
					currParaVar0 += USER_PTR_BASE;
				}else{
					printf("Error(drawFill0): Pointer Size Overflow\n");
				}
				
				op_x(OP_CPY,SGV_FMC_DATA_WRITE,currParaVar0,line++);

			}


				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_FMC_WO,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0x0,line++);
				op_x(OP_SYN,0,0,line++);


				


			if(*currPara1 != 'p'){
				sscanf(currPara1, "%x", &currParaVar1);
				
				
				op_x(OP_ASN,SGV_FMC_START_POINT,currParaVar1,line++);


			}else {
				sscanf(currPara1, "p%d", &currParaVar1);

				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 += USER_PTR_BASE;
				}else{
					printf("Error(drawFill1): Pointer Size Overflow\n");
				}
				
				
				op_x(OP_CPY,SGV_FMC_START_POINT,currParaVar1,line++);

			}
			if(*currPara2 != 'p'){
				sscanf(currPara2, "%x", &currParaVar2);

				
				op_x(OP_ASN,SGV_FMC_END_POINT,currParaVar2,line++);


			}else {
				sscanf(currPara2, "p%d", &currParaVar2);

				if(currParaVar2 < USER_PTR_SIZE){
					currParaVar2 += USER_PTR_BASE;
				}else{
					printf("Error(drawFill2): Pointer Size Overflow\n");
				}
				
				
				op_x(OP_CPY,SGV_FMC_END_POINT,currParaVar2,line++);

			}

				op_x(OP_CPY,SGV_REGVAL7,SGV_FMC_BRAM_ADDR,line++);
				op_x(OP_ASN,SGV_FMC_BRAM_ADDR,0x7fff,line++);



				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_FMC_RO,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);



				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_FMC_DO,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);
				op_x(OP_CPY,SGV_FMC_BRAM_ADDR,SGV_REGVAL7,line++);
				op_x(OP_SYN,0,0,line++);




			i++;
			i++;
		

		
		
		}else if(strcmp(currFunc,funcName[21]) == 0){
			i++;
			i++;
			currPara = *(tokens+i);	
			
			i++;
			i++;


				
				

				
				sscanf(currPara, "p%d", &currParaVar);

				if(currParaVar < USER_PTR_SIZE){
					currParaVar +=  USER_PTR_BASE;
				}else{
					printf("Error(chkNoTouch0): Pointer Size Overflow\n");
				}
				
				
				



				
				op_x(OP_ASN,SGV_TWI_REGISTER,0x814e,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_TWI_RO,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);


				
				
				
				


				op_x(OP_SYN,0,0,line++);
				
				op_x(OP_CPY,SGV_PARA0_A0,PMV_TWI_DATA_READ,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x1000000,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_DIV,line++);

				
				
				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar,PMV_PARA0_C,line++);



				


				
				

				
				

			
			
		
		}else if(strcmp(currFunc,funcName[22]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
				

				
				sscanf(currPara0, "p%d", &currParaVar0);

				if(currParaVar0 < USER_PTR_SIZE){
					currParaVar0 +=  USER_PTR_BASE;
				}else{
					printf("Error(getTouch0): Pointer Size %d Overflow\n", currParaVar0);
				}
				
				sscanf(currPara1, "p%d", &currParaVar1);

				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 +=  USER_PTR_BASE;
				}else{
					printf("Error(getTouch1): Pointer Size %d Overflow\n", currParaVar1);
				}


				op_x(OP_ASN,SGV_REGVAL1,0,line++);
				op_x(OP_ASN,SGV_REGVAL2,0,line++);

				

				op_x(OP_ASN,SGV_TWI_REGISTER,0x8150,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_TWI_RO,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);


				op_x(OP_SYN,0,0,line++);
				
				op_x(OP_CPY,SGV_REGVAL1,PMV_TWI_DATA_READ,line++);

				
				op_x(OP_ASN,SGV_TWI_REGISTER,0x814e,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0x18000,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);
				op_x(OP_SYN,0,0,line++);

				
				op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL1,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x1000000,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_DIV,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_REGVAL2,PMV_PARA0_C,line++);

				op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL1,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x10000,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_DIV,line++);
				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x100,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_MOD,line++);
				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x100,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_MUL,line++);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_CPY,SGV_PARA0_B0,SGV_REGVAL2,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_ADD,line++);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);


				
				op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL1,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x100,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_DIV,line++);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x100,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_MOD,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_REGVAL2,PMV_PARA0_C,line++);

				op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL1,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x100,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_MOD,line++);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x100,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_MUL,line++);
				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_CPY,SGV_PARA0_B0,SGV_REGVAL2,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_ADD,line++);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar1,PMV_PARA0_C,line++);




				


				
				

				
				

			i++;
			i++;
		
		
		}else if(strcmp(currFunc,funcName[23]) == 0){
			i++;
			i++;
		

			currPara = *(tokens+i);	
			

			
			i++;
			i++;

			
			

				if(*currPara != 'p'){
					sscanf(currPara, "%x", &currParaVar);
					
					

					op_x(OP_ASN,SGV_REGVAL1,currParaVar,line++);




				}else {
					sscanf(currPara, "p%d", &currParaVar);

					if(currParaVar < USER_PTR_SIZE){
						currParaVar +=  USER_PTR_BASE;
					}else{
						printf("Error(setx0): Pointer Size Overflow\n");
					}

					
					

				

		
				


				
				
					

				
				


				
				

				

				op_x(OP_CPY,SGV_REGVAL1,currParaVar,line++);


				}

				
				
				
				op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL1,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x10,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_MOD,line++);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_REGVAL2,PMV_PARA0_C,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x9,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_GREATER,line++);


				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_CODE_ADDR_COND,PMV_PARA0_C,line++);
				tmpLine = line + 12;
				op_x(OP_CPY,SGV_CODE_ADDR,tmpLine,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_GO,0,0,line++);

				op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL2,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x30,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_ADD,line++);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_8BIT_GROUP_SET_TX0,PMV_PARA0_C,line++);

				
				


				
				op_x(OP_ASN,SGV_CODE_ADDR_COND,1,line++);
				tmpLine = line + 8;
				op_x(OP_ASN,SGV_CODE_ADDR,tmpLine,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_GO,0,0,line++);


				
				op_x(OP_CPY,SGV_PARA0_A0,SGV_REGVAL2,line++);
				op_x(OP_ASN,SGV_PARA0_B0,0x51,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_ARITH_ADD,line++);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_8BIT_GROUP_SET_TX0,PMV_PARA0_C,line++);
				
				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX0,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);
				op_x(OP_SYN,0,0,line++);



		
		}else if(strcmp(currFunc,funcName[25]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			i++;
			currPara2 = *(tokens+i);	
			
			
			

			
			
			
			
			
			
			

			
			
			
			
			
			
			
			sscanf(currPara0, "p%d", &currParaVar0);

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 +=  USER_PTR_BASE;
			}else{
				printf("Error(drb0): Pointer Size Overflow\n");
			}




			
			sscanf(currPara1, "p%d", &currParaVar1);

			if(currParaVar1 < USER_PTR_SIZE){
				currParaVar1 +=  USER_PTR_BASE;
			}else{
				printf("Error(drb1): Pointer Size Overflow\n");
			}

			sscanf(currPara2, "p%d", &currParaVar2);

			if(currParaVar2 < USER_PTR_SIZE){
				currParaVar2 +=  USER_PTR_BASE;
			}else{
				printf("Error(drb2): Pointer Size Overflow\n");
			}

			
			




			

			


			
			
			

			
				
			
			
			

			
			
			
			
			

			
			
			

			
			op_x(OP_CPY,SG_FMC_BRAM_ADDR,currParaVar2,line++);


			op_x(OP_TAG,currParaVar0,currParaVar1,line++);

			
			
			
			




			i++;
			i++;

		}else if(strcmp(currFunc,funcName[26]) == 0){
			i++;
			i++;
		

			currPara = *(tokens+i);	
			

			
			i++;
			i++;

			
			

				if(*currPara != 'p'){
					sscanf(currPara, "%x", &currParaVar);
					
					

					
					op_x(OP_ASN,SGV_GPIO_GROUP_SET,currParaVar,line++);




				}else {
					sscanf(currPara, "p%d", &currParaVar);

					if(currParaVar < USER_PTR_SIZE){
						currParaVar +=  USER_PTR_BASE;
					}else{
						printf("Error(setx0): Pointer Size Overflow\n");
					}

					
					

				

		
				


				
				
					

				
				


				
				

				

				
					op_x(OP_CPY,SGV_GPIO_GROUP_SET,currParaVar,line++);


				}

				op_x(OP_SYN,0,0,line++);

		
		
		}else if(strcmp(currFunc,funcName[27]) == 0){
			i++;
			i++;
			currPara = *(tokens+i);	
			
			i++;
			i++;


				
				

				
				sscanf(currPara, "p%d", &currParaVar);

				if(currParaVar < USER_PTR_SIZE){
					currParaVar +=  USER_PTR_BASE;
				}else{
					printf("Error(getc0): Pointer Size Overflow\n");
				}
				
				
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar,PMV_GPIO_GROUP_GET,line++);



		
		}else if(strcmp(currFunc,funcName[28]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			
			
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0x0,line++);

				if(*currPara0 != 'p'){
					sscanf(currPara0, "%d", &currParaVar0);
					
					op_x(OP_ASN,SGV_DAC_ADDR,currParaVar0,line++);
				}else {
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(anaSet0): Pointer Size Overflow\n");
					}
					op_x(OP_CPY,SGV_DAC_ADDR,currParaVar0,line++);
				}

				if(*currPara1 != 'p'){
					sscanf(currPara1, "%d", &currParaVar1);
					
					op_x(OP_ASN,SGV_DAC_DATA,currParaVar1,line++);
				}else {
					sscanf(currPara1, "p%d", &currParaVar1);
					if(currParaVar1 < USER_PTR_SIZE){
						currParaVar1 +=  USER_PTR_BASE;
					}else{
						printf("Error(anaSet1): Pointer Size Overflow\n");
					}
					op_x(OP_CPY,SGV_DAC_DATA,currParaVar1,line++);
				}

				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_DAC_ON_OFF,line++);
				op_x(OP_SYN,0,0,line++);

		
			
			i++;
			i++;
		
		}else if(strcmp(currFunc,funcName[29]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			
			
				

				
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(anaGet0): Pointer Size Overflow\n");
					}
				
				if(*currPara1 != 'p'){
					sscanf(currPara1, "%d", &currParaVar1);
					
					op_x(OP_ASN,SGV_ADC_ADDR,currParaVar1,line++);
				}else {
					sscanf(currPara1, "p%d", &currParaVar1);
					if(currParaVar1 < USER_PTR_SIZE){
						currParaVar1 +=  USER_PTR_BASE;
					}else{
						printf("Error(anaGet1): Pointer Size Overflow\n");
					}
					op_x(OP_CPY,SGV_ADC_ADDR,currParaVar1,line++);
				}


				op_x(OP_SYN,0,0,line++);
					op_x(OP_CPY,currParaVar0,PMV_ADC_DATA,line++);

				

		
			
			i++;
			i++;
		
		}else if(strcmp(currFunc,funcName[30]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			i++;
			currPara2 = *(tokens+i);	
			
	
			

			
			
			
			
			

				
			
				



			
				sscanf(currPara0, "p%d", &currParaVar0);

				if(currParaVar0 < USER_PTR_SIZE){
					currParaVar0 += USER_PTR_BASE;
				}else{
					printf("Error(arith0): Pointer Size Overflow\n");
				}
				
				op_x(OP_CPY,SGV_PARA0_A0,currParaVar0,line++);


				


			if(*currPara1 != 'p'){
				sscanf(currPara1, "%d", &currParaVar1);
				
				
				op_x(OP_ASN,SGV_PARA0_B0,currParaVar1,line++);


			}else {
				sscanf(currPara1, "p%d", &currParaVar1);

				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 += USER_PTR_BASE;
				}else{
					printf("Error(arith1): Pointer Size Overflow\n");
				}
				
				
				op_x(OP_CPY,SGV_PARA0_B0,currParaVar1,line++);

			}
			if(*currPara2 != 'p'){
				sscanf(currPara2, "%d", &currParaVar2);

				
				op_x(OP_ASN,SGV_PARA0_S,currParaVar2,line++);


			}else {
				sscanf(currPara2, "p%d", &currParaVar2);

				if(currParaVar2 < USER_PTR_SIZE){
					currParaVar2 += USER_PTR_BASE;
				}else{
					printf("Error(arith2): Pointer Size Overflow\n");
				}
				
				
				op_x(OP_CPY,SGV_PARA0_S,currParaVar2,line++);

			}

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);

				




			i++;
			i++;
		

		
		
		
		
		}else if(strcmp(currFunc,funcName[31]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			
			

				
				
					
				
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(pts0): Pointer Size Overflow\n");
					}
				

				
				
					
				
				
					sscanf(currPara1, "p%d", &currParaVar1);
					if(currParaVar1 < USER_PTR_SIZE){
						currParaVar1 +=  USER_PTR_BASE;
					}else{
						printf("Error(pts1): Pointer Size Overflow\n");
					}
				

					op_x(OP_PTS,currParaVar0,currParaVar1,line++);


		
			
			i++;
			i++;
		
		}else if(strcmp(currFunc,funcName[32]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			
			

				
				
					
				
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(ptg0): Pointer Size Overflow\n");
					}
				

				
				
					
				
				
					sscanf(currPara1, "p%d", &currParaVar1);
					if(currParaVar1 < USER_PTR_SIZE){
						currParaVar1 +=  USER_PTR_BASE;
					}else{
						printf("Error(ptg1): Pointer Size Overflow\n");
					}
				

					op_x(OP_PTG,currParaVar0,currParaVar1,line++);


		
			
			i++;
			i++;
		
		}else if(strcmp(currFunc,funcName[33]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			
			

				
				
					
				
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(blk2Mem0): Pointer Size Overflow\n");
					}
				

				
				
					
				
				
					sscanf(currPara1, "p%d", &currParaVar1);
					if(currParaVar1 < USER_PTR_SIZE){
						currParaVar1 +=  USER_PTR_BASE;
					}else{
						printf("Error(blk2Mem1): Pointer Size Overflow\n");
					}
				

					op_x(OP_B2M,currParaVar0,currParaVar1,line++);


		
			
			i++;
			i++;
		
		
		}else if(strcmp(currFunc,funcName[34]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			
			

				
				
					
				
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(mem2Blk0): Pointer Size Overflow\n");
					}
				

				
				
					
				
				
					sscanf(currPara1, "p%d", &currParaVar1);
					if(currParaVar1 < USER_PTR_SIZE){
						currParaVar1 +=  USER_PTR_BASE;
					}else{
						printf("Error(mem2Blk1): Pointer Size Overflow\n");
					}
				

					op_x(OP_M2B,currParaVar0,currParaVar1,line++);


		
			
			i++;
			i++;
		
		
		}else if(strcmp(currFunc,funcName[35]) == 0){
			i++;
			i++;
		

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			i++;
			currPara2 = *(tokens+i);	
			
	
			
			
			sscanf(currPara0, "p%d", &currParaVar0);	

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 +=  USER_PTR_BASE;
			}else{
				printf("Error(assignNum0 ) %d %s: Pointer Size Overflow\n",currParaVar0, currPara0);
			}

			
			sscanf(currPara2, "%d", &currParaVar2);

			if(*currPara1 != 'p'){
				if(currParaVar2 == 0)sscanf(currPara1, "%d", &currParaVar1);
				else if(currParaVar2 == 1)sscanf(currPara1, "%x", &currParaVar1);
				else if(currParaVar2 == 2)sscanf(currPara1, "%o", &currParaVar1);
				op_x(OP_ASN,currParaVar0,currParaVar1,line++);
			}else {
				sscanf(currPara1, "p%d", &currParaVar1);
				if(currParaVar1 < USER_PTR_SIZE){
					currParaVar1 +=  USER_PTR_BASE;
				}else{
					printf("Error(assignNum1): Pointer Size Overflow\n");
				}
				op_x(OP_CPY,currParaVar0,currParaVar1,line++);
			}

				op_x(OP_SYN,0,0,line++);
			

			
			
		
			
			i++;
			i++;
			
		}else if(strcmp(currFunc,funcName[36]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			i++;
			i++;

				
				sscanf(currPara0, "p%d", &currParaVar0);	

				if(currParaVar0 < USER_PTR_SIZE){
					currParaVar0 +=  USER_PTR_BASE;
				}else{
					printf("Error(getc0 ) %d %s: Pointer Size Overflow\n",currParaVar0, currPara0);
				}

				
				sscanf(currPara1, "%d", &currParaVar1);

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_1BIT_GROUP_SET,line++);
				if(currParaVar1 == 0){
					op_x(OP_ASN,SGV_PARA0_B0,PMV_1BIT_G0_UART_RX0_EMPTY,line++);
				}else if(currParaVar1 == 1){
					op_x(OP_ASN,SGV_PARA0_B0,PMV_1BIT_G0_UART_RX1_EMPTY,line++);
				}else if(currParaVar1 == 2){
					op_x(OP_ASN,SGV_PARA0_B0,PMV_1BIT_G0_UART_RX2_EMPTY,line++);
				}else if(currParaVar1 == 3){
					op_x(OP_ASN,SGV_PARA0_B0,PMV_1BIT_G0_UART_RX3_EMPTY,line++);
				}
				
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_MASK_AND,line++);
				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
		

				op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);


				


		}else if(strcmp(currFunc,funcName[37]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			i++;
			i++;

				sscanf(currPara1, "%d", &currParaVar1);

			
			

				if(*currPara0 != 'p'){
					sscanf(currPara0, "%d", &currParaVar0);
					if(currParaVar1 == 0){
						op_x(OP_ASN,SGV_8BIT_GROUP_SET_TX0,currParaVar0,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX0,line++);
					}else if(currParaVar1 == 1){
						op_x(OP_ASN,SGV_8BIT_GROUP_SET_TX1,currParaVar0,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX1,line++);
					}else if(currParaVar1 == 2){
						op_x(OP_ASN,SGV_8BIT_GROUP_SET_TX2,currParaVar0,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX2,line++);
					}else if(currParaVar1 == 3){
						op_x(OP_ASN,SGV_8BIT_GROUP_SET_TX3,currParaVar0,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX3,line++);
					}

				}else {
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(setc): Pointer Size Overflow\n");
					}

					
					

					if(currParaVar1 == 0){
						op_x(OP_CPY,SGV_8BIT_GROUP_SET_TX0,currParaVar0,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX0,line++);
					}else if(currParaVar1 == 1){
						op_x(OP_CPY,SGV_8BIT_GROUP_SET_TX1,currParaVar0,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX1,line++);
					}else if(currParaVar1 == 2){
						op_x(OP_CPY,SGV_8BIT_GROUP_SET_TX2,currParaVar0,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX2,line++);
					}else if(currParaVar1 == 3){
						op_x(OP_CPY,SGV_8BIT_GROUP_SET_TX3,currParaVar0,line++);
						op_x(OP_SYN,0,0,line++);
						op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_TX3,line++);
					}

				}
				

						op_x(OP_SYN,0,0,line++);
						op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);
						op_x(OP_SYN,0,0,line++);



		}else if(strcmp(currFunc,funcName[38]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			i++;
			i++;

				sscanf(currPara1, "%d", &currParaVar1);
						op_x(OP_SYN,0,0,line++);

				if(currParaVar1 == 0){
					op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_RX0_REC_SET,line++);
				}else if(currParaVar1 == 1){
					op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_RX1_REC_SET,line++);
				}else if(currParaVar1 == 2){
					op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_RX2_REC_SET,line++);
				}else if(currParaVar1 == 3){
					op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_G0_UART_RX3_REC_SET,line++);
				}
						op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0,line++);
						op_x(OP_SYN,0,0,line++);

				
				

				
				sscanf(currPara0, "p%d", &currParaVar0);

				if(currParaVar0 < USER_PTR_SIZE){
					currParaVar0 +=  USER_PTR_BASE;
				}else{
					printf("Error(getc): Pointer Size Overflow\n");
				}
				
				
				if(currParaVar1 == 0){
					op_x(OP_CPY,currParaVar0,PMV_8BIT_GROUP_GET_RX0,line++);
				}else if(currParaVar1 == 1){
					op_x(OP_CPY,currParaVar0,PMV_8BIT_GROUP_GET_RX1,line++);
				}else if(currParaVar1 == 2){
					op_x(OP_CPY,currParaVar0,PMV_8BIT_GROUP_GET_RX2,line++);
				}else if(currParaVar1 == 3){
					op_x(OP_CPY,currParaVar0,PMV_8BIT_GROUP_GET_RX3,line++);
				}
						op_x(OP_SYN,0,0,line++);


		}else if(strcmp(currFunc,funcName[39]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			i++;
			i++;

				sscanf(currPara1, "%d", &currParaVar1);

				if(currParaVar1 < 3){
					op_x(OP_ASN,SGV_2BIT_GROUP_SET_SPI_OP,currParaVar1,line++);
				
				}else {
					printf("Error(spiSet): Select Size Overflow\n");
				}

				
				
				
				





				
				if(*currPara0 != 'p'){
					sscanf(currPara0, "%d", &currParaVar0);
						op_x(OP_ASN,SGV_SPI_DATA_SET,currParaVar0,line++);
				}else {
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(spiSet): Pointer Size Overflow\n");
					}
					op_x(OP_CPY,SGV_SPI_DATA_SET,currParaVar0,line++);
				}

						op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_SPI_RUN_ONCE | SGV_1BIT_SPI_SET_GET,line++);
						op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0x0,line++);
						op_x(OP_SYN,0,0,line++);





		}else if(strcmp(currFunc,funcName[40]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			i++;
			i++;

				sscanf(currPara1, "%d", &currParaVar1);

				if(currParaVar1 < 3){
					op_x(OP_ASN,SGV_2BIT_GROUP_SET_SPI_OP,currParaVar1,line++);
				
				}else {
					printf("Error(spiGet): Select Size Overflow\n");
				}

				
				op_x(OP_ASN,SGV_SPI_DATA_SET,0xffffffff,line++);
				
				
				
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0x0,line++);
						op_x(OP_SYN,0,0,line++);


				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_SPI_RUN_ONCE,line++);
						op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0x0,line++);
						op_x(OP_SYN,0,0,line++);


				
				
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(spiGet): Pointer Size Overflow\n");
					}
					op_x(OP_CPY,currParaVar0,PMV_SPI_DATA_GET,line++);
				

				


		}else if(strcmp(currFunc,funcName[41]) == 0){
			i++;
			i++;
			currPara = *(tokens+i);	
			
			i++;
			i++;

				
				sscanf(currPara, "p%d", &currParaVar);

				if(currParaVar < USER_PTR_SIZE){
					currParaVar +=  USER_PTR_BASE;
				}else{
					printf("Error(chkSpi): Pointer Size Overflow\n");
				}
				
				
				



				
				op_x(OP_CPY,SGV_PARA0_A0,PMV_1BIT_GROUP_SET,line++);
				op_x(OP_ASN,SGV_PARA0_B0,PMV_1BIT_G0_SPI_IDLE,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_MASK_AND,line++);
				
						op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
		

						op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);
		
		}else if(strcmp(currFunc,funcName[42]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			

			i++;
			i++;


			
			
			
			

			
			
			

				sscanf(currPara1, "%d", &currParaVar1);

				if(currParaVar1 < 7){
					op_x(OP_ASN,SGV_2BIT_GROUP_SET_TWI_M_CS,currParaVar1,line++);
				
				}else {
					printf("Error(twiSet): Select Size Overflow\n");
				}


				
				if(*currPara0 != 'p'){
					sscanf(currPara0, "%d", &currParaVar0);
						op_x(OP_ASN,SGV_TWI_M_DATA_SET,currParaVar0,line++);
				}else {
					sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(twiSet): Pointer Size Overflow\n");
					}
					op_x(OP_CPY,SGV_TWI_M_DATA_SET,currParaVar0,line++);
				}

						op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_TWI_M_RUN_ONCE | SGV_1BIT_TWI_M_SET_GET,line++);
						op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0x0,line++);
						op_x(OP_SYN,0,0,line++);





		}else if(strcmp(currFunc,funcName[43]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			

			i++;
			i++;

			
			
			
			

			
			
			

				sscanf(currPara1, "%d", &currParaVar1);

				if(currParaVar1 < 7){
					op_x(OP_ASN,SGV_2BIT_GROUP_SET_TWI_M_CS,currParaVar1,line++);
				
				}else {
					printf("Error(spiSet): Select Size Overflow\n");
				}

				
				
				
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0x0,line++);


						op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,SGV_1BIT_TWI_M_RUN_ONCE,line++);
						op_x(OP_SYN,0,0,line++);
				op_x(OP_ASN,SGV_1BIT_GROUP_SET,0x0,line++);
						op_x(OP_SYN,0,0,line++);


				
				sscanf(currPara0, "p%d", &currParaVar0);
					if(currParaVar0 < USER_PTR_SIZE){
						currParaVar0 +=  USER_PTR_BASE;
					}else{
						printf("Error(spiGet): Pointer Size Overflow\n");
					}
					op_x(OP_CPY,currParaVar0,PMV_TWI_M_DATA_GET,line++);
				

				


		}else if(strcmp(currFunc,funcName[44]) == 0){
			i++;
			i++;
			currPara = *(tokens+i);	
			
			i++;
			i++;

				
				sscanf(currPara, "p%d", &currParaVar);

				if(currParaVar < USER_PTR_SIZE){
					currParaVar +=  USER_PTR_BASE;
				}else{
					printf("Error(chkSpi): Pointer Size Overflow\n");
				}
				
				
				



				
				op_x(OP_CPY,SGV_PARA0_A0,PMV_1BIT_GROUP_SET,line++);
				op_x(OP_ASN,SGV_PARA0_B0,PMV_1BIT_G0_TWI_M_IDLE,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_MASK_AND,line++);
						op_x(OP_SYN,0,0,line++);
				
				op_x(OP_CPY,SGV_PARA0_A0,PMV_PARA0_C,line++);
				op_x(OP_ASN,SGV_PARA0_S,PARA_SELECT_LOGIC_EQUAL,line++);
		

						op_x(OP_SYN,0,0,line++);
				op_x(OP_CPY,currParaVar0,PMV_PARA0_C,line++);
		
			
		
		
			
		

		
		
		
		
		
			
		
		
		
		
		
		
		
		
		}else if(strcmp(currFunc,funcName[45]) == 0){


		



			currPara = *(tokens+i);
			sscanf(currPara, "if}%d", &currParaVar);



			
			tmpStr = malloc(4);
			sprintf(tmpStr,"ef}%d",currParaVar);	
			op_t(OP_ASN,SGV_CODE_ADDR,tmpStr,line++);
			free(tmpStr);
			op_x(OP_ASN,SGV_CODE_ADDR_COND,1,line++);
						op_x(OP_SYN,0,0,line++);
			op_x(OP_GO,0,0,line++);




			tmpStr = malloc(4);
			sprintf(tmpStr,"if}%d",currParaVar);	
			
			op_t(OP_DMY,0,tmpStr,line++);
			free(tmpStr);


			
			i++;
			
			
			

			

			
		
		}else if(strcmp(currFunc,funcName[46]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			
			sscanf(currPara0, "p%d", &currParaVar0);

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 +=  USER_PTR_BASE;
			}else{
				printf("Error(blk2Draw0): Pointer Size Overflow\n");
			}




			
			sscanf(currPara1, "p%d", &currParaVar1);

			if(currParaVar1 < USER_PTR_SIZE){
				currParaVar1 +=  USER_PTR_BASE;
			}else{
				printf("Error(blk2Draw1): Pointer Size Overflow\n");
			}

			

			op_x(OP_B2D,currParaVar0,currParaVar1,line++);



			i++;
			i++;

		}else if(strcmp(currFunc,funcName[47]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			currPara1 = *(tokens+i);	
			
			
			sscanf(currPara0, "p%d", &currParaVar0);

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 +=  USER_PTR_BASE;
			}else{
				printf("Error(drawMem0): Pointer Size Overflow\n");
			}




			
			sscanf(currPara1, "p%d", &currParaVar1);

			if(currParaVar1 < USER_PTR_SIZE){
				currParaVar1 +=  USER_PTR_BASE;
			}else{
				printf("Error(drawMem1): Pointer Size Overflow\n");
			}

			

			op_x(OP_DRM,currParaVar0,currParaVar1,line++);



			i++;
			i++;

				}else if(strcmp(currFunc,funcName[48]) == 0){
			i++;
			i++;
	

			currPara0 = *(tokens+i);	
			
			i++;
			
			
			
			currPara1 = *(tokens+i);	
			
			
			

			
			
			
			
			
			
			

			
			
			
			
			
			
			
			sscanf(currPara0, "p%d", &currParaVar0);

			if(currParaVar0 < USER_PTR_SIZE){
				currParaVar0 +=  USER_PTR_BASE;
			}else{
				printf("Error(ldb0): Pointer Size Overflow\n");
			}




			
			sscanf(currPara1, "p%d", &currParaVar1);

			if(currParaVar1 < USER_PTR_SIZE){
				currParaVar1 +=  USER_PTR_BASE;
			}else{
				printf("Error(ldb1): Pointer Size Overflow\n");
			}

			
			op_x(OP_CPY,SGV_FMC_BRAM_ADDR,currParaVar1,line++);
			op_x(OP_SYN,0,0,line++);


			op_x(OP_TAG,currParaVar0,SG_ROM_ADDR_COND,line++);

			




			i++;
			i++;

		
		}else {
				break;
		}
		
		

	}

}

#endif






























void convertFunc2Function(){
	int currPtr = 0;

	int i = 0;
	int r = 0;
	int line = 0;
	int* bktRecur = malloc(MAXBRACKETRECUR);
	int b = 0;

	int qf = 0;

	
	while(*(tokens+i) != NULL){

		if(strcmp(*(tokens+i), "func") == 0 ){
				sprintf(*(tokens+i),"function");	
		}
		i++;
	}
		

}




char* currVarOp;

	

void varName(){
	int currPtr = 0;

	int i = 0;
	int r = 0;
	int line = 0;
	int* bktRecur = malloc(MAXBRACKETRECUR);
	int b = 0;

	int qf = 0;

	
	while(*(tokens+i) != NULL){
		
		
		
		
		int currParaNum;
		int currParaIndex;

		int currParaVar0;
		int currParaVar1;
		int currParaVar2;
		int currParaVar3;
		int currParaVar4;

		int currParaVar32_0;
		int currParaVar32_1;
		int currParaVar;
		

		char* tmpCurrPara = malloc(100);
		
		
		currVarOp = "";
		
		for(int n = 0; n < NUMOFFUNCS; n++){
			r = strcmp(*(tokens+i), funcName[n]);
			if(r == 0){

				
				currVarOp = funcName[n];
				
				n = NUMOFFUNCS;
				
			}

		}
		
		
		
		
		

		
		

		
		if(strcmp(currVarOp,funcName[0]) == 0 ||
		   strcmp(currVarOp,funcName[1]) == 0 ||
		   strcmp(currVarOp,funcName[2]) == 0 ||
		   strcmp(currVarOp,funcName[21]) == 0 ||
		   strcmp(currVarOp,funcName[23]) == 0 ||
		   strcmp(currVarOp,funcName[26]) == 0 ||
		   strcmp(currVarOp,funcName[27]) == 0 || 
		   strcmp(currVarOp,funcName[41]) == 0 || 
		   strcmp(currVarOp,funcName[44]) == 0  


		   
		 
		){
			i++;
			i++;
		

			currPara = *(tokens+i);	
			
			

			
			sprintf(tmpCurrPara,"%s",*(tokens+i) );
			if((*currPara < '0' || *currPara > '9') && *currPara != '?'){
				qf = 0;

				while(*(tokens+qf+1) != NULL){
					if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
						sprintf(*(tokens+qf+1),"?%d",currPtr);	
					}
					qf++;
					
				}
				sprintf(*(tokens+i),"?%d",currPtr++);	
			}
			i++;
			i++;
			
			
		}else if(
		   strcmp(currVarOp,funcName[3]) == 0 || 
		   strcmp(currVarOp,funcName[10]) == 0 || 
		   strcmp(currVarOp,funcName[11]) == 0 || 
		   strcmp(currVarOp,funcName[12]) == 0 || 
		   strcmp(currVarOp,funcName[13]) == 0 || 
		   strcmp(currVarOp,funcName[14]) == 0 || 
		   strcmp(currVarOp,funcName[22]) == 0 || 
		   strcmp(currVarOp,funcName[28]) == 0 || 
		   strcmp(currVarOp,funcName[29]) == 0 || 
		   strcmp(currVarOp,funcName[31]) == 0 || 
		   strcmp(currVarOp,funcName[32]) == 0 ||   
		   strcmp(currVarOp,funcName[33]) == 0 ||   
		   strcmp(currVarOp,funcName[34]) == 0 ||   

		   strcmp(currVarOp,funcName[36]) == 0 ||   
		   strcmp(currVarOp,funcName[37]) == 0 ||   
		   strcmp(currVarOp,funcName[38]) == 0 ||   
		   strcmp(currVarOp,funcName[39]) == 0 ||   
		   strcmp(currVarOp,funcName[40]) == 0 ||   
		   strcmp(currVarOp,funcName[42]) == 0 ||   
		   strcmp(currVarOp,funcName[43]) == 0 ||   
		   strcmp(currVarOp,funcName[46]) == 0   


		   		){
			i++;
			i++;
		

			currPara = *(tokens+i);	
			
			
			
			
			
			
			
			sprintf(tmpCurrPara,"%s",*(tokens+i) );
			if((*currPara < '0' || *currPara > '9') && *currPara != '?'){
				qf = 0;

				while(*(tokens+qf+1) != NULL){
					if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
						sprintf(*(tokens+qf+1),"?%d",currPtr);	
					}
					qf++;
					
				}
				sprintf(*(tokens+i),"?%d",currPtr++);	
			}

			i++;
			currPara = *(tokens+i);	
			
			
			
			sprintf(tmpCurrPara,"%s",*(tokens+i) );
			if((*currPara < '0' || *currPara > '9') && *currPara != '?'){
				qf = 0;

				while(*(tokens+qf+1) != NULL){
					if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
						sprintf(*(tokens+qf+1),"?%d",currPtr);	
					}
					qf++;
					
				}
				sprintf(*(tokens+i),"?%d",currPtr++);	
			}
			i++;
			i++;
			
		}else if(
		   strcmp(currVarOp,funcName[20]) == 0 || 
		   strcmp(currVarOp,funcName[24]) == 0 || 
		   strcmp(currVarOp,funcName[25]) == 0 || 
		   strcmp(currVarOp,funcName[30]) == 0 || 
		   strcmp(currVarOp,funcName[35]) == 0    
		   

		   		){
			i++;
			i++;
		

			currPara = *(tokens+i);	
			
			

			
			
			
			
			
			
			sprintf(tmpCurrPara,"%s",*(tokens+i) );
			if((*currPara < '0' || *currPara > '9') && *currPara != '?'){
				qf = 0;

				while(*(tokens+qf+1) != NULL){
					if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
						sprintf(*(tokens+qf+1),"?%d",currPtr);	
					}
					qf++;
					
				}
				sprintf(*(tokens+i),"?%d",currPtr++);	
			}
			i++;
			currPara = *(tokens+i);	
			sprintf(tmpCurrPara,"%s",*(tokens+i) );
			if((*currPara < '0' || *currPara > '9') && *currPara != '?'){
				qf = 0;

				while(*(tokens+qf+1) != NULL){
					if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
						sprintf(*(tokens+qf+1),"?%d",currPtr);	
					}
					qf++;
					
				}
				sprintf(*(tokens+i),"?%d",currPtr++);	
			}
			i++;
			currPara = *(tokens+i);	
			sprintf(tmpCurrPara,"%s",*(tokens+i) );
			if((*currPara < '0' || *currPara > '9') && *currPara != '?'){
				qf = 0;

				while(*(tokens+qf+1) != NULL){
					if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
						sprintf(*(tokens+qf+1),"?%d",currPtr);	
					}
					qf++;
					
				}
				sprintf(*(tokens+i),"?%d",currPtr++);	
			}
			i++;
			i++;
			
		}else if(strcmp(currVarOp,funcName[4]) == 0 || 
				 strcmp(currVarOp,funcName[7]) == 0 ||   
				 strcmp(currVarOp,funcName[15]) == 0    
		){
			if(strcmp(currVarOp,funcName[4]) == 0){
				*(bktRecur+b++) = 1; 
			}else if(strcmp(currVarOp,funcName[7]) == 0){
				*(bktRecur+b++) = 2; 
			}else if(strcmp(currVarOp,funcName[15]) == 0){
				*(bktRecur+b++) = 1; 
			}

			i++;
			i++;
		
			currPara0 = *(tokens+i);	
			
			
			
			
			sprintf(tmpCurrPara,"%s",*(tokens+i) );
			if((*currPara0 < '0' || *currPara0 > '9') && *currPara0 != '?'){
				qf = 0;

				while(*(tokens+qf+1) != NULL){
					if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
						sprintf(*(tokens+qf+1),"?%d",currPtr);	
					}
					qf++;
					
				}
				sprintf(*(tokens+i),"?%d",currPtr++);	
			}
			i++;
			currPara1 = *(tokens+i);	
			
			i++;
			currPara2 = *(tokens+i);	

			sprintf(tmpCurrPara,"%s",*(tokens+i) );
			if((*currPara2 < '0' || *currPara2 > '9') && *currPara2 != '?'){
				qf = 0;

				while(*(tokens+qf+1) != NULL){
					if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
						sprintf(*(tokens+qf+1),"?%d",currPtr);	
					}
					qf++;
					
				}
				sprintf(*(tokens+i),"?%d",currPtr++);	
			}
			

			
			i++;
			currPara = *(tokens+i);

			while(strcmp(currPara, ")") != 0){
				
				
				i++;
				
				
				if(strcmp(currPara, "&&") == 0 || strcmp(currPara, "||") == 0){

					currPara0 = *(tokens+i);	
					
					
					
					
					
					sprintf(tmpCurrPara,"%s",*(tokens+i) );
					if((*currPara0 < '0' || *currPara0 > '9') && *currPara0 != '?'){
						qf = 0;

						while(*(tokens+qf+1) != NULL){
							if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
								sprintf(*(tokens+qf+1),"?%d",currPtr);	
							}
							qf++;
							
						}
						sprintf(*(tokens+i),"?%d",currPtr++);	
					}
					i++;
					currPara1 = *(tokens+i);	
					
					i++;
					currPara2 = *(tokens+i);
					
					
					
					
					
					sprintf(tmpCurrPara,"%s",*(tokens+i) );
					if((*currPara2 < '0' || *currPara2 > '9') && *currPara2 != '?'){
						qf = 0;

						while(*(tokens+qf+1) != NULL){
							if(strcmp(tmpCurrPara,*(tokens+qf+1)) == 0 ){
								sprintf(*(tokens+qf+1),"?%d",currPtr);	
							}
							qf++;
							
						}
						sprintf(*(tokens+i),"?%d",currPtr++);	
					}

					
					
				}
				i++;
				currPara = *(tokens+i);
				

			}

			i++;
		}else if(strcmp(currVarOp,funcName[5]) == 0 || 
				 strcmp(currVarOp,funcName[8]) == 0 || 
				 strcmp(currVarOp,funcName[9]) == 0 || 
				 strcmp(currVarOp,funcName[16]) == 0 || 
				 strcmp(currVarOp,funcName[45]) == 0  
		){
			

			i++;
			
			
			
			
			
			
			
			
			

		}else if(strcmp(currVarOp,funcName[6]) == 0){
			
			i++;
			
			
			
			
			
			
			
			
			
			
			
			b--;

		}else if(strcmp(currVarOp,funcName[17]) == 0){
			i++;
			i++;
			i++;
			i++;
			i++;

		}else if(strcmp(currVarOp,funcName[18]) == 0){
			i++;
			i++;
			i++;
			i++;
		}else if(strcmp(currVarOp,funcName[19]) == 0){
			i++;
			i++;
			i++;
			i++;



		}else {
			
			
			i++;
			
			
			
		}
	
					free(tmpCurrPara);

	}	
	i = 0;
	while(*(tokens+i) != NULL){
		
		
		if(**(tokens+i) == '?'){
			**(tokens+i) = 'p';
			
		}
		i++;
	}

	if(currPtr >= USER_PTR_SIZE){
		printf("Error: The number of pointers reaches maximum limit.\n");
	}

}

void functionName(){
	int currPtr = 0;

	int i = 0;
	int f = 0; 
	int cf = 0; 
	int ef = 0;
	int r = 0;
	int line = 0;
	int* bktRecur = malloc(MAXBRACKETRECUR);
	int b = 0;

	char* number = malloc(10);
	char* restFuncs = malloc(100);



	
	while(*(tokens+i) != NULL){
		
		
		
		
		int currParaVar0;
		int currParaVar1;
		int currParaVar2;
		int currParaVar3;
		int currParaVar4;

		int currParaVar32_0;
		int currParaVar32_1;
		int currParaVar;
		

		
		currVarOp = "";
		
		
		char func[8] = "function";


		
		
		
		
		
		
		
		
		if(strcmp(*(tokens+i),func) == 0  
		 
		){	 f = 0;
			
			 while(*(tokens+i+f+1) != NULL){
			 	*(tokens+i+f) = *(tokens+i+f+1);
			 	f++;
			 }
			 
			sprintf(restFuncs,"%s",*(tokens+i)); 

			 cf = 0;

			 
			while(*(tokens+cf) != NULL){
			
				
				if(strcmp(restFuncs,*(tokens+cf)) == 0 ){
					 

					sprintf(*(tokens+cf),"callFunc"); 
					sprintf(*(tokens+cf+2),"%s",*(tokens+i+2)); 
					sprintf(number,"%s",*(tokens+i+2)); 

					
					
					
					
					
					

					
					

					
					



					
				}
				cf++;
				
			}

					sprintf(*(tokens+i),"function"); 
			i++;
			
			
			 ef = 0;
			 int flagEnd = 0;
			 
			while(*(tokens+i+ef) != NULL && !flagEnd){
				
				if(strcmp(*(tokens+i+ef),"end") == 0 ){
				

					sprintf(*(tokens+i+ef+2),"%s",number);
					flagEnd = 1;
				}
				ef++;
			}

			 
			
			
			
			
			
			




			
			
			

			
			
			

			
			
			
			
			
			
		}else {
			i++;
			
		}

	}	
	if(currPtr >= USER_PTR_SIZE){
		printf("Error: The number of pointers reaches maximum limit.\n");
	}
	free(number);

	free(restFuncs);
}

void findWhile(){

	int i = 0;
	int n=0;
	int b = 0;
	int num = 0;


	
	while(*(tokens+i) != NULL){
		
		char func[5] = "while";
		
		if(strcmp(*(tokens+i),func) == 0  
		 
		){	
			sprintf(*(tokens+i+n),"whs%d",num);

			 
			while(*(tokens+i+n) != NULL){
				if(strcmp(*(tokens+i+n),"{") == 0 ){
					if(b == 0)	sprintf(*(tokens+i+n),"wh{%d",num);
					b++;
				}else if(strcmp(*(tokens+i+n),"}") == 0 ){
					b--;
					if(b == 0){
						
						sprintf(*(tokens+i+n),"wh}%d",num++);
						break;
					} 



				}


				
				n++;
				
			}
			n=0;
			
		}
		i++;
	}	

}


void findEndIf(){

	int i = 0;
	int n=0;
	int b = 0;
	int num = 0;


	
	while(*(tokens+i) != NULL){
		
		char func[2] = "if";
		
		if(strcmp(*(tokens+i),func) == 0  
		 
		){	
			sprintf(*(tokens+i+n),"ifs%d",num);
			 
			while(*(tokens+i+n) != NULL){
				if(strcmp(*(tokens+i+n),"{") == 0 ){
					if(b == 0)sprintf(*(tokens+i+n),"if{%d",num);
					b++;
				}else if(strcmp(*(tokens+i+n),"}") == 0 ){
					b--;
					if(strcmp(*(tokens+i+n+1),"elseif") != 0 && strcmp(*(tokens+i+n+1),"else") != 0 && b == 0){
						
						sprintf(*(tokens+i+n),"ef}%d",num++);
						break;
					} else{
						if(b == 0)sprintf(*(tokens+i+n),"if}%d",num);


					}



				}else if(strcmp(*(tokens+i+n),"elseif") == 0){
					if(b == 0)sprintf(*(tokens+i+n),"eli%d",num);

				}else if(strcmp(*(tokens+i+n),"else") == 0){
					if(b == 0)sprintf(*(tokens+i+n),"els%d",num);

				}


				
				n++;
				
			}
			n=0;
			
		}
		i++;
	}	

}


void codeGen(char* code){
	int line = 0; 
	

	
	statement(code);
	
	
	
	
	
	tokenize();
	if(debug == 1){
	  for(int i = 0; i < numTokens; i++){
	  	printf("%s !\n", *(tokens+i));	
	  }
	}

	convertFunc2Function();

	varName();
	if(debug == 2){
	  for(int i = 0; i < numTokens; i++){
	  	printf("%d %s !\n",i, *(tokens+i));	
	  }
	}

	
	functionName();
	if(debug == 3){
	  for(int i = 0; i < numTokens; i++){
	  	printf("%d %s !\n",i, *(tokens+i));	
	  }
	}

	findWhile();
	
	
	


	findEndIf();
	
	
	
	
	



	parse();
	
	
	
	
	
	


}



char* filename;
char* fileout;


void main(int argc, char **argv){


	filename = malloc(100);
	fileout = malloc(100);
	strcpy(filename, argv[1]);
	
	fileRead = fopen(  argv[1],"r" );
	
	filename += 2;
	strcat(fileout, "write");
	strcat(fileout, filename);

	fileWrite = fopen( fileout,"w" );

	char c;
	int i = 0;
	
	char *code;
	
	
	while((c = getc(fileRead)) != EOF) {
		
		
		i++;
	}
	fclose(fileRead);
	code = malloc(i+1);
	fileRead = fopen( argv[1],"r" );
	i = 0;
	
	
	

	
	while((c = getc(fileRead)) != EOF) {
		
		*(code+i) = c;
		i++;
	}
	

	
	 
	 
	 

	
	
	codeGen(code);
    
    
	

	
 
	

    


    fclose(fileWrite);

    
    return;





}


char* hexToText(unsigned int currParaVar){
	  
	    char *text = malloc(10);
				if(currParaVar <= 0x0000000f){
						sprintf(text, "0x0000000%x", currParaVar);
					}else if(currParaVar <= 0x000000ff){
						sprintf(text, "0x000000%x", currParaVar);
					}else if(currParaVar <= 0x00000fff){
						sprintf(text, "0x00000%x", currParaVar);
					}else if(currParaVar <= 0x0000ffff){
						sprintf(text, "0x0000%x", currParaVar);
					}else if(currParaVar <= 0x000fffff){
						sprintf(text, "0x000%x", currParaVar);
					}else if(currParaVar <= 0x00ffffff){
						sprintf(text, "0x00%x", currParaVar);	
					}else if(currParaVar <= 0x0fffffff){
						sprintf(text, "0x0%x", currParaVar);	
					}else if(currParaVar <= 0xffffffff){
						sprintf(text, "0x%x", currParaVar);					
					}else{
						printf("putc error parse\n");
					}
		return text;

}

void op_x(unsigned int op, unsigned int a, unsigned int b, unsigned int l){
		char* tmpA = hexToText(a);
		char* tmpB = hexToText(b);


		if(op == OP_ASN){
			if(debug){printf("%x OP_SET %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_SET %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_CPY){
			if(debug){printf("%x OP_CPY %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_CPY %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_GO){
			if(debug){printf("%x OP_JMP %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_JMP %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_TAG){
			if(debug){printf("%x OP_TAG %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_TAG %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_DMY){
			if(debug){printf("%x OP_DMY %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_DMY %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_PTS){
			if(debug){printf("%x OP_PTS %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_PTS %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_PTG){
			if(debug){printf("%x OP_PTG %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_PTG %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_B2M){
			if(debug){printf("%x OP_B2M %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_B2M %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_M2B){
			if(debug){printf("%x OP_M2B %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_M2B %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_SYN){
			if(debug){printf("%x OP_SYN %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_SYN %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_B2D){
			if(debug){printf("%x OP_B2D %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_B2D %s %s !\n",tmpA ,tmpB );
		}else if(op == OP_DRM){
			if(debug){printf("%x OP_DRM %s %s !\n",l, tmpA ,tmpB );}
			fprintf(fileWrite,"OP_DRM %s %s !\n",tmpA ,tmpB );
		}
		free(tmpA);
		free(tmpB);

}
void op_t(unsigned int op, unsigned int a, char* b, unsigned int l){
	char* tmpA = hexToText(a);


		if(op == OP_ASN){
			if(debug){printf("%x OP_SET %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_SET %s %s !\n",tmpA ,b );
		}else if(op == OP_CPY){
			if(debug){printf("%x OP_CPY %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_CPY %s %s !\n",tmpA ,b );
		}else if(op == OP_GO){
			if(debug){printf("%x OP_JMP %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_JMP %s %s !\n",tmpA ,b );
		}else if(op == OP_TAG){
			if(debug){printf("%x OP_TAG %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_TAG %s %s !\n",tmpA ,b );
		}else if(op == OP_DMY){
			if(debug){printf("%x OP_DMY %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_DMY %s %s !\n",tmpA ,b );
		}else if(op == OP_PTS){
			if(debug){printf("%x OP_PTS %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_PTS %s %s !\n",tmpA ,b );
		}else if(op == OP_PTG){
			if(debug){printf("%x OP_PTG %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_PTG %s %s !\n",tmpA ,b );
		}else if(op == OP_B2M){
			if(debug){printf("%x OP_B2M %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_B2M %s %s !\n",tmpA ,b );
		}else if(op == OP_M2B){
			if(debug){printf("%x OP_M2B %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_M2B %s %s !\n",tmpA ,b );
		}else if(op == OP_SYN){
			if(debug){printf("%x OP_SYN %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_SYN %s %s !\n",tmpA ,b );
		}else if(op == OP_B2D){
			if(debug){printf("%x OP_B2D %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_B2D %s %s !\n",tmpA ,b );
		}else if(op == OP_DRM){
			if(debug){printf("%x OP_DRM %s %s !\n",l, tmpA ,b );}
			fprintf(fileWrite,"OP_DRM %s %s !\n",tmpA ,b );
		}
		free(tmpA);

}
