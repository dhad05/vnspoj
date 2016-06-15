uses math;
type real=extended;
	 int=longint;
var r,v: real;

function rrcos(x: real): real;
var kq,kq1,k,this: real;
	i: int;
begin
	x:=x-trunc(x/(2*pi))*2*pi;
	kq1:=r*r;
    kq:=0;
    this:=r*r;
    k:=1;
    i:=1;
    repeat
    	kq:=kq1;
    	this:=this*x/k*x/(k+1);
        k:=k+2;
        if odd(i) then kq1:=kq-this
        else kq1:=kq+this;
        inc(i);
    until abs(kq-kq1)<=1e-22;
    exit(kq1);
end;

function calc(a: real): real;
var d,c,x: real;
begin
    d:=max(0,(a-2*r)/v);
    c:=a/v;
    repeat
    	x:=(d+c)/2;
        if sqr(a-v*x)<=2*r*r-2*rrcos(x*(v/r)) then c:=x
        else d:=x;
    until abs(d-c)/max(1,d)<=1e-7;
    exit(d);
end;

procedure main();
var n,i: int;
	a,b: real;
begin
	readln(n,r,v);
    for i:=1 to n do begin
    	readln(a,b);
        writeln(calc(b-a):0:6);
    end;
end;

begin
main();
end.
