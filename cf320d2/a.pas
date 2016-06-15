var n,kq: longint; 

begin
readln(n);
kq:=0;
while n>0 do begin
	kq:=kq+(n and 1);
    n:=n div 2;
end;
writeln(kq);
end.