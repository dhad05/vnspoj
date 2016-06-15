//*** spoj VNCUT (2015-03-06)
uses math;
type int=longint;
const inf=2100000000;
var m, n, i, j, k: int;
    f: array[1..5000, 1..5000] of int;

function gcd(a, b: int):int;
begin
while b<>0 do begin
    gcd:=a mod b;
    a:=b;
    b:=gcd;
end;
exit(a);
end;

begin
readln(m, n);
if m>n then begin
    i:=m;m:=n;n:=i;
end;
i:=gcd(m, n);
m:=m div i;
n:=n div i;
if n mod m=0 then f[m, n]:=n div m
else begin
    for i:=1 to m do for j:=i to n do begin
        k:=gcd(i, j);
        if j mod i=0 then f[i, j]:=j div i
        else if k<>1 then f[i, j]:=f[i div k, j div k]
        else begin
            f[i, j]:=inf;
            for k:=1 to j div 2+j mod 2 do f[i, j]:=min(f[i, j], f[i, k]+f[i, j-k]);
            for k:=1 to i div 2+i mod 2 do f[i, j]:=min(f[i, j], f[k, j]+f[i-k, j]);
        end;
        f[j, i]:=f[i, j];
    end;
end;
writeln(f[m, n]);
end.
