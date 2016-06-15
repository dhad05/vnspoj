import sys
k = int(sys.stdin.readline())
n = int(sys.stdin.readline())
cha = [0]+[int(x)-1 for x in sys.stdin.readline().split()]
ke = [[] for x in range(n)]
con = [0]*n
f = [0]*n
for i in range(1, n) :
    ke[cha[i]]+=[i]

def dq(u):
    for v in ke[u]:
        dq(v)
        con[u]+=con[v]
        f[u]+=f[v]
    if con[u]+1<k:
         con[u]+=1
    else:
        con[u]=0
        f[u]+=1

dq(0)
print(f[0])
