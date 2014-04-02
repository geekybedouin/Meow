/*#This file is part of the Meow project.

#    Meow is a free software: you can redistribute it and/or modify
 #   it under the terms of the GNU General Public License as published by
  #  the Free Software Foundation, version 3 of the License.
#
 #   Meow is distributed in the hope that it will be useful,
  #  but WITHOUT ANY WARRANTY; without even the implied warranty of
   # MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    #GNU General Public License for more details.
#
 #   For more info, see <http://www.gnu.org/licenses/>.*/




#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h>


FILE *ffinal;



struct node {
  char kal[25];
  struct node *next;
};


struct node *head = NULL;
struct node *curr = NULL;


struct node* create_list(char *val)
{

    struct node *ptr = (struct node*)malloc(sizeof(struct node));
    if(NULL == ptr)
    {
        printf("\n Symbol-Table Node creation failed \n");
        return NULL;
    }
    strcpy(ptr->kal,val);

    ptr->next = NULL;

    head = curr = ptr;
    return ptr;
}

struct node* add_to_list(char *val, bool add_to_end)
{
    if(NULL == head)
    {
        return (create_list(val));
    }

    struct node *ptr = (struct node*)malloc(sizeof(struct node));
    if(NULL == ptr)
    {
        printf("\n Symbol-Table Node creation failed \n");
        return NULL;
    }
    strcpy(ptr->kal,val);
    ptr->next = NULL;

    if(add_to_end)
    {
        curr->next = ptr;
        curr = ptr;
    }
    else
    {
        ptr->next = head;
        head = ptr;
    }
    return ptr;
}

struct node *search_in_list(char *val, struct node **prev)
{
    struct node *ptr = head;
    struct node *tmp = NULL;
    bool found = false;



    while(ptr != NULL)
    {
        if(strcmp(ptr->kal, val)==0)
        {
            found = true;
            break;
        }
        else
        {
            tmp = ptr;
            ptr = ptr->next;
        }
    }

    if(true == found)
    {
        if(prev)
            *prev = tmp;
        return ptr;
    }
    else
    {
        return NULL;
    }
}

int delete_from_list(char *val)
{
    struct node *prev = NULL;
    struct node *del = NULL;

    printf("\n Deleting value [%s] from list\n",val);

    del = search_in_list(val,&prev);
    if(del == NULL)
    {
        return -1;
    }
    else
    {
        if(prev != NULL)
            prev->next = del->next;

        if(del == curr)
        {
            curr = prev;
        }
        else if(del == head)
        {
            head = del->next;
        }
    }

    free(del);
    del = NULL;

    return 0;
}



bool read_char(char poi, char **arr,int type)
{
    int count=0;

    if (type == 1)
    {
        while (count >= 0 && count < 62)
        {
         if (poi==arr[0][count])
         {
            return true;
         }
         count++;
        }
    }


    if (type == 0)
    {
        while (count >= 0 && count < 52)
        {
         if (poi==arr[0][count])
         {
            return true;
         }
         count++;
        }
    }

    return false;
}
bool read_digit(char poi, char **arr)
{
    int count=0;

    while (count >= 0 && count < 10)
    {
        if (poi==arr[1][count])
        {
            return true;
        }
        count++;
    }
    return false;
}
int preprocesser(FILE *fp, char * argv)
{
FILE *fout;
fout = fopen(argv, "w");

char ch;
ch=getc(fp);
while(ch!=EOF)
{
if(ch=='/')
{
 ch=getc(fp);
 if(ch=='/') {
 while((ch=getc(fp))!='\n') { getc(fp);//This commment wil be removed
 } } if(ch=='*')/*This also wil be removed*/ {
 while(1) { ch=getc(fp); if(ch=='*') { ch=getc(fp); if(ch='/') { break; } }
 } } } fprintf(fout, "%c",ch); ch=getc(fp); } fclose(fout); fclose(fp); return 0; }

