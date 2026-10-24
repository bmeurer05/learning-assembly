#include <stdio.h>

int main() {
	int x = 3;
	int y = 9;

	if(x > y) {
		printf("The greater value is: %d\n", x);
	} else if(y > x) {
		printf("The greater value is: %d\n", y);
	} else {
		printf("The values are equal\n");
	}

	return 0;
}
