type int=longint;
var n,m,a,i: int;
	num: array[1..10] of int64;
    kq: int64;
    
begin
readln(n,m);
fillchar(num,sizeof(num),0);
for i:=1 to n do begin
	read(a);
    inc(num[a]);
end;
kq:=int64(n)*int64(n);
for i:=1 to m do kq:=kq-num[i]*num[i];
kq:=kq div 2;
writeln(kq);
end.