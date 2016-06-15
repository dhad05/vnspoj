import sys;
n = int(sys.stdin.readline());
a = sys.stdin.readline().split();
a = [int(x) for x in a];
f = [-1]*n;
kq = 0;
for k in range(n) :
    l = 0;
    r = kq-1;
    while l<=r:
        i = (l+r)//2;
        if a[f[i]]<a[k] : l=i+1
        else: r=i-1;
    i=r+1;
    if f[i]==-1 or a[f[i]]>a[k] : f[i] = k;
    kq = max(kq, i+1);
print(kq);
