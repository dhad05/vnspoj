var t,l,r: int64;

function c(a,l,r: int64): int64;
begin
	exit(r div a-(l-1) div a);
end;

begin
readln(t);
while t>0 do begin
	readln(l,r);
    writeln(c(12,l,r)+c(30,l,r)-2*c(60,l,r));
    dec(t);
end;
end.
