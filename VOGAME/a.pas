type int=longint;
var n,d,TEST: int;
	a: array[1..100000] of int;

procedure main();
var i,kq,j: int;
begin
	readln(d,n);
    for i:=1 to n do read(a[i]);
    kq:=0;
    for i:=1 to d mod(n+1) do kq:=kq xor a[i];
    writeln(kq);
end;

begin
readln(TEST);
for TEST:=TEST downto 1 do main();
end.
