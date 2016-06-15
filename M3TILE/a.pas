type int=longint;
var f,g: array[0..30] of int64;
	n: int;

function calc(n: int): int64;
var i,j: int;
begin
	f[0]:=0;
	for i:=1 to n do f[i]:=2;
    f[2]:=3;
    g[0]:=1;
    for i:=1 to n do begin
    	g[i]:=0;
        if not odd(i) then begin
        	for j:=1 to i do g[i]:=g[i]+f[j]*g[i-j];
        end;
    end;
    exit(g[n]);
end;

begin
while not eof() do begin
	readln(n);
    if n<>-1 then writeln(calc(n))
    else break;
end;
end.