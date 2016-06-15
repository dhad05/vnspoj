#!/usr/bin/python2
import sys;
inf = 4000000000
(n, k) = sys.stdin.readline().split()
a = sys.stdin.readline().split()
n = int(n)+1
k = int(k)+1
a[:] = [0] + [int(i) for i in a] + [-inf]*k
f = [0] + [-inf]*(n+k)
kq = 0
for i in range(n) : 
    kq = max(kq, f[i])
    for j in range(1, k) :
        f[i+j] = max(f[i+j], f[i]+a[i+j])

print(kq)
