uses math;
type int=longint;
const inf=2100000000;
var m,n,i,j,kq: int;
	a,f: array[0..101,0..101] of int;

begin
readln(m,n);
for i:=1 to m do begin
	for j:=1 to n do read(a[i,j]);
    readln;
end;
for i:=0 to m+1 do for j:=0 to n+1 do f[i,j]:=-inf;
for i:=1 to m do f[i,0]:=0;
for j:=1 to n do for i:=1 to m do begin
	f[i,j]:=max(f[i,j-1],max(f[i-1,j-1],f[i+1,j-1]))+a[i,j];
end;
kq:=-inf;
for i:=1 to m do kq:=max(kq,f[i,n]);
writeln(kq);
end.