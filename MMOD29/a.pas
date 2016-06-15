type int=longint;
	 mang=array[0..27] of int;
const m: int=29;
var n: int;
	a,b: mang;

function sqr(a: int): int;
begin
	exit(a*a mod m);
end;

function mu(a,n: int): int;
begin
	if n=0 then exit(1);
    if odd(n) then exit(sqr(mu(a,n div 2))*a mod m);
    exit(sqr(mu(a,n div 2)));
end;

procedure init(var a: mang; n: int);
var i: int;
begin
	for i:=0 to m-2 do a[i]:=int(n mod (m-1)>=i);
    if n>=m-1 then for i:=0 to m-2 do a[i]:=a[i]+n div (m-1)-1;
    for i:=0 to m-2 do a[i]:=a[i] mod m;
end;

function calc(n: int): int;
var i,j,k,kq: int;
begin
    init(a, 2*n);
    init(b,n);
    kq:=0;
    for i:=0 to m-2 do for j:=0 to m-2 do for k:=0 to m-2 do begin
    	kq:=kq+mu(2,i)*mu(3,j)*mu(167,k)*a[i]*b[j]*b[k] mod m;
        kq:=kq mod m;
    end;
    exit(kq);
end;

function calc1(n: int): int;
var kq,i,j,k: int;
begin
	kq:=0;
	for i:=0 to 2*n do for j:=0 to n do for k:=0 to n do begin
    	kq:=kq+mu(2,i)*mu(3,j)*mu(167,k) mod m;
        kq:=kq mod m;
    end;
    exit(kq);
end;

begin
while not eof do begin
	readln(n);
    if n<>0 then writeln(calc(n)) 
    else break;
end;
end.