#include<stdio.h>
int main(int argc, char*argv[])
{
	__asm__ __volatile__("cli");
	int i;
	for (i = 0; i < 100000; i++);
	{
		printf("%d\n", i);
	}
	return 0;
}
