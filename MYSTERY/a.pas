type int=longint;
var a,i: int;
    kq: int64;
    m: int64=20122007;

function sqr(i: int64): int64;
begin
    exit(i*i mod m);
end;

function mu(a: int64; i: int): int64;
begin
    if i=0 then exit(1);
    if i mod 2=0 then exit(sqr(mu(a,i div 2)));
    exit(sqr(mu(a,i div 2))*a mod m);
end;

begin
readln(a);
kq:=1;
for i:=1 to a do begin
    if a div i<i then break;
    if a mod i=0 then begin
        kq:=(kq*(mu(3,i)-1)) mod m;
        if a div i<>i then kq:=(kq*(mu(3,a div i)-1)) mod m;
    end;
end;
writeln(kq);
end.
