type int=longint;
const inf=2100000000;
var n: int;
	a: array[1..100] of int;
    this,kq,l: int;

function gcd(a,b: int): int;
var r: int;
begin
	while b<>0 do begin
    	r:=a mod b;
        a:=b;
        b:=r;
    end;
    exit(a);
end;

procedure dq(i: int);
var tmp: int;
begin
	if l>=kq then exit();
    if this=1 then begin
    	kq:=l;
        exit();
    end;
	if i>n then exit();
    dq(i+1);
    tmp:=this;
    this:=gcd(a[i],this);
    if this<>tmp then begin
    	inc(l);
        dq(i+1);
        this:=tmp;
        dec(l);
    end;
end;

procedure xl();
var i: int;
begin
	this:=0;
    for i:=1 to n do this:=gcd(a[i],this);
    for i:=1 to n do a[i]:=a[i] div this;
    this:=0;
    l:=0;
    kq:=inf;
    dq(1);
    writeln(kq);
end;

procedure main();
var t,i: int;
begin
	readln(t);
    for t:=t downto 1 do begin
    	readln(n);
        for i:=1 to n do read(a[i]);
        xl();
    end;
end;

begin
main();
end.