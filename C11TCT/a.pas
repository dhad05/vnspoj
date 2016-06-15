type int=longint;
const mo: int64=100003;
var a: array[0..100003] of int64;

procedure init();
var i: int;
begin
	a[0]:=1;
    for i:=1 to mo-1 do a[i]:=a[i-1]*int64(i) mod mo;
end;
function sqr(a: int64): int64;
begin
	exit(a*a mod mo);
end;
function mu(a,b: int64): int64;
begin
	if b=0 then exit(1);
    if b mod 2=0 then exit(sqr(mu(a,b div 2)));
    exit(sqr(mu(a,b div 2))*a mod mo);
end;
function f(n: int64): int64;
begin
	if n=0 then exit(1);
	f:=a[n mod mo]*f(n div mo) mod mo;
    if n div mo mod 2=1 then f:=f*a[mo-1] mod mo;
end;
function bac(a,b: int64): int64;
begin
	bac:=0;
    while a>=b do begin
    	bac:=bac+a div b;
        a:=a div b;
    end;
end;
function c(n,k: int64): int64;
begin
	if (k<0)or(k>n) then exit(0);
    if (bac(n,mo)>0)and(bac(n,mo)<>bac(k,mo)+bac(n-k,mo)) then exit(0);
    exit(f(n)*mu(f(k),mo-2) mod mo * mu(f(n-k),mo-2) mod mo);
end;

procedure main();
var t: int;
	m,n: int64;
begin
	init();
    readln(t);
    for t:=t downto 1 do begin
    	readln(m,n);
        writeln(c(m-n+1,n));
    end;
end;

begin
randomize();
main();
end.
