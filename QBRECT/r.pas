var m,n,i,j: integer;

begin
randomize();
n:=500;
m:=800;
writeln(m,' ',n);
for i:=1 to m do begin
	for j:=1 to n do begin
    	if random(15)=1 then write(0,' ')
        else write(1,' ');
    end;
    writeln;
end;
end.