char * symbolmanipulation( char *token, char type)
{

    int count=0;
/*
    if (type == 'k')
    {
    fprintf(ffinal,"%s \t \t ",token);
    fprintf(ffinal,"Keyword \t \t ");
    while(token[count]!=NULL)
    {
        fprintf(ffinal,"%c  ",token[count] );
        count++;
    }
    fprintf(ffinal,"\t \t ");
    fprintf(ffinal,"%d \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"\n");
    }
    if (type == 'w')
    {
    fprintf(ffinal,"%s \t \t ",token);
    fprintf(ffinal,"Identifier \t \t ");
    while(token[count]!=NULL)
    {
        fprintf(ffinal,"%c  ",token[count] );
        count++;
    }
    fprintf(ffinal,"\t \t ");
    fprintf(ffinal,"%d \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"\n");
    }
    if (type == 'a')
    {
    fprintf(ffinal,"%s \t \t ",token);
    fprintf(ffinal,"Argument \t \t ");
    while(token[count]!=NULL)
    {
        fprintf(ffinal,"%c  ",token[count] );
        count++;
    }
    fprintf(ffinal,"\t \t ");
    fprintf(ffinal,"%d \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"\n");
    }
    if (type == 'o')
    {
    fprintf(ffinal,"%s \t \t ",token);
    fprintf(ffinal,"Operation \t \t ");

        fprintf(ffinal,"%c  ",token );


    fprintf(ffinal,"\t \t ");
    fprintf(ffinal,"%d \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"\n");
    }
    if (type == 'c')
    {
    fprintf(ffinal,"%s \t \t ",token);
    fprintf(ffinal,"Constant \t \t ");
    while(token[count]!=NULL)
    {
        fprintf(ffinal,"%c  ",token[count] );
        count++;
    }
    fprintf(ffinal,"\t \t ");
    fprintf(ffinal,"%d \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"\n");
    }
    if (type == 'h')
    {
    fprintf(ffinal,"%s \t \t ",token);
    fprintf(ffinal,"Header \t \t ");
    while(token[count]!=NULL)
    {
        fprintf(ffinal,"%c  ",token[count] );
        count++;
    }
    fprintf(ffinal,"\t \t ");
    fprintf(ffinal,"%d \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"-- \t \t ",count);
    fprintf(ffinal,"\n");
    }*/

    return token;

}
int Expr(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char * arr);
int cond(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char * arr);
int compound(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char * typename_);
char* keyw(char *p, char **main_arr, struct node *sea, struct node *ptr, char *argv);
int i=0,id=0,kw=0,num=0,op=0;
char keys[32][10]={"auto","break","case","char","const","continue","default",
"do","double","else","enum","extern","float","for","goto",
"if","int","long","register","return","short","signed",
"sizeof","static","struct","switch","typedef","union",
"unsigned","void","volatile","while"};

