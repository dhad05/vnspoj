uses math;
type int=longint;
const inf=2100000000;
var _a, a, b: array[1..300] of int;
	n,k: int;
    kq: int;

function mo(a: int): int;
begin
	if a>=k then exit(a-k);
    if a<0 then exit(a+k);
    exit(a);
end;

function kc(a,b: int): int;
begin
	exit(mo(b-a));
end;

function xl(): int;
var i,j,this,ret,t: int;
begin
	ret:=inf;
	for i:=1 to n do begin
        this:=kc(a[i],b[i]);
        t:=this;
    	for j:=1 to n do a[j]:=mo(a[j]+this);
        for j:=1 to n do this:=this+kc(a[j],b[j]);
        for j:=1 to n do a[j]:=mo(a[j]-t);
        ret:=min(ret, this);
    end;
    exit(ret);
end;

procedure nhap();
var i,j,h: int;
begin
readln(n,k);
inc(k);
for i:=1 to n do read(_a[i]);
readln;
for i:=1 to n do read(b[i]);
kq:=inf;
for i:=0 to n-1 do begin
	j:=1;
    for h:=n-i+1 to n do begin
    	a[j]:=_a[h];
        j:=j+1;
    end;
    for h:=1 to n-i do begin
    	a[j]:=_a[h];
        j:=j+1;
    end;
    kq:=min(kq, xl()+i);
end;
writeln(kq);
end;

begin
nhap();
end.