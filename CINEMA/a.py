import sys
[m,n]=[int(x) for x in sys.stdin.readline().split()]
[k]=[int(x) for x in sys.stdin.readline().split()]
k+=1
a=[int(x) for x in sys.stdin.read().split()]+[m*n]
x=1
this=a[x-1]
b=[[0 for i in range(n)] for i in range(m)]
for i in range(m) :
    if i%2==0 : day=range(n)
    else : day=range(n-1,-1,-1)
    for j in day :
        this-=1
        b[i][j]=x
        if this<=0 :
            this=a[x]
            x=(x+1)%k
for i in range(0,m) :
    for j in range(0,n) :
        sys.stdout.write(str(b[i][j])+' ')
    print()