char * lexical (struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token)
{
    char ch;

  while((ch=fgetc(f1))!=EOF) // if
  {
for(j=0;j<=14;j++)
{
if(ch==oper[j])
{
printf("%c is an operator\n",ch);
op++;
str[i]='\0';
char u_1[2];
u_1[0]=ch;
u_1[1]='\0';
token = symbolmanipulation(u_1, 'o');
return token;
}
}
for(j=0;j<=14;j++)
{
if(i==-1)
break;
if(ch==seps[j])
{
if(ch=='#')
{
    char *header = new char[50];
    int fcount=0;
while(ch!='>')
{
header[fcount]=ch;
fcount++;
//printf("%c",ch);
ch=fgetc(f1);
}
header[fcount]='>';
fcount++;
header[fcount]='\0';
//printf("%s is a header file\n",header);
token = symbolmanipulation(header, 'h');
return token;
//printf("%c is a header file\n",ch);
i=-1;
break;
}
if(ch=='"')
{
    char *argume=new char[50];
    int fcount=0;
    argume[fcount]='"';
    fcount++;
do
{

ch=fgetc(f1);
argume[fcount]=ch;
fcount++;
printf("%c",ch);
}while(ch!='"');
fcount++;
argume[fcount]='\0';
token = symbolmanipulation(argume, 'a');
//printf("\b is an argument\n");
i=-1;
return token;
break;
}
if(ch == '(')
   {
       char thingy[2];
       thingy[0]='(';
       thingy[1]='\0';
       token = thingy;
       i=-1;
       return token;
   }
if(ch == ')')
   {
       char thingy[2];
       thingy[0]=')';
       thingy[1]='\0';
       token = thingy;
       i=-1;
       return token;
   }
   if(ch == '[')
   {
       char thingy[2];
       thingy[0]='[';
       thingy[1]='\0';
       token = thingy;
       i=-1;
       return token;
   }
   if(ch == ']')
   {
       char thingy[2];
       thingy[0]=']';
       thingy[1]='\0';
       token = thingy;
       i=-1;
       return token;
   }
   if(ch == '{')
   {
       char thingy[2];
       thingy[0]='{';
       thingy[1]='\0';
       token = thingy;
       i=-1;
       return token;
   }
   if(ch == '}')
   {
       char thingy[2];
       thingy[0]='}';
       thingy[1]='\0';
       token = thingy;
       i=-1;
       return token;
   }
   if(ch == ';')
   {
       char thingy[2];
       thingy[0]=';';
       thingy[1]='\0';
       token = thingy;
       i=-1;
       return token;
   }
str[i]='\0';
token=keyw(str, main_arr, sea, ptr,argv[3]);
return token;

}
}
if(i!=-1)
{
str[i]=ch;
i++;
}
else
i=0;
  }
//printf("Keywords: %d\nIdentifiers: %d\nOperators: %d\nNumbers: %d\n",kw,id,op,num);
//getch();

return NULL;
}
void init(char * str, char * token)
{
    memset(str,0,24);
                       i=0;
                       token =NULL;
}
int econd(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
    if ((token[0]==')')||(token[0]==';'))
    {
        return 0;
    }
    else
    {
        if ((token[0]=='>')||(token[0]=='<')||(token[0]=='=')||(strcmp(token, "eq")==0))
        {
            if (strcmp(token,"eq")==0)
            {
                cond(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
            }
            if (token[0]=='=')
            {
                cond_checking:
                init(str, token);
                token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                strcpy(arr, token);
                if (strcmp(token, "WhiteSpace")==0){init(str , token); goto cond_checking;}
                else
                {
                    if(token[0]=='=')
                    {


                            cond(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);

                    }
                    else
                    {
                        printf("Error:\tAssignment used in an condition statement\n");
                    }
                }

            }
            if (token[0]=='>')
            {
                        cond(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
            }
            if(token[0]=='<')
            {


                        cond(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
            }

        }
        else
        {
            printf("Error:\tcondition error\n");
        }
    }
}
int cond(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
                cond_checking:
                init(str, token);
                token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                strcpy(arr, token);
                if (strcmp(token, "WhiteSpace")==0){init(str , token); goto cond_checking;}
                else
                {

                for(int y=0; y<52; y++)
                {
                   if(arr[0]==main_arr[0][y])
                   {
                    assign_checking:
                    init(str, token);
                    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                    strcpy(arr, token);
                    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto assign_checking;}
                    else
                    {
                          econd(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
                          return 0;
                    }

                   }

                 }
                 for(int y=0; y<10; y++)
                {
                   if(arr[0]==main_arr[1][y])
                   {

                      int leng=strlen(arr);
                      if(leng>1)
                      {
                          for (int ol=0; ol<leng; ol++)
                          {
                              char * rl = new char[2];
                              rl[0]=arr[ol];
                              rl[1]='\0';
                              int z = atoi(rl);

                              if(z < 9)
                              {
                                  if (z==0)
                                 {

                                  int y=arr[ol];
                                  if ((z==0)&&(y==48))
                                  {
                                      continue;
                                  }

                                  printf("Error:\tExpecting a number in a decleration statement\n");
                                  return 0;
                                 }
                              }
                          }
                          assign2_checking:
                          init(str, token);
                          token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                          strcpy(arr, token);
                          if (strcmp(token, "WhiteSpace")==0){init(str , token); goto assign2_checking;}
                          econd(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
                          return 0;
                      }
                      if(leng==1)
                      {
                          num_checking:
                          init(str, token);
                          token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                          strcpy(arr, token);
                          if (strcmp(token, "WhiteSpace")==0){init(str , token); goto num_checking;}
                          else
                          {
                               econd(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
                               return 0;
                           }
                      }

                   }

                 }


                }

                return 1;
}
int ifprime(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
        else_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto else_checking;}
        else
        {
            if(strcmp(token, "else")==0)
            {

                     compound(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,"else");




                }
            }
          return 0;
    }
int F(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
    if ((arr[0]=='0')||(arr[0]=='1')||(arr[0]=='2')||(arr[0]=='3')||(arr[0]=='4')||(arr[0]=='5')||(arr[0]=='6')||(arr[0]=='7')||(arr[0]=='8')||(arr[0]=='9'))
    {
        for(int y=0; y<10; y++)
                {
                   if(arr[0]==main_arr[1][y])
                   {

                      int leng=strlen(arr);
                      if(leng>1)
                      {
                          for (int ol=0; ol<leng; ol++)
                          {
                              char * rl = new char[2];
                              rl[0]=arr[ol];
                              rl[1]='\0';
                              int z = atoi(rl);

                              if(z < 9)
                              {
                                  if (z==0)
                                 {

                                  int y=arr[ol];
                                  if ((z==0)&&(y==48))
                                  {
                                      continue;
                                  }

                                  printf("Error:\tExpecting a number in an assignment statement\n");
                                  return 0;
                                 }
                              }
                          }
                          assign2_checking:
                          init(str, token);
                          token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                          strcpy(arr, token);
                          if (strcmp(token, "WhiteSpace")==0){init(str , token); goto assign2_checking;}

                      }
                      if(leng==1)
                      {
                          num_checking:
                          init(str, token);
                          token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                          strcpy(arr, token);
                          if (strcmp(token, "WhiteSpace")==0){init(str , token); goto num_checking;}
                          else
                          {

                           }
                      }

                   }

                 }
    }
    else if (arr[0]=='(')
    {
        par_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto par_checking;}
        Expr(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
        if (arr[0]==')')
        {
             next_checking:
             init(str, token);
             token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
             strcpy(arr, token);
             if (strcmp(token, "WhiteSpace")==0){init(str , token); goto next_checking;}
        }
        else
        {
            printf("Error\tMissing a ) in an assignment statement\n");
        }
    }
    else
    {
        int fl=0;
        for(int y=0; y<52; y++)
                {
                   if(arr[0]==main_arr[0][y])
                   {
                       fl=1;
                    assign_checking:
                    init(str, token);
                    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                    strcpy(arr, token);
                    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto assign_checking;}
                    else
                    {

                    }

                   }

                 }
        if (fl == 0){
        printf("Error:\tUnexpected Token in an assignment statement\n");
        }
    }
}
int Tp(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
    if (strcmp(arr, "*")==0)
    {
        mul_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto mul_checking;}
        F(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
        Tp(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);

    }
    else if (strcmp(arr, "/")==0)
    {
        div_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto div_checking;}
        F(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
        Tp(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
    }
    else if (strcmp(arr, "%")==0)
    {
        mod_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto mod_checking;}
        F(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
        Tp(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
    }
    else
    {

    }
}
int T(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
    F(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
    Tp(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
}
int Ep(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
    if (strcmp(arr, "+")==0)
    {
        plus_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto plus_checking;}
        T(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
        Ep(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
    }
    else if (strcmp(arr, "-")==0)
    {
        minus_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto minus_checking;}
        T(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
        Ep(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
    }
    else
    {

    }

}

int Expr(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
    T(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
    Ep(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
}
int prefix(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
    if (token[0]==';') return 0;
                    forspar_checking:
                    init(str, token);
                    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                    strcpy(arr, token);
                    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto forspar_checking;}
}
int postfix(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
    if (token[0]==')') return 0;
                    forspar_checking:
                    init(str, token);
                    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                    strcpy(arr, token);
                    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto forspar_checking;}
}
int stmt(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr){

    if (token[0]==';')
    {
        return 0;
    }
    if (strcmp(token,"if")==0)
    {
        ifpar_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto ifpar_checking;}
        else
        {
            if (token[0]=='(')
                {
                    int z=cond(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
                    if (z==1) { printf("Error:\tCondition not valid\n"); }
                    if (arr[0]==')')
                    {
                        compound(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,"if");
                        return 0;
                    }
                    else {printf("Error\tExpecting )\n");}

                }
                else {printf("Error\tExpecting (\n");}
        }
        ifprime(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
    }
    else if (strcmp(token, "else")==0)
    {
        printf("Error:\telse missing if\n");

    }
    else if (strcmp(token, "while")==0)
    {
        whilepar_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto whilepar_checking;}
        else
        {
            if (token[0]=='(')
                {
                    int z=cond(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
                    if (z==1) { printf("Error:\t while condition not valid\n"); }
                    if (arr[0]==')')
                    {
                        compound(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, "while");
                        return 0;
                    }
                    else {printf("Error\tExpecting ) after a while codition\n");}

                }
                else {printf("Error\tExpecting ( before a while condition\n");}
        }
    }
    else if (strcmp(token, "do")==0)
    {
        compound(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, "do-while");
        dowhilepar_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto dowhilepar_checking;}
        else {
            if (strcmp(token, "while")==0)
            {
                dowhilecondpar_checking:
                init(str, token);
                token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                strcpy(arr, token);
                if (strcmp(token, "WhiteSpace")==0){init(str , token); goto dowhilecondpar_checking;}
                if (token[0]=='(')
                {
                    int z=cond(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
                    if (z==1) { printf("Error:\t do-while condition not valid\n"); }
                    if (arr[0]==')')
                    {
                           compound(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, "dowhile");
                        return 0;
                    }
                    else {printf("Error\tExpecting ) after a do-while codition\n");}

                }
                else {printf("Error\tExpecting ( before a do-while condition\n");}
            }
            else {printf("Error:\tExpecting a corresponding while for a do statement\n");}
        }

    }
    else if (strcmp(token, "switch")==0)
    {

    }
    else if (strcmp(token, "for")==0)
    {
        forpar_checking:
        init(str, token);
        token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
        strcpy(arr, token);
        if (strcmp(token, "WhiteSpace")==0){init(str , token); goto forpar_checking;}
        else
        {
            if (token[0]=='(')
                {
                    forspar_checking:
                    init(str, token);
                    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                    strcpy(arr, token);
                    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto forspar_checking;}
                    prefix(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
                    if (token[0]==';')
                    {

                        cond(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
                        if (arr[0]==';')
                        {
                            forpar2_checking:
                            init(str, token);
                            token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                            strcpy(arr, token);
                            if (strcmp(token, "WhiteSpace")==0){init(str , token); goto forpar2_checking;}
                            postfix(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);
                            if (token[0]==')')
                            {
                                compound(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, "for");
                                return 0;
                            }
                            else
                            {
                                 printf("Error:\tExpecting ) in a for condition\n");

                            }
                        }
                        else
                        {
                            printf("Error:\tExpecting ; in a for condition\n");
                        }

                    }
                    else {
                        printf("Error:\tExpecting ; in a for condition\n");
                    }
                }
                else
                {
                    printf("Error:\tExpecting ( in a for condition\n");
                }
        }

    }
    else
    {
        int flag=0;
        for (int y=0;y<32;y++)
        {
            if(strcmp(arr, keys[y])==0)
            {
                int flag , flag_1;
                flag=flag_1=0;
                //flag to let char take arguments
                //flag_1 for errors
                if (strcmp(arr,"char")==0) flag=1;
                decl_checking:
                init(str, token);
                token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                strcpy(arr, token);
                if (strcmp(token, "WhiteSpace")==0){init(str , token); goto decl_checking;}
                else
                {
                      for(int y=0; y<52; y++)
                      {
                           if(arr[0]==main_arr[0][y])
                           {
                              flag_1=1;
                              struct node * sear;
                              sear = search_in_list(token, NULL);
                              if(NULL == sear)
                              {
                                    add_to_list(token, true);

                              }
                              else
                              {
                                  printf("Error:\tDeclaring an already declared variable\n");
                                  goto end;
                              }
                              assign_checking:
                              init(str, token);
                              token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                              strcpy(arr, token);
                              if (strcmp(token, "WhiteSpace")==0){init(str , token); goto assign_checking;}
                              else
                              {
                                 if (arr[0]=='=')
                                 {
                                    decleq_checking:
                                    init(str, token);
                                    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                                    strcpy(arr, token);
                                    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto decleq_checking;}

                                    if ((flag==1))
                                    {
                                         if(arr[0]=='"')
                                         {
                                             decleq2_checking:
                                             init(str, token);
                                             token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                                             strcpy(arr, token);
                                             if (strcmp(token, "WhiteSpace")==0){init(str , token); goto decleq2_checking;}

                                             if(arr[0]==';')
                                             {
                                                  return 0;
                                             }
                                             else
                                             {
                                                 printf("Error:\tExpecting a ; in a decleration statement\n");
                                             }

                                         }
                                         else
                                         {
                                             int err_check=0;
                                             for(int y=0; y<52; y++)
                                             {
                                                 struct node * sear;
                              sear = search_in_list(token, NULL);
                              if(NULL == sear)
                              {
                                  printf("Error:\tToken isn't defined on this scope\n");
                                  return 0;

                              }
                              else
                              {

                              }
                                                     if(arr[0]==main_arr[0][y])
                                                    {
                                                         err_check=1;
                                                         struct node * sear_;
                                                         sear_ = search_in_list(token, NULL);
                                                         if(NULL == sear_)
                                                         {
                                                               printf("Error:\tExpecting an already declared variable in a declerayion\n");
                                                               goto end;

                                                         }
                                                         else
                                                         {

                                                         }
                                                         assign6_checking:
                                                         init(str, token);
                                                         token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                                                         strcpy(arr, token);
                                                         if (strcmp(token, "WhiteSpace")==0){init(str , token); goto assign6_checking;}
                                                         else
                                                         {

                                                         }

                                                     }

                                              }
                                              if (err_check==0){
                                                  printf("Error:\tUnexpected token in a decleration statement\n");
                                                  return 1;
                                              }
                                         }
                                    }
                                    else if (flag==0)
                                    {
                                        condhht_checking:



                for(int y=0; y<52; y++)
                {
                   if(arr[0]==main_arr[0][y])
                   {
                              struct node * sear;
                              sear = search_in_list(token, NULL);
                              if(NULL == sear)
                              {
                                  printf("Error:\tToken isn't defined on this scope\n");
                                  return 0;

                              }
                              else
                              {

                              }

                    assignhht_checking:
                    init(str, token);
                    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                    strcpy(arr, token);
                    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto assignhht_checking;}
                    else
                    {

                    if (arr[0]==';') { return 0; } else
                    {
                        printf("Error:\tExpecting a ; in a decleration statement\n");
                        return 1;
                    }

                    }

                   }

                 }
                 for(int y=0; y<10; y++)
                {
                   if(arr[0]==main_arr[1][y])
                   {

                      int leng=strlen(arr);
                      if(leng>1)
                      {
                          for (int ol=0; ol<leng; ol++)
                          {
                              char * rl = new char[2];
                              rl[0]=arr[ol];
                              rl[1]='\0';
                              int z = atoi(rl);

                              if(z < 9)
                              {  if (z==0)
                                 {

                                  int y=arr[ol];
                                  if ((z==0)&&(y==48))
                                  {
                                      continue;
                                  }

                                  printf("Error:\tExpecting a number in a decleration statement\n");
                                  return 0;
                                 }
                              }
                          }
                          assign2hht_checking:
                          init(str, token);
                          token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                          strcpy(arr, token);
                          if (strcmp(token, "WhiteSpace")==0){init(str , token); goto assign2hht_checking;}
                          if (arr[0]==';') { return 0; } else
                    {
                        printf("Error:\tExpecting a ; in a decleration statement\n");
                        return 1;
                    }
                      }
                      if(leng==1)
                      {
                          numhht_checking:
                          init(str, token);
                          token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                          strcpy(arr, token);
                          if (strcmp(token, "WhiteSpace")==0){init(str , token); goto numhht_checking;}
                          else
                          {


                               if (arr[0]==';') { return 0; } else
                    {
                        printf("Error:\tExpecting a ; in a decleration statement\n");
                        return 1;
                    }
                           }
                      }

                   }

                 }




                return 1;

                                    }
                                    else
                                    {
                                            printf("Error\tUnexpcted token in a decleration statement\n");
                                            return 1;
                                    }
                                 }
                                 else
                                 {
                                      printf("Error:\tExpecting a = ina decleration statement\n");
                                 }
                              }

                            }

                        }end:
                        if (flag_1==0)
                        {
                            printf("Error:\tIdentifier name error in a decleration statement\n");
                        }




                }
                flag=1;
                return 0;
            }
        }
        if(flag==0)
        {
            for(int y=0; y<52; y++)
            {
                if(arr[0]==main_arr[0][y])
                {
                    assign2_checking:
                    init(str, token);
                    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                    strcpy(arr, token);
                    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto assign2_checking;}
                    else
                    {
                        if (token[0] == '=')
                        {
                            expr_checking:
                            init(str, token);
                            token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                            strcpy(arr, token);
                            if (strcmp(token, "WhiteSpace")==0){init(str , token); goto expr_checking;};
                            Expr(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
                            if (arr[0]==';')
                            {

                            }
                            else
                            {
                                printf("Error:\tMissing a ; in an end of an expression\n");
                            }
                        }
                        else{printf("Error:\tInvalid assignment \n");}
                    }

                }
            }
        }
    }


return 1;

}
int stmtsp(){ }
int stmts(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char *arr)
{
    curly2_checking:
    init(str, token);
    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
    strcpy(arr, token);
    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto curly2_checking;}
    else{
    int z = 0;
    rep:
    z = stmt(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);
    if (z == 0)
    {
        curly_checking:
    init(str, token);
    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
    strcpy(arr, token);
    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto curly_checking;}
         stmt(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token,arr);

      if (arr[0]=='}') goto fin;
         curly222_checking:
    init(str, token);
    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
    strcpy(arr, token);
    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto curly222_checking;}
         stmtsp(); goto rep;
    }
    else
    {
        fin:
        return 0;
    }
    return z;
    }
    return 1;
}
int compound(struct node *ptr, struct node *sea, char **main_arr, char *str, char *seps, char* oper, int j, FILE* f1, char *fname, char** argv, char * token, char * typename_)
{
    curly_checking:
    init(str, token);
    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto curly_checking;}
    else{
        if(token[0]=='{')
        {
            char * arr= new char[20];


            int z=stmts(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, arr);


                    if (arr[0]=='}')
                    {

                    }
                    else{printf("Error:\tExpecting } after a/an %s statement\n",typename_);}

        }
        else{printf("Error:\tExpecting { before a/an %s statement \n",typename_);}
    }

}

/*
** MAIN GOES HERE **
*/


int main(int argc, char *argv[])
{

    argv[1]="/home/minus/BakWorkspace/source.cpp";
    argv[2]="/home/minus/BakWorkspace/temp.c";
    argv[3]="/home/minus/BakWorkspace/symbol.txt";

    struct node *ptr = NULL;
    struct node *sea = ptr;
    //printf("%s",argv[1]); for source
    //printf("Hiii  %s",argv[2]); for temp
    ffinal=fopen(argv[3],"w");
    char **main_arr = new char*[2];
    main_arr[0]=new char[62];
    main_arr[1]=new char[10];

    main_arr[0][0]='a';
    main_arr[0][1]='b';
    main_arr[0][2]='c';
    main_arr[0][3]='d';
    main_arr[0][4]='e';
    main_arr[0][5]='f';
    main_arr[0][6]='g';
    main_arr[0][7]='h';
    main_arr[0][8]='i';
    main_arr[0][9]='j';
    main_arr[0][10]='k';
    main_arr[0][11]='l';
    main_arr[0][12]='m';
    main_arr[0][13]='n';
    main_arr[0][14]='o';
    main_arr[0][15]='p';
    main_arr[0][16]='q';
    main_arr[0][17]='r';
    main_arr[0][18]='s';
    main_arr[0][19]='t';
    main_arr[0][20]='u';
    main_arr[0][21]='v';
    main_arr[0][22]='w';
    main_arr[0][23]='x';
    main_arr[0][24]='y';
    main_arr[0][25]='z';
    main_arr[0][26]='A';
    main_arr[0][27]='B';
    main_arr[0][28]='C';
    main_arr[0][29]='D';
    main_arr[0][30]='E';
    main_arr[0][31]='F';
    main_arr[0][32]='G';
    main_arr[0][33]='H';
    main_arr[0][34]='I';
    main_arr[0][35]='J';
    main_arr[0][36]='K';
    main_arr[0][37]='L';
    main_arr[0][38]='M';
    main_arr[0][39]='N';
    main_arr[0][40]='O';
    main_arr[0][41]='P';
    main_arr[0][42]='Q';
    main_arr[0][43]='R';
    main_arr[0][44]='S';
    main_arr[0][45]='T';
    main_arr[0][46]='U';
    main_arr[0][47]='V';
    main_arr[0][48]='W';
    main_arr[0][49]='X';
    main_arr[0][50]='Y';
    main_arr[0][51]='Z';
    main_arr[0][52]='0';
    main_arr[0][53]='1';
    main_arr[0][54]='2';
    main_arr[0][55]='3';
    main_arr[0][56]='4';
    main_arr[0][57]='5';
    main_arr[0][58]='6';
    main_arr[0][59]='7';
    main_arr[0][60]='8';
    main_arr[0][61]='9';
    main_arr[1][0]='0';
    main_arr[1][1]='1';
    main_arr[1][2]='2';
    main_arr[1][3]='3';
    main_arr[1][4]='4';
    main_arr[1][5]='5';
    main_arr[1][6]='6';
    main_arr[1][7]='7';
    main_arr[1][8]='8';
    main_arr[1][9]='9';
  char ch,str[25];
  char seps[17]=" \t\n,;(){}[]#\"<>";
  char oper[]="!%^&*-+=~|.<>/?";
  int j;
  char fname[50];
  FILE *f1;
  char * token = NULL;
  //clrscr();
printf("%s", argv[1]);
f1 = fopen(argv[1],"r");
//f1 = fopen("Input","r");
  if(f1==NULL)
  {
   printf("file not found");
   return(0);
  }

  preprocesser(f1, argv[2]);
  f1 = fopen(argv[2],"r");
    fprintf(ffinal,"Token \t \t Type \t \t S P E L L I N G \t \t Length \t \t Value \t \t Mem Size \n  ");
/* PARSING */
/*
    while (token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token))
    {




        if (strcmp(token, "WhiteSpace")==0){memset(str,0,24); i=0; token=NULL;}

        else {
        printf("%s FINAL \n",token);
        memset(str,0,24);

            i=0;
            token =NULL;
        }

    } */

    header_checking:
    token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
    if (strcmp(token, "WhiteSpace")==0){init(str , token); goto header_checking;}

        else {

           if (token[0]='#')
           {
             type_checking:
             init(str, token);
             token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
             if (strcmp(token, "WhiteSpace")==0){ memset(str,0,24); i=0; token=NULL; goto type_checking;}
             else
             {
               for (int yyt=0; yyt<32;yyt++)
               {
                   if (strcmp(token,keys[yyt])==0)
                   {
                       main_checking:
               init(str, token);
               token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
               if (strcmp(token, "WhiteSpace")==0){ memset(str,0,24); i=0; token=NULL; goto main_checking;}
               else {
                   if (strcmp(token,"main")==0)
                      {
                       mainpar1_checking:
                       init(str , token);
                       token = lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                       if (strcmp(token, "WhiteSpace")==0){ memset(str,0,24); i=0; token=NULL; goto mainpar1_checking;}
                       else{
                           if(token[0]=='('){
                              mainpar2_checking:
                              init(str, token);
                              token=lexical(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token);
                              if (strcmp(token, "WhiteSpace")==0){ memset(str,0,24); i=0; token=NULL; goto mainpar2_checking;}
                              else{
                                  if(token[0] == ')'){

                                       compound(ptr, sea, main_arr, str, seps, oper, j, f1, fname, argv, token, "main func");
                                    break;
                                  }else{return 1;};
                              }
                              }else{ return 1;}


                       }

                       }
                       else return 1;
                    }
                   }

               }

             }
           }
           else return 1;



            memset(str,0,24);
            i=0;
            token =NULL;
        }



    /* END OF PARSING */

return 0;
}
char * keyw(char *p, char **main_arr, struct node *sea, struct node * ptr, char *argv)
{

char * token = NULL;

int k,flag=0;

if (strcmp("",p)==0)
{
    k=32;
    flag=1;
    token = "WhiteSpace";
}

for(k=0;k<=31;k++)
{
if(strcmp(keys[k],p)==0)
{
token = symbolmanipulation(p, 'k');
//printf("%s is a keyword\n",p);
kw++;
flag=1;
return token;
break;
}
}
if(flag==0)
{
if(isdigit(p[0]))
{
  if (read_digit(p[0], main_arr))
    {
        int error_c=0;
        int i=0;
        while (p[i]!=NULL)
        {
            if (read_digit(p[i], main_arr))
            {
                i++;
            }
            else
            {
                error_c=1;
                break;
            }
        }

        if(error_c==1)
        {
            printf("%s is a ERRORED digit or identifier \n",p);
            token = p;
            return token;
        }
        else{
            token = symbolmanipulation(p, 'c');
            printf("%s is a number\n",p);
            num++;
            return token;
        }
    }

}
else
{
//if(p[0]!=13&&p[0]!=10)
if(p[0]!='\0')
{
     if (read_char(p[0], main_arr, 0))
    {
        int error_c=0;
        int i=0;
        while (p[i]!=NULL)
        {
            if (read_char(p[i], main_arr, 1))
            {
                i++;
            }
            else
            {
                error_c=1;
                break;
            }
        }

        if(error_c==1)
        {
            printf("%s is an ERRORED identifier\n",p);
            token=p;
            return token;
        }
        else{
            sea = search_in_list(p, NULL);
            if(NULL == sea)
            {

                token = symbolmanipulation(p, 'w');
                printf("%s is an identifier\n",p);
                id++;
                return token;
           }
            else
            {

                printf("%s is an exisiting identifier\n",p);
                token = p;
                return token;


            }

        }
    }
}
}
}
i=-1;
return token;
}
