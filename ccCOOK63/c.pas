type int=longint;
var n: int;
	a: array[1..1000000] of int;

function calc(): string;
var i,tmp: int; 
begin
	for i:=2 to n do begin
    	if a[i]<a[i-1] then begin
        	tmp:=a[i];
            a[i]:=a[i-1];
            a[i-1]:=tmp;
        end;
    end;
    for i:=2 to n do if a[i]<a[i-1] then exit('NO');
    exit('YES');
end;

procedure main();
var t,i: int;
begin
	readln(t);
    for t:=t downto 1 do begin
    	readln(n);
        for i:=1 to n do read(a[i]);
        writeln(calc());
    end;
end;

begin
main();
end.