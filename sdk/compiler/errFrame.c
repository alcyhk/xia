#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define USER_APP_BASE 0x700000 
#define COMPILE_APP 0 
#define MAX_FUNCTION 65536

void verbose(char* code){
	int line;
	while(*code != 0){
		printf("%d %s", line++, code);

	}
}

int debug = 0;

char* hexToText(unsigned int currParaVar);

char** statements;
char** tokens;

int stmtNumLines = 0;
int stmtNumChars = 0;

int tokNumLines = 0;
int tokNumChars = 0;

int numTokens = 0;

	FILE *fileWrite;
 	FILE *fileRead;

#define MAXTOKENS 1048575


#define NUMOFFUNCS 11

char funcName[][40] =
{ 
	"print",
	"printp",
	"getc",
	"assign",
	"if",
	"{",
	"}",
	"while",
	"{",
	"}",
	"time"

};































































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
	test = malloc(1024);



 
	
	
	
	



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





void bracket(){
	int n;
	int m;
	int ifBkOpen = 0;
	int wBkOpen = 0;
	int currPos = 0;

	char* currFunc3;
	currFunc3 = malloc(4);	
	
 	char* currFunc100;
	currFunc100 = malloc(100);	

	char* currFunc100End;
	currFunc100End = malloc(100);	
	


	

	
	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	
		
		if(strcmp(currFunc3,"if{") == 0 && strcmp(*(tokens+i-2),"OP_DMY") != 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			
			while(strcmp(currFunc100,*(tokens+i)) != 0){
				
				i=i+3;
				n++;
			}
			
			
			
			
			
			m = currPos+n;

			
				sprintf(*(tokens+i-n*3), "%s", hexToText(m));

		}
		
	}

	
	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	
		
		if(strcmp(currFunc3,"ei{") == 0 && strcmp(*(tokens+i-2),"OP_DMY") != 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			*currFunc100 = 'i';
			*(currFunc100+1) = 'f';
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			while(strcmp(currFunc100,*(tokens+i)) != 0){
				
				i=i+3;
				n++;
			}
			
			m = currPos+n;

			
				sprintf(*(tokens+i-n*3), "%s", hexToText(m));

		}
				i=i-n*3;

	}

	
	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	

		
		if(strcmp(currFunc3,"if}") == 0 && strcmp(*(tokens+i-2),"OP_DMY") != 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			sprintf(currFunc100End,"%s",currFunc100);

			
			
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			
			while(strcmp(currFunc100,*(tokens+i)) != 0){
				
				i=i+3;
				n++;
				if(*(tokens+i) == NULL){
					break;
				}
			}
			if(*(tokens+i) == NULL){

			 	if(debug){printf("bracket ef exists");}

			}else{
			
			m = currPos+n;

			
				sprintf(*(tokens+i-n*3), "%s", hexToText(m));
			}
		}
		i=i-n*3;

	}


	
	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	

		
		if(strcmp(currFunc3,"if}") == 0 && strcmp(*(tokens+i-2),"OP_DMY") != 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			sprintf(currFunc100End,"%s",currFunc100);

			*currFunc100End = 'e';
			*(currFunc100End+1) = 'f';
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			
			while(strcmp(currFunc100End,*(tokens+i)) != 0){
				
				i=i+3;
				n++;
				if(*(tokens+i) == NULL){
					break;
				}
			}
			if(*(tokens+i) == NULL){

			 	printf("error bracket ef");

			}else{
			
			m = currPos+n;

			
				sprintf(*(tokens+i-n*3), "%s", hexToText(m));
			}
		}
		i=i-n*3;

	}

	


	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	

		
		if(strcmp(currFunc3,"ei}") == 0 && strcmp(*(tokens+i-2),"OP_DMY") != 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			

			*currFunc100 = 'i';
			*(currFunc100+1) = 'f';
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			
			while(strcmp(currFunc100,*(tokens+i)) != 0){
				
				i=i+3;
				n++;
				if(*(tokens+i) == NULL){
					break;
				}
			}
			if(*(tokens+i) == NULL){

			 	if(debug){printf("bracket ef exists");}

			}else{
			
			m = currPos+n;

			
				sprintf(*(tokens+i-n*3), "%s", hexToText(m));
			}
		}
		i=i-n*3;

	}


	
	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	

		
		if(strcmp(currFunc3,"ei}") == 0 && strcmp(*(tokens+i-2),"OP_DMY") != 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			sprintf(currFunc100End,"%s",currFunc100);

			*currFunc100End = 'e';
			*(currFunc100End+1) = 'f';
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			
			while(strcmp(currFunc100End,*(tokens+i)) != 0){
				
				i=i+3;
				n++;
				if(*(tokens+i) == NULL){
					break;
				}
			}
			if(*(tokens+i) == NULL){

			 	printf("error bracket ef");

			}else{
			
			m = currPos+n;

			
				sprintf(*(tokens+i-n*3), "%s", hexToText(m));
			}
		}
		i=i-n*3;

	}
	

	
	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	
		
		if(strcmp(currFunc3,"wh{") == 0 && strcmp(*(tokens+i-2),"OP_DMY") != 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			while(strcmp(currFunc100,*(tokens+i)) != 0){
				
				i=i+3;
				n++;
			}
			
			m = currPos+n;

			
				sprintf(*(tokens+i-n*3), "%s", hexToText(m));

		}
				i=i-n*3;

	}

	
	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	
		
		if(strcmp(currFunc3,"wh}") == 0 && strcmp(*(tokens+i-2),"OP_DMY") != 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			while(strcmp(currFunc100,*(tokens+i)) != 0){
				
				i=i+3;
				n++;
			}
			
			m = currPos+n;

			
				sprintf(*(tokens+i-n*3), "%s", hexToText(m));

		}
				i=i-n*3;

	}



	
	
	
	
	
	
	

	
	
	
	

	
	

	
	
	
	
	
	
	
	
	
	
			
	

	
	

	
	

	

	
	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	

		
		if(strcmp(currFunc3,"ef}") == 0 && strcmp(*(tokens+i-2),"OP_DMY") != 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			sprintf(currFunc100End,"%s",currFunc100);

			*currFunc100 = 'e';
			*(currFunc100+1) = 'f';

			
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			while(strcmp(currFunc100,*(tokens+i)) != 0 ){
				
				i=i+3;
				n++;
			}
			
			m = currPos+n;

			
				sprintf(*(tokens+i-n*3), "%s", hexToText(m));

		}
		i=i-n*3;

	}


	




	

	
	
	
	char* tmpF = malloc(4);
	int tmpI ;
	int tmpT = 0;
	int j = 0;
	
	


	
	while(*(tokens+j) != NULL){
		
		if(strcmp(*(tokens+j),"OP_FUNCTION") == 0){
			tmpT++;
		}
		j++;

	}
	
	
	
	
	for(int p = 0; p < tmpT; p++){
		
		for(int i = 0; i < numTokens; i++){
			n = 0;
			m = i;
			
			sprintf(tmpF,"f{%x}",p);
			
			
			if(strcmp(*(tokens+i),tmpF) == 0){ 
				
				i=0;
				n++;
				while(strcmp(*(tokens+i),"OP_FUNCTION") != 0 || hexStrToNum(*(tokens+i+2)) != p){
					
					i=i+3;
					n++;

				}
				
				
				
				
				
				
				
				
				
				
				tmpI = i /3;
				if(COMPILE_APP){tmpI += USER_APP_BASE;}

				
				i = 0;
				while(*(tokens+i) != NULL){
					if(strcmp(*(tokens+i),tmpF) == 0){
						sprintf(*(tokens+i), "%s", hexToText(tmpI));

					}

					i++;
					
				}


				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				

				
				
				
			}
			i = m;
		}
	}



	

	free(currFunc3);
	free(currFunc100);
	
}


