type int=longint;
var n,d,TEST: int;
	a: array[1..100000] of int;

procedure main();
var i,kq: int;
begin
	readln(n,d);
    for i:=1 to n do read(a[i]);
    if n=d then begin
    	kq:=a[1];
    	for i:=2 to n do kq:=kq xor a[i];
    	writeln(kq);
    end;
end;

begin
readln(TEST);
for TEST:=TEST downto 1 do main();
end.
