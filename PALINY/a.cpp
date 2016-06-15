#include <stdio.h>
#include <vector>
#include <utility>
#include <list>

int main(){
	using namespace std;
	int n;
	scanf("%d\n", &n);
	typedef pair<char, int> PP;
	vector<PP> a;
	for(int i=0; i<n; i++){
			char c;
			scanf("%c", &c);
			if(a.empty() || c!=a.back().first){
					a.push_back(PP(c, 1));
			}else a.back().second++;
	}
	list<int> Q;
	int *f = new int[a.size()];
	int *g = new int[a.size()];

	for(int i=0; i<a.size(); i++){
		f[i] = 1;
		g[i] = a[i].second;
		if (i>0) Q.push_back(i-1);

		if(Q.empty()) continue;
		for(auto j=Q.begin(); (!Q.empty()) && j!=Q.end(); ){
			if(*j-f[*j]<0) j=Q.erase(j);
			else if (a[i].first == a[*j-f[*j]].first) {
				g[*j]+=2*min(a[i].second, a[*j-f[*j]].second);
				f[*j]++;
				if(a[i].second != a[*j-f[*j]+1].second) j=Q.erase(j);
				else j++;
			}else j=Q.erase(j);
		}
	}
	int kq = 1;
	for(int i=0; i<a.size(); i++){
		kq = max(kq, g[i]);
	}
	printf("%d\n", kq);

	delete[] f;
	delete[] g;
	return 0;
}
