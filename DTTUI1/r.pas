var n,i: longint;
begin
	randomize;
    n:=40;
    writeln(n,' ',random(1000000000)+1);
    for i:=1 to n do writeln(random(100000000)+1,' ',random(100000000)+1);
end.