type int=longint;
const inf=high(int64);
var n: int;
	a,x,y: array[1..2000] of real;

procedure sort(l,r: int);
var i,j: int;
	x,tmp: real;
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
    this: real;
begin
	for i:=1 to n-1 do begin
    	this:=y[i]-y[n];
        if this<>0 then a[i]:=(x[i]-x[n])/this
        else a[i]:=inf;
    end;
    sort(1,n-1);
    kq:=0;
    j:=1;
    for i:=2 to n do if (i=n)or(a[i]<>a[i-1]) then begin
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