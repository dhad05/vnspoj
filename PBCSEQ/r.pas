var n,i,j: longint;

begin
randomize;
n:=100000;
writeln(n);
for i:=1 to n do begin
	j:=random(1000000)+1;
    writeln(j,' ',j+random(1000000-j+1));
end;
end.
