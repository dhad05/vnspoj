var i,n: longint;
function dau(): longint;
begin
	if random(2)=1 then exit(1);
    exit(-1); 
end;
begin
randomize();
n:=2000;
writeln(n);
for i:=1 to n do begin
	writeln(dau()*random(10000),' ',dau()*random(10000));
end;
end.
