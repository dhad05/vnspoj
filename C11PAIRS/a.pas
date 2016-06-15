uses math;
type int=longint;
var a,s: array[1..500000] of int64;
	b: array[1..500000] of int64;
	n,i,j,top: int;
    kq,this: int64;

begin
readln(n);
for i:=1 to n do readln(a[i]);
top:=1;
s[top]:=a[1];
b[top]:=1;
kq:=0;
for i:=2 to n do begin
	this:=1;
	while (top>0)and(a[i]>=s[top]) do begin
    	kq:=kq+b[top];
        if a[i]=s[top] then this:=this+b[top];
        dec(top);
    end;
    if top>0 then kq:=kq+1;
    inc(top);
    s[top]:=a[i];
    b[top]:=this;
end;
writeln(kq);
end.