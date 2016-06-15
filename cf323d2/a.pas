type int=longint;
var n,i,u,v: int;
	b,a: array[1..50] of boolean;
begin
readln(n);
for i:=1 to n do a[i]:=true;
for i:=1 to n do b[i]:=true;
for i:=1 to n*n do begin
	readln(u,v);
    if a[u] and b[v] then begin
    	write(i,' ');
        a[u]:=false;
        b[v]:=false;
    end;
end;
writeln;
end.