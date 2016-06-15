function sqr(a,m: int64): int64;
begin
	exit(a*a mod m);
end;
function mu(a,b,m: int64): int64;
begin
	if b=0 then exit(1);
    if b mod 2=0 then exit(sqr(mu(a,b div 2,m),m));
    exit(sqr(mu(a,b div 2,m),m)*a mod m);
end;

procedure main();
var a,b,n,i,kq: int64;
begin
	readln(a);
    b:=a;
    n:=1;
    i:=2;
    while i<=b do begin
    	if b mod i=0 then begin
        	n:=n*i;
    		while b mod i=0 do b:=b div i;
        end;
        inc(i);
        if b div i<i then break;
    end;
    n:=n*b;
    kq:=n;
    while mu(kq,kq,a)<>0 do kq:=kq+n;
    writeln(kq); 
end;

begin
main();
end.