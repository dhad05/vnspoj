var n: int64;

function calc(n: int64): int64;
var i,kq: int64;
begin
	kq:=1;
    i:=2;
	while n div i>=i do begin
        if n mod i=0 then begin
        	kq:=kq*i;
            while n mod i=0 do n:=n div i;
        end;
        inc(i);
    end;
    exit(kq*n);
end;

begin
readln(n);
writeln(calc(n));
end.