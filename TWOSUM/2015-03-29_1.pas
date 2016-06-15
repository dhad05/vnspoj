//*** twosum spoj (2015-03-29_1)
type int=longint;
var n, i, d: int;
    a: array[0..5000] of int;
    f: text;

var l, r, k, x: int;

function check: boolean;
begin
    x:=a[r]-a[l-1];
    if x mod 2<>0 then exit(false);
    x:=a[l-1]+x div 2;
    while l<=r do begin
        k:=(l+r)div 2;
        if a[k]<x then l:=k+1
        else if a[k]>x then r:=k-1
        else exit(true);
    end;
    exit(false);
end;

begin
assign(f, '2sum.inp');
reset(f);
readln(f, n);
a[0]:=0;
for i:=1 to n do begin
    readln(f, a[i]);
    a[i]:=a[i]+a[i-1];
end;
close(f);
for d:=n-1 downto 1 do for i:=1 to n-d do begin
    l:=i;
    r:=i+d;
    if check then begin
        writeln(d+1);
        halt;
    end;
end;
writeln(0);
end.