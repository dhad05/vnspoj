//*** spoj VNCUT (2015-03-04)
uses math;
const inf=2100000000;
var i, j, k, m, n: longint;
    g: array[0..5000, 0..5000] of longint;

function gcd(a, b: longint): longint;
var r: longint;
begin
while b<>0 do begin
    r:=a mod b;
    a:=b;
    b:=r;
end;
exit(a);
end;

begin
readln(m, n);
if n<m then begin
    i:=m;m:=n;n:=i;
end;
i:=gcd(m, n);
m:=m div i;
n:=n div i;
if n mod m=0 then g[m, n]:=n div m
else for i:=1 to m do for j:=i to n do begin
    g[i, j]:=inf;
    if j mod i=0 then g[i, j]:=j div i
    else if gcd(i, j)<>1 then begin
        k:=gcd(i, j);
        g[i, j]:=g[i div k, j div k];
    end else begin
        for k:=min(i, j) downto 1 do begin
            g[i, j]:=min(g[i, j], min(g[i-k, j]+g[k, j-k], g[i, j-k]+g[i-k, k]));
        end;
        inc(g[i, j]);
    end;
    g[j, i]:=g[i, j];
end;
writeln(g[m, n]);
end.
