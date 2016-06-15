import sys;

(n, s) = [int(x) for x in sys.stdin.readline().split()]
a = [0]+[int(x) for x in sys.stdin.readline().split()]
kq = 0
m = max(a)
if s>1000: 
    kq+=(s-10000)//m
    s-=m*kq

f = [[0]*(s+1)]*(n+1)
inf = 0xffffffff

for i in range(0, s+1): f[0][i] = inf
for i in range(0, n+1): f[i][0] = 1

for i in range(1, n+1) :
    for j in range(1, s+1) :
        f[i][j] = f[i-1][j]
        if j-a[i]>=0 : f[i][j] = min(f[i][j], f[i][j-a[i]]+1)

print(kq+f[n][s]-1)
