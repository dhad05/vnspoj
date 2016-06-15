var n,i,j: longint;

begin
randomize(); 
n:=1000;
writeln(n);
for i:=1 to n do begin
	for j:=1 to n do write(random(1000001),' ');
    writeln;
end;
end.