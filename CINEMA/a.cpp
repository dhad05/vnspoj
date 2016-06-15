#include <stdio.h>
int b[1000][1000];
int a[1000000];
int main(){
	int m,n,k;
	scanf ("%d %d", &m, &n);
	scanf ("%d", &k);
	for (int i=0;i<k;i++) scanf ("%d",&(a[i]));
	int x = 1;
	int curr = a[0];
	int i,j;
	auto p = [&](){
		b[i][j]=x;
		curr--;
		if (curr == 0) curr=a[x++];
		if (x==k+1) x=0;
	};
	for (i=0;i<m;i++){
		if (i%2 == 0) for (j=0;j<n;j++) p();
		else for (j=n-1;j>=0;j--) p();
	}
	for (int i=0;i<m;i++) {
		for (int j=0;j<n;j++) printf("%d ",b[i][j]);
		printf("\n");
	}
	return 0;
}
