import sys
def sqr(a):
    return a*a

def mu(a,n):
    if n==0: return 1
    if n%2==0: return sqr(mu(a,n//2))
    return sqr(mu(a,n//2))*a

[x,y]=[int(x) for x in sys.stdin.readline().split()]
a=str(mu(x,y))
n=len(a)
i=0
while i<n :
    print(a[i:i+70])
    i+=70
