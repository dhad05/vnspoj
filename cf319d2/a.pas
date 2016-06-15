var x,n,i,kq: longint;

begin
readln(n,x);
kq:=0;
for i:=1 to n do begin
	if (x mod i=0)and(x div i<=n) then inc(kq);
end;
writeln(kq);
end.