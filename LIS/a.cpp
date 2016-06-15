#include <stdio.h>

int main(){
	int a[30000], f[30000];
	int n;
	scanf("%d\n", &n);
	for (int i=0; i<n; i++){
		scanf("%d", &a[i]);
		f[i]=-1;
	}
	int kq=0;
	for(int k=0; k<n; k++){
		int l=0;
		int r=kq-1;
		while(l<=r){
			int i = (l+r)/2;
			if(a[f[i]]<a[k]) l=i+1;
			else r=i-1;
		}
		r++;
		if (f[r]==-1 || a[f[r]]>a[k]) f[r]=k;
		if (kq<r+1)kq = r+1;
	}
	printf("%d\n", kq);
	return 0;
}
