#include <stdlib.h>
#include <stdio.h>

int CheckInput(int time, int sum)
{
	if ((time >= 0) && (time <=365) && (sum >= 10000)) {
		return 1;
	}
	return 0;
}

int main() {
	int time, sum, percent;
	printf("Input days:");
	scanf("%d", &time);
	printf("Input money:");
	scanf("%d", &sum);
	
	if (CheckInput(time,sum) == 0) {
		printf("Incorrect input \n");
		return 0;
	}
	return 0;
}
