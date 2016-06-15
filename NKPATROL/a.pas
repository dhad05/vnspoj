const m=939999953;
var n: int64;

function calc(n: int64): int64;
var i: int64;
	kq: int64;
begin
	if n<=2 then exit(1);
    if n>=19999999 then exit(0);
    kq:=2;
    i:=3;
    while i<=n-1 do begin
    	kq:=(kq*i mod m)*i mod m;
        i:=i+1;
    end;
    kq:=kq*n mod m;
    exit(kq);
end;

begin
readln(n);
writeln(calc(n));
end.