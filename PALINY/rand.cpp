#include <stdio.h>
#include <cstdlib>
#include <time.h>

int main(){
	srand(time(NULL));
	int n=50000;
	printf("%d\n", n);
	for(int i=0;i<n;i++) printf("%c", rand()%4+'a');
	return 0;
}
