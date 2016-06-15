uses math;
var T, n: int64;

function calc(n: int64): int64;
var l,r,i: int64;
begin
	l:=1;
    r:=trunc(sqrt(2*n));
    while l<=r do begin
    	i:=(r+l) div 2;
        if i*(i+1) div 2<n then l:=i+1
        else r:=i-1;
    end;
    exit((n-r*(r+1) div 2)mod 10);
end;

begin
readln(T);
while T>0 do begin
	readln(n);
    writeln(calc(n));
    T:=T-1;
end;
end.