#include <stdio.h>
#include <stdlib.h>
#include "deposit.h"

int main()
{
	int depDay, sum;
	printf("Введите срок вклада: ");
	scanf("%d", &depDay);
	printf("Введите сумму вклада: ");
	scanf("%d", &sum);

	if (CheckInput(depDay, sum) == 0)
	{
		printf("Некоректный ввод\n");
		return 1;
	}

	printf("%d", CalcSumDeposit(depDay, sum));

	return 0;
}
