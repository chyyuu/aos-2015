#include<stdio.h>
int main(int argc, char* argv[])
{
    __asm__ __volatile__("cli");
    int i=0,j=1,k=2,l=3,m=4,n=5;
    printf("ping i: %d\n", i);
    printf("ping j: %d\n", j);
    printf("ping k: %d\n", k);
    printf("ping l: %d\n", l);
    printf("ping m: %d\n", m);
    printf("ping n: %d\n", n);
    return 0;
}
