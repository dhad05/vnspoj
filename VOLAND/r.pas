var m,n,u,v,k,i,j: longint;
function z(): longint;
begin
	if random(2)=1 then exit(-random(1000000));
    exit(random(1000000));
end;

begin
randomize();
n:=1000;
m:=1000;
u:=random(n div 2)+1; v:=random(n div 2)+1;
k:=random(n div 3)+1;
u:=1; v:=1; k:=1; 
writeln(m,' ',n,' ',u,' ',v,' ',k);
for i:=1 to m do for j:=1 to n do begin
	write(z(),' ');
    writeln;
end;
end.
