uses math;
type int=longint;
	 real=extended;
var n: int;
	a: array[1..10001] of real;

function calc(x: real): real;
var kq,this: real;
	i: int;
begin        	
	kq:=0;
	for i:=1 to n do begin
    	this:=x*(x+a[i]+a[i+1]);
        kq:=kq+arccos((this-a[i]*a[i+1])/(this+a[i]*a[i+1]));
    end;
    exit(kq);
end;
procedure main();
var i: int;
	l,r,j: real;
begin
	readln(n);
    r:=0;
    for i:=1 to n do begin
    	read(a[i]);
        r:=r+a[i];
    end;
    a[n+1]:=a[1];
    l:=0;
    while abs(r-l)>0.00001 do begin
    	j:=(l+r)/2;
    	if calc(j)<2*pi then r:=j
        else l:=j;
    end;
    writeln(l:0:3);
end;

begin
randomize();
main();
end.