import sys

def gcd(a,b):
    r=0
    while b>0:
        r=a%b
        a=b
        b=r
    return a

def lcm(a,b):
    return (a*b)//gcd(a,b)

def factor(k):
    res=[]
    i=2
    while k//i>=i :
        this=1
        while k%i==0:
            k//=i
            this*=i
        if this>1: res+=[this]
        i=i+1
    if k>1: res+=[k]
    return res

def do():
    pack=factor(k)
    b=[0]*len(pack)
    l=len(pack)
    for x in a :
        for i in range(l) : 
            if x%pack[i]==0: b[i]=gcd(x, b[i])
    kk=b[0]
    for i in range(1,l): kk=lcm(kk, b[i])
    if kk==k: return 'YES'
    else : return 'NO'

T = int(sys.stdin.readline())
while T>0:
    T=T-1
    n=int(sys.stdin.readline())
    a=[int(x) for x in sys.stdin.readline().split()]
    k=int(sys.stdin.readline())
    print(do())
