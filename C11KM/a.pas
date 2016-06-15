uses math;
type int=longint;
const inf=2100000000;
var n,i,j: int;
	a: array[1..1000] of int;
	f: array[0..1001,0..1001] of int;

begin
readln(n);
for i:=1 to n do readln(a[i]);
for i:=0 to n+1 do begin
	f[0,i]:=inf;
end;
f[0,0]:=0;
for i:=1 to n do begin
	for j:=0 to n do begin
    	f[i,j]:=f[i-1,j+1];
    	if (a[i]>100)and(j>0) then f[i,j]:=min(f[i,j], f[i-1,j-1]+a[i])
        else f[i,j]:=min(f[i,j], f[i-1,j]+a[i]);
    end;
end;
writeln(f[n,0]);
end.