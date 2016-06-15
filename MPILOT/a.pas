uses math;
type int=longint;
var n,i,j: int;
	a,b,f: array[0..10000] of int64;

begin
readln(n);
for i:=1 to n do read(a[i],b[i]);
for i:=0 to n do f[i]:=$FFFFFFFFFFFFFFF;
f[0]:=0;
for i:=1 to n do begin
	for j:=i div 2 downto 1 do begin
        f[j]:=min(f[j]+b[i],f[j-1]+a[i]);
    end;
    f[0]:=f[0]+b[i];
end;
writeln(f[n div 2]);
end.