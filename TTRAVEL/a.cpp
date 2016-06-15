#include <stdio.h>
#include <list>

int main(){
	using namespace std;
	int n;
	scanf("%d\n",  &n);
	char *c = new char[n+1];
	int *a = new int[n+1];
	int *b = new int[n+1];
	list<int> *past = new list<int>[n+1];
	for(int i=1; i<=n; i++){
		scanf("%c", &c[i]);
		if(c[i] != 's') scanf("%d", &a[i]);
		scanf("\n");
	}
	b[0] = 0;
	for(int i=1; i<=n; i++){
		b[i] = 0;
		if(c[i] == 't') b[a[i]-1] = 1;
	}

	list<int> current;
	for(int i=1; i<=n; i++){
		if(c[i]=='s'){
			current.pop_back();
		}else if(c[i] == 'a'){
			current.push_back(a[i]);
		}else{
			current = past[a[i]-1];
		}
		if (b[i]) past[i] = current;

		if(current.empty()) printf("-1\n");
		else printf("%d\n", current.back());
	}

	delete[] c;
	delete[] a;
	delete[] b;
	delete[] past;
	return 0;
}
