type int=longint;
var n: int;
	a: array[1..100, 1..100] of int64;

function xl1(): int64;
var this: int64;
	i: int;
begin
	this:=0;
	for i:=1 to n do this:=this+a[n-i+1,i];
    exit(this);
end;

function xl2(): int64;
var i,j: int;
	q,w: array[1..100] of int;
    x: array[1..100] of int64;
    tong, tong1, this: int64;
begin
	for i:=1 to n do q[i]:=i mod n+1;

    for i:=1 to n do begin
    	x[i]:=0;
        for j:=1 to n do x[i]:=x[i]+a[q[i],j]-a[i,j];
    end;

    for i:=1 to n div 2 do w[i]:=i;
    for i:=n div 2+2 to n do w[i-1]:=i;

    tong:=xl1();
    this:=tong;
    for j:=1 to n-1 do begin
    	tong1:=0;	
    	for i:=1 to n-1 do tong1:=tong1+x[w[i]];
        tong:=tong-tong1;
        this:=this+tong;
        for i:=1 to n-1 do w[i]:=q[w[i]];
    end;
    this:=this div (n-1);
    exit(this);
end;

procedure main();
var i,j: int;
	tong, this: int64;
begin
readln(n);
for i:=1 to n do for j:=1 to n do read(a[i,j]);

if n mod 2=0 then this:=xl1() else this:=xl2();

for i:=1 to n do begin
	tong:=0;
	for j:=1 to n do tong:=tong+a[i,j];
    a[i,i]:=this-tong;
end;

for i:=1 to n do begin
	for j:=1 to n do write(a[i,j],' ');
    writeln;
end;
end;

begin
main();
end.