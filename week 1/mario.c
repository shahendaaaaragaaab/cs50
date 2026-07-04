#include <stdio.h>
#include<cs50.h>
int main(void){
int h= get_int("Height");
for(int g=0;g<h;g++){

    for(int o=0;o<h-g-1;o++){

        printf(" ");}
    for (int i=0;i<=g;i++){
    printf("#");}
    printf("\n");
}
}
