uses math;
type int=longint;
var n,i,j: int;
	f: array[0..10000] of int64;
    a,b: int64;

begin
readln(n);
for i:=0 to n do f[i]:=$FFFFFFFFFFFFFFF;
f[0]:=0;
for i:=1 to n do begin
	readln(a,b);
	for j:=i div 2 downto 1 do begin
        f[j]:=min(f[j]+b,f[j-1]+a);
    end;
    f[0]:=f[0]+b;
end;
writeln(f[n div 2]);
end.