var n,i: longint;
	kq,nx: int64;
    a: array[1..1000000] of char;
    x,y: char;

begin
n:=0;
while not eoln do begin
	inc(n);
    read(a[n]);
end;
readln();
readln(x,y);
nx:=0;
kq:=0;
for i:=1 to n do begin
	kq:=kq+nx*int64(a[i]=y);
	nx:=nx+int64(a[i]=x);
end;
writeln(kq);
end.