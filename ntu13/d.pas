uses math;
type int=longint;
var a: array[1..1000] of int;
	n: int;

function part(l,r: int): int;
var kq,i: int;
	mina,ll: int;
begin
	if l>r then exit(0);
    mina:=2100000000;
	for i:=l to r do mina:=min(mina, a[i]);
    for i:=l to r do a[i]:=a[i]-mina;
    kq:=1;
    while (l<=r)and(a[l]=0) do inc(l);
    while (r>=l)and(a[r]=0) do dec(r);
    ll:=l;
    for i:=l to r do begin
    	if a[i]=0 then begin
        	kq:=kq+part(ll,i-1);
            ll:=i+1;
        end;
    end;
    kq:=kq+part(ll,r);
    exit(kq); 
end;

procedure main();
var i: int;
begin
	readln(n);
    for i:=1 to n do read(a[i]);
    writeln(part(1,n));
end;

begin
main();
end.