void whileLoopClosed(){
	int m,n;
	int wBkOpen = 0;
	int currPos = 0;

	char* currFunc3;
	currFunc3 = malloc(4);	

	char* currFunc100;
	currFunc100 = malloc(100);	

	
	for(int i = 0; i < numTokens; i++){
		n = 0;
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	

		if(strcmp(currFunc3,"whs") == 0 && strcmp(*(tokens+i-2),"OP_DMY") == 0){ 
			sprintf(currFunc100,"%s",*(tokens+i));
			currPos = (i-2)/3; 
			
			i=i+3;n++;
			while(strcmp(currFunc100,*(tokens+i)) != 0){
				
				i=i+3;
				n++;
			}

			
			m = currPos;
			
			if(m <= 0x0000000f){
				sprintf(*(tokens+i), "0x0000000%x", m);
			}else if(m <= 0x000000ff){
				sprintf(*(tokens+i), "0x000000%x", m);
			}else if(m <= 0x00000fff){
				sprintf(*(tokens+i), "0x00000%x", m);
			}else if(m <= 0x0000ffff){
				sprintf(*(tokens+i), "0x0000%x", m);
			}else if(m <= 0x000fffff){
				sprintf(*(tokens+i), "0x000%x", m);
			}else if(m <= 0x00ffffff){
				sprintf(*(tokens+i), "0x00%x", m);
			}else if(m <= 0x0fffffff){
				sprintf(*(tokens+i), "0x0%x", m);
			}else if(m <= 0xffffffff){
				sprintf(*(tokens+i), "0x%x", m);

			}else{
				printf("bracket error\n");
			}
		}
		i=i-n*3;
	}

	
	
	
	
	
	

	

	free(currFunc3);
	free(currFunc100);
}

void clearDummy(){

	char* currFunc3;
	currFunc3 = malloc(4);	



	for(int i = 0; i < numTokens; i++){
		*currFunc3 = *(*(tokens+i));	
		*(currFunc3+1) = *(*(tokens+i)+1);	
		*(currFunc3+2) = *(*(tokens+i)+2);	
		*(currFunc3+3) = 0;	

		if( strcmp(currFunc3,"ifs{") == 0 || 
			strcmp(currFunc3,"if{") == 0 ||
			strcmp(currFunc3,"if}") == 0 ||
			strcmp(currFunc3,"ei{") == 0 ||
			strcmp(currFunc3,"ei}") == 0 ||
			strcmp(currFunc3,"els") == 0 ||
			strcmp(currFunc3,"ef}") == 0 ||
			strcmp(currFunc3,"whs") == 0 ||
			strcmp(currFunc3,"wh{") == 0 ||
			strcmp(currFunc3,"wh}") == 0){ 
			
			sprintf(*(tokens+i), "0x00000000");
		}

	}
}


void codeGen(char* code){
	int line = 0; 
	statement(code);
	
	
	
	
	

	tokenize();
	 
	 
	 
	
	
	bracket();
	
	
	
	

	whileLoopClosed();
	 
	 
	 
	clearDummy();	

	
	
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

	 
	 
	 

	
	filename += 5;
	strcat(fileout, "frame");
	strcat(fileout, filename);
	fileWrite = fopen( fileout,"w" );


	codeGen(code);
    

    
    for(int i = 0; i < numTokens; i=i+3){
	  	
    	fprintf(fileWrite, "%s %s %s !\n", *(tokens+i), *(tokens+i+1),*(tokens+i+2));
    	

	 }


    fclose(fileRead);

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
