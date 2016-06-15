type int=longint;
const z: int64=20;
	  inf=high(int64);
var n: int;
	a,x,y: array[1..2000] of int64;

function gcd(u,v: int64): int64;
var r: int64;
begin
	if u<0 then u:=-u;
    if v<0 then v:=-v;
	while v>0 do begin
    	r:=u mod v;
        u:=v;
        v:=r;
    end;
    exit(u);
end;
function pack(a,b: int64): int64;
var d: int64;
begin
	d:=gcd(a,b);
    a:=a div d;
    b:=b div d;
    if b<0 then begin
    	a:=-a;
        b:=-b;
    end else if b=0 then a:=1;
    if a=0 then b:=1;
    if a<0 then exit(-((-a)<<z+b));
    exit(a<<z+b);
end;

procedure sort(l,r: int);
var i,j: int;
	x,tmp: int64;
begin
    i:=l;j:=r;
    x:=a[l+random(r-l+1)];
    while i<=j do begin
        while a[i]<x do inc(i);
        while a[j]>x do dec(j);
        if i<=j then begin
            tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
            inc(i);dec(j);
        end;
    end;
    if l<j then sort(l,j);
    if i<r then sort(i,r);
end;

function calc(n: int): int64;
var i: int;
	kq,j: int64;
begin
	for i:=1 to n-1 do begin
    	a[i]:=pack(x[i]-x[n], y[i]-y[n]);
    end;
    a[n]:=inf;
    sort(1,n-1);
    kq:=0;
    j:=1;
    for i:=2 to n do if a[i]<>a[i-1] then begin
		j:=i-j;
        kq:=kq+j*(j-1) div 2;
        j:=i;
    end;
    exit(kq);
end;

procedure main();
var i: int;
	kq: int64;
begin
	readln(n);
    for i:=1 to n do readln(x[i],y[i]);
    kq:=0;
    for i:=3 to n do kq:=kq+calc(i);
    writeln(kq);
end;

begin 
randomize();
main();
end.