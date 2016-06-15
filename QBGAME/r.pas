type int=longint;
var n,i,j: int;

function dau(): int;
begin
	if random(2)=0 then exit(1) else exit(-1);
end;

begin
randomize();
n:=10000;
writeln(n);
for i:=1 to 8 do begin
	for j:=1 to n do write(dau()*random(100000001),' ');
    writeln;
end;
end.
