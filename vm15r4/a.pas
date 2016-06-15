type int=longint;
var n,m,i: int;
	a,b:array[1..300] of int;

begin
readln(n);
m:=n div 2;
for i:=1 to n do a[i]:=(i-1) mod m+1;
for i:=1 to n do b[i]:=1;
if (n mod 2<>0)and(n>3) then begin
	b[n]:=2;
end;
writeln(m);
for i:=1 to n do write(b[i],' ');writeln;
for i:=1 to n do write(a[i],' ');writeln;
end.
