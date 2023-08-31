#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define HEADERS_MAX 1000
#define HEADER_LENGTH 100

FILE* f0;
FILE* f1;
FILE* f2;
FILE* f3;
int debug = 0;
char* filename;
char* fileout;

void main(int argc, char **argv){
	filename = malloc(100);
	fileout = malloc(100);
	strcpy(filename, argv[1]);
	f0 = fopen( filename,"r" );		
	f1 = fopen( "header.err","w+" );
	char c;
	int i = 0;
	int dQuotesFlag = 0;
	char *code;
	int headerLen = 0;
	int headerNum = 0;

	char** headerLinks = malloc(HEADERS_MAX); 
	while(i < HEADERS_MAX){
		*headerLinks = malloc(HEADER_LENGTH);
		(*headerLinks) += 1;
		i++;
	}
		(*headerLinks) -= 1;
		i = 0;

	while((c = getc(f0)) != EOF) {		
		if(c == '/'){
			while((c = getc(f0)) != '\n') {
				 if(c == '\n'){
					getc(f0);
					break;
				}
			}
	
		}else if(c == '#'){
			while((c = getc(f0)) != '\n') {
				if(debug){printf("%c",c);}

				if(c == '<'){
					while(headerLen < 1000){
						c = getc(f0);
						if(c == '>'){
							break;
						}

						**headerLinks = c;
						(*headerLinks)++;
						headerLen += 1;
					}
					(*headerLinks )-= headerLen;
					headerLen = 0;
					headerNum += 1;
					fprintf(f1,"%s",*headerLinks);
					fprintf(f1,"\n");

				}else if(c == '\n'){
					getc(f0);
					break;
				}
			}
		} 
		
		i++;
	}

	fclose(f0);
	fclose(f1);
	headerLinks -= headerNum;

	f0 = fopen( filename,"r" );
	f1 = fopen( "merged.err","w+" );
	f2 = fopen( "header.err","r" );
	
	while((c = getc(f0)) != EOF) {
		if(debug){printf("%c",c);}
		fprintf(f1,"%c",c);
	}
	
	fprintf(f1,"while(1==1){}");
	
	

	
	i = 0;
	char* headername = malloc(100);

	while((c = getc(f2)) != EOF){
		fprintf(f1,"\n");		
		while(c  != '\n'){
		 	*(headername+i++) = c;
		 	
			c = getc(f2); 
		}
		i=0;
	 
		f3 = fopen( headername,"r" );
		while((c = getc(f3)) != EOF){
			fprintf(f1,"%c",c);
		}
	}
	


	fclose(f0);
	fclose(f1);
	fclose(f2);
	free(headername);

	int dSlashFlag = 0;

	f0 = fopen( "merged.err","r" );
	f1 = fopen( "comment.err","w" );
	i = 0;


	while((c = getc(f0)) != EOF) {
		
		if(dSlashFlag == 0){
			if(c == '/'){
				if(debug){printf("%c",c);}
				dSlashFlag = 1;			
			}else if(c == '#'){
				while((c = getc(f0)) != EOF) {
					if(debug){printf("%c",c);}
					if(c == '\n'){
						fprintf(f1,"%c",c);
						break;
					}
				}		
			}else {
				if(debug){printf("%c",c);}
				fprintf(f1,"%c",c);
			}
		}else{
			if(c == '/'){
				while((c = getc(f0)) != EOF) {
					if(debug){printf("%c",c);}
					if(c == '\n'){
						fprintf(f1,"%c",c);
						break;
					}
				}
			} else {
				if(debug){printf("%c",c);}
				fprintf(f1,"%c",c);
			}
			dSlashFlag = 0;
		}
		i++;
	}
	i= 0;
	dSlashFlag = 0;
	fclose(f0);
	fclose(f1);

	f1 = fopen( "comment.err","r" );

	while((c = getc(f1)) != EOF) {
		if(debug){printf("%c",c);}
		i++;
	}
	fclose(f1);
	code = malloc(i+1);	

	f0 = fopen( "comment.err","r" );
	f1 = fopen( "funcComma.err","w+" );
	int currFuncPtr = 0;
	i = 0;
	int stateFuncComma = 0;
	while((c = getc(f0)) != EOF) {
		
		if(c == 'f'){
			fprintf(f1,"%c",c);
			c = getc(f0);
			if(c == 'u'){
				fprintf(f1,"%c",c);
				c = getc(f0);
				if(c == 'n'){
					fprintf(f1,"%c",c);
					c = getc(f0);
					if(c == 'c'){
						fprintf(f1,"%c",c);
						c = getc(f0);
						if(c == ' '){
							fprintf(f1,"%c",',');
							c = getc(f0);
							while(c != '(' && c != EOF){
								fprintf(f1,"%c",c);
								c = getc(f0);
																
							}
							fprintf(f1,"(%d",currFuncPtr++);
							c = getc(f0);
							if(c == ')' && c != EOF){
								fprintf(f1,"%c",c);
								
								c = getc(f0);

							}
						}

					}
				}
			
			}
		} 
					fprintf(f1,"%c",c);
		i++;
	}
	
	i= 0;
	fclose(f0);
	fclose(f1);

	f0 = fopen( "funcComma.err","r" );
	f1 = fopen( "raw.err","w" );
	i = 0;
	
	int flagQuoteSpace = 0;
	while((c = getc(f0)) != EOF) {
		if(c >= 32 && c <= 126){ 
			if(c == 34 && flagQuoteSpace == 0){
				flagQuoteSpace = 1;
			} else if(c == 34 && flagQuoteSpace == 1){
				flagQuoteSpace = 0;

			}
			if(c == 32 && flagQuoteSpace == 1){
				if(debug){printf("%c",c);}
				fprintf(f1,"%c",c);
			}else 
			if(c != 32){
				if(debug){printf("%c",c);}
				fprintf(f1,"%c",c);
			}
		}
		i++;
	}
	
	i= 0;
	fclose(f0);
	fclose(f1);



	f1 = fopen( "raw.err","r" );
	f2 = fopen( "line.err","w" );
	while((c = getc(f1)) != EOF) {
		if(dQuotesFlag == 0){
			if(debug){printf("%c",c);}
			fprintf(f2,"%c",c);
			if(c == '"'){
				
				dQuotesFlag = 1;



			}else if(c == ';' || c == '{' || c == '}'){ 
				if(debug){printf("\n");}
				fprintf(f2,"\n");
			}
			
		}else{
			if(c == '"'){
				dQuotesFlag = 0;
			}
			if(debug){printf("%c",c);}
			fprintf(f2,"%c",c);
		}
		i++;
	}
	i= 0;
	dQuotesFlag = 0;
	fclose(f1);
	fclose(f2);

	
	f1 = fopen( "line.err","r" );
	f2 = fopen( "lineA.err","w" );
	while((c = getc(f1)) != EOF) {
		
		if(dQuotesFlag == 0){
			if(c == '"'){
				if(debug){printf("%c",c);}
				fprintf(f2,"%c",c);
				dQuotesFlag = 1;
			}else if(c == '('|| c == ')'){
				if(debug){printf(" %c ",c);}
				fprintf(f2," %c ",c);

			}else if(c == ','){
				if(debug){printf(" ");}
				fprintf(f2," ");
			}else if(c == ';'){
				if(debug){printf(";");}
				fprintf(f2,";");
			}else if(c == '{' || c == '}'){
				if(debug){printf("%c ;",c);}
				fprintf(f2,"%c ;",c);
			}else {
				if(debug){printf("%c",c);}
				fprintf(f2,"%c",c);
			}
		}else{
			if(c == '"'){
				dQuotesFlag = 0;
			}
			if(debug){printf("%c",c);}
			fprintf(f2,"%c",c);
		}
		i++;
	}
	i= 0;
	dQuotesFlag = 0;

	fclose(f1);
	fclose(f2);


	f1 = fopen( "lineA.err","r" );
	f2 = fopen( "lineB.err","w" );
	while((c = getc(f1)) != EOF) {
		
		if(dQuotesFlag == 0){
			if(c == '"'){
				if(debug){printf("%c",c);}
				fprintf(f2,"%c",c);
				dQuotesFlag = 1;
			}else if(c == '|' || c == '&'){
				if(debug){printf(" %c",c);}
				fprintf(f2," %c",c);
				if((c = getc(f1)) != EOF){
					if(debug){printf("%c ",c);}
					fprintf(f2,"%c ",c);
				}else {
					printf("errCode error\n");
				}

			}else if( c == '<' || c == '>' || c == '!' || c == '='){ 
				if(debug){printf(" %c",c);}
				fprintf(f2," %c",c);
				if((c = getc(f1)) == '='){
					if(debug){printf("%c ",c);}
					fprintf(f2,"%c ",c);
				}else {
					if(debug){printf(" %c",c);}
					fprintf(f2," %c",c);
				}

			}else {
				if(debug){printf("%c",c);}
				fprintf(f2,"%c",c);
			}
		}else{
			if(c == '"'){
				dQuotesFlag = 0;
			}
			if(debug){printf("%c",c);}
			fprintf(f2,"%c",c);
		}
		i++;
	}
	i= 0;
	dQuotesFlag = 0;
	fclose(f1);
	fclose(f2);


	f1 = fopen( "lineB.err","r" );
	f2 = fopen( "lineC.err","w" );
	while((c = getc(f1)) != EOF) {
			
			if(c == 'e'){
				if(debug){printf("%c",c);}
				fprintf(f2,"%c",c);
				c = getc(f1);
				if(debug){printf("%c",c);}
				fprintf(f2,"%c",c);
				if(c == 'l'){
					c = getc(f1);
					if(debug){printf("%c",c);}
					fprintf(f2,"%c",c);
					if(c == 's'){
						c = getc(f1);
						if(debug){printf("%c",c);}
						fprintf(f2,"%c",c);
						if(c == 'e'){
							c = getc(f1);							
							if(c == '{'){
								if(debug){printf("%c",c);}
								fprintf(f2," ");
								fprintf(f2,"%c",c);
						
							}else{
								fprintf(f2,"%c",c);

							}
						
						}
					}
				}
			}else {

				if(debug){printf("%code",c);}
				fprintf(f2,"%c",c);
			}
	}
	fclose(f1);
	fclose(f2);

	



	filename += 4;
	strcat(fileout, "ex");
	strcat(fileout, filename);



	
	f1 = fopen( "lineC.err","r" );
	f2 = fopen( fileout,"w+" );
	
	while((c = getc(f1)) != EOF) {
		
		if(c == '{'){
			if(debug){printf(";\n%c",c);}
			fprintf(f2,";\n%c",c);
			
			
			
			
			
			

		

		}else {
			if(debug){printf("%c",c);}
			fprintf(f2,"%c",c);
		}
		
		i++;
	}
	i= 0;

	
	fclose(f1);
	fclose(f2);

	if(f3 != NULL){
		fclose(f3);
	}
	
	



}
