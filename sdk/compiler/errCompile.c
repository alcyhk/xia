#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "defineGisc.h"

#define IMAGE_NAME "darklain"

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


char* currFunc;
char* currPara;
char* currPara0;
char* currPara1;
char* currPara2;



int codeMax;
void statement(char* code){
	
	
	char* codeCursor = code;
	int line = 0;
	statements = malloc(codeMax); 
	*statements = malloc(100); 
	*(statements) = malloc(100); 

	 while(*codeCursor != 0){

	 	if(*codeCursor != '\r' && *codeCursor != '\n'){

	 		if(*codeCursor == '!'){
				

	 			
	 			(*statements) = (*statements) - stmtNumChars;
	 			stmtNumChars = 0;
	 			statements++;
	 			*(statements) = malloc(100); 

	 			
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
	



 
	
	
	
	



	for(int i = 0; i < stmtNumLines; i++){

	 	
	 	tmp = *(statements+i);
	 	
	 	
	 	
	 	*(tokens+numTokens) = malloc(8*100); 

	 	while(*(tmp+n) != 0){
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

unsigned int* hex;

unsigned int hexStrToNum(char* str){
	char* c;
	
	
	
	
	int* h;
	int num;
	
	
	
	

	
	

	c = malloc(8);
	h = malloc(48);

	c[0] = *(str+2);
	c[1] = *(str+3);
	c[2] = *(str+4);
	c[3] = *(str+5);
	c[4] = *(str+6);
	c[5] = *(str+7);
	c[6] = *(str+8);
	c[7] = *(str+9);
	
	
	

	for(int i = 0; i < 8; i++){
		if(c[i] == '0' || 
		   c[i] == '1' || 
		   c[i] == '2' || 
		   c[i] == '3' || 
		   c[i] == '4' || 
		   c[i] == '5' || 
		   c[i] == '6' || 
		   c[i] == '7' || 
		   c[i] == '8' || 
		   c[i] == '9'  
		   	){
			
			h[i] = c[i] - 0x30;
			

		}else if(c[i] == 'a' || 
		   c[i] == 'b' || 
		   c[i] == 'c' || 
		   c[i] == 'd' || 
		   c[i] == 'e' || 
		   c[i] == 'f'){
			h[i] = c[i] - 0x61 +0x0a;
			
	   	
		}else {
			
		}
	}
	num = 
		h[0] * 16*16*16*16*16*16*16 +	
		h[1] * 16*16*16*16*16*16 +	
		h[2] * 16*16*16*16*16 +	
		h[3] * 16*16*16*16 +	
		h[4] * 16*16*16 +
		h[5] * 16*16 +
		h[6] * 16 +
		h[7] ;
		
		
	return num;

	

}

void compile(){
	hex = malloc((numTokens+2)*8); 
	for(int i = 0; i < numTokens; i=i+3){
		
		
		
			
			
			
		if(strcmp(*(tokens+i),"OP_TAG")==0){
			*(hex+i) = OP_TAG;
		}else if(strcmp(*(tokens+i),"OP_SET")==0){
			*(hex+i) = OP_SET;
		}else if(strcmp(*(tokens+i),"OP_CPY")==0){
			*(hex+i) = OP_CPY;
		}else if(strcmp(*(tokens+i),"OP_JMP")==0){
			*(hex+i) = OP_JMP;
		}else if(strcmp(*(tokens+i),"OP_DMY")==0){
			*(hex+i) = OP_DMY;
		}else if(strcmp(*(tokens+i),"OP_PTS")==0){
			*(hex+i) = OP_PTS;
		}else if(strcmp(*(tokens+i),"OP_PTG")==0){
			*(hex+i) = OP_PTG;
		}else if(strcmp(*(tokens+i),"OP_B2M")==0){
			*(hex+i) = OP_B2M;
		}else if(strcmp(*(tokens+i),"OP_M2B")==0){
			*(hex+i) = OP_M2B;
		}else if(strcmp(*(tokens+i),"OP_SYN")==0){
			*(hex+i) = OP_SYN;
		}else if(strcmp(*(tokens+i),"OP_B2D")==0){
			*(hex+i) = OP_B2D;
		}else if(strcmp(*(tokens+i),"OP_DRM")==0){
			*(hex+i) = OP_DRM;
		}else if(strcmp(*(tokens+i),"OP_FUNCTION")==0){
			*(hex+i) = OP_DMY;
		}else{
			
			*(hex+i) = 0;

			

		}			
		

	



		
		
		
		*(hex+i+1) = hexStrToNum(*(tokens+i+1));
		

		
		*(hex+i+2) = hexStrToNum(*(tokens+i+2));

		

	}

	
	
	
	*(hex+numTokens) = 0;
	*(hex+numTokens+1) = 0;


	

}


void codeGen(char* code){
	int line = 0; 
	statement(code);
	if(debug){
		for(int i = 0; i < stmtNumLines; i++){
		 	
		 	printf("%d %s\n", line+i,*(statements+i));
		}
	}
	tokenize();
	if(debug){
		for(int i = 0; i < numTokens; i++){
			
		 	printf("%d %s\n", line+i,*(tokens+i));
		}
	}
	
	 
	
	
	
	
	
	compile();
	if(debug){
		for(int i = 0; i < numTokens; i++){
			
		 	printf("%d %x\n", line+i,*(hex+i));
		}
	}

	
	
}


char* filename;
char* fileout;

void main(int argc, char **argv){
	filename = malloc(100);
	fileout = malloc(100);
	strcpy(filename, argv[1]);
	
	fileRead = fopen( filename,"r" );
	char c;
	int i = 0;
	
	char *code;
	
	
	
	

	
	while((c = getc(fileRead)) != EOF) {
		i++;
	}
	code = malloc(i+1);
	codeMax = i +1;
	i= 0;
	fclose(fileRead);
	fileRead = fopen( filename,"r" );
	while((c = getc(fileRead)) != EOF) {
		
		*(code+i) = c;
		i++;
	}

	 
	 
	 

	
	codeGen(code);
    


	if(numTokens/2 > 0xfee000){
	
		printf("Error: Code exceeds Max limit.");
	}


    fclose(fileRead);

 
	
	

    
    
	
   
	  
   
   

	  




	FILE * fOpCode;

	
	strcat(fileout, IMAGE_NAME);
	


   	
   	fOpCode = fopen (fileout, "w+");
  

	
	size_t n = numTokens+2;
	
	
	
	
	unsigned char* opcode;
	opcode = malloc(8);
	

	
	
	
	
	
	
	
	
	

	int tmp;
	
	for(i = 0; i < n/3;i++){
		
		
		
		
		

		
			
			*(opcode) = 0;
			*(opcode+1) = 0;
			*(opcode+2) = 0;
			*(opcode+3) = *(hex+i*3);
   			
		
		
		
		fwrite(opcode , 1 , 4 , fOpCode );


		
		*(opcode) = 0;
		*(opcode+1) = 0;
		*(opcode+2) = 0;
		*(opcode+3) = 0;
		fwrite(opcode , 1 , 4 , fOpCode );

		
			
		if(debug){printf("p%xp\n",*(hex+i*3+1));}
		if(*(hex+i*3+1) < 0x100){
			
			*opcode = 0;
			*(opcode+1) = 0;
			*(opcode+2) = 0;
			*(opcode+3) = *(hex+i*3+1);
		}else if(*(hex+i*3+1) < 0x10000){
			*opcode = 0;
			*(opcode+1) = 0;
			if(*(hex+i*3+1) >> 8< 0x100){
				
				 *(opcode+2) = *(hex+i*3+1) >> 8;
			}
			
			if(debug){printf("o%xo\n",*(opcode+2));}


			*(hex+i*3+1) = *(hex+i*3+1) % 256;
			if(*(hex+i*3+1) < 0x100){
				
				*(opcode+3) = *(hex+i*3+1);
			}
			if(debug){printf("o%xo\n",*(opcode+3));}

		
		}else if(*(hex+i*3+1) < 0x1000000){
			*opcode = 0;
			if(*(hex+i*3+1) >> 16< 0x10000){
				
				 *(opcode+1) = *(hex+i*3+1) >> 16;
			}
			
			if(debug){printf("o%xo\n",*(opcode+1));}


			*(opcode+2) = *(hex+i*3+1) << 16 >> 24;
			
			
				
				
			
			if(debug){printf("o%xo\n",*(opcode+2));}
			*(opcode+3) = *(hex+i*3+1) << 24 >> 24;
			
			
			
			
			
			if(debug){printf("o%xo\n",*(opcode+3));}
		
		}else {
			*(opcode+0) = *(hex+i*3+1) >> 24;
			
				
			*(opcode+1) = *(hex+i*3+1) << 8  >> 24; 
			
			
			if(debug){printf("o%xo\n",*(opcode+1));}


			*(opcode+2) = *(hex+i*3+1) << 16 >> 24;
			
			
				
				
			
			if(debug){printf("o%xo\n",*(opcode+2));}
			*(opcode+3) = *(hex+i*3+1) << 24 >> 24;
			
			
			
			
			
			if(debug){printf("o%xo\n",*(opcode+3));}
		
		}

		if(debug){printf("%x?%d\n",*opcode,*(opcode+1));}
		
		
			
		fwrite(opcode , 1 , 4 , fOpCode );


		
		if(debug){printf("p%xp\n",*(hex+i*3+2));}
		if(*(hex+i*3+2) < 0x100){
			
			*opcode = 0;
			*(opcode+1) = 0;
			*(opcode+2) = 0;
			*(opcode+3) = *(hex+i*3+2);
		}else if(*(hex+i*3+2) < 0x10000){
			*opcode = 0;
			*(opcode+1) = 0;
			if(*(hex+i*3+2) >> 8< 0x100){
				
				 *(opcode+2) = *(hex+i*3+2) >> 8;
			}
			
			if(debug){printf("o%xo\n",*(opcode+2));}


			*(hex+i*3+2) = *(hex+i*3+2) % 256;
			if(*(hex+i*3+2) < 0x100){
				
				*(opcode+3) = *(hex+i*3+2);
			}
			if(debug){printf("o%xo\n",*(opcode+3));}

		
		}else if(*(hex+i*3+2) < 0x1000000){
			*opcode = 0;
			if(*(hex+i*3+2) >> 16< 0x10000){
				
				 *(opcode+1) = *(hex+i*3+2) >> 16;
			}
			
			if(debug){printf("o%xo\n",*(opcode+1));}


			*(opcode+2) = *(hex+i*3+2) << 16 >> 24;
			
			
				
				
			
			if(debug){printf("o%xo\n",*(opcode+2));}
			*(opcode+3) = *(hex+i*3+2) << 24 >> 24;
			
			
			
			
			
			if(debug){printf("o%xo\n",*(opcode+3));}
		
		}else {
			*(opcode+0) = *(hex+i*3+2) >> 24;
			
				
			*(opcode+1) = *(hex+i*3+2) << 8  >> 24; 
			
			
			if(debug){printf("o%xo\n",*(opcode+1));}


			*(opcode+2) = *(hex+i*3+2) << 16 >> 24;
			
			
				
				
			
			if(debug){printf("o%xo\n",*(opcode+2));}
			*(opcode+3) = *(hex+i*3+2) << 24 >> 24;
			
			
			
			
			
			if(debug){printf("o%xo\n",*(opcode+3));}
		
		}



		if(debug){printf("%x?%d\n",*opcode,*(opcode+1));}
		
		
			
		fwrite(opcode , 1 , 4 , fOpCode );




		

	}


	
	
	
	
	
	


	

	free(opcode);
	
	

	fclose(fOpCode);
	
}
