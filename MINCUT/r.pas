var k,m,n,x,y,i,j: longint;
begin
randomize();
m:=10;
n:=10;
k:=10;
writeln(m,' ',n,' ',k);
for i:=1 to m do begin
	for j:=1 to n do write(random(1000000),' ');
    writeln;
end;
for i:=1 to k do begin
x:=random(m-1)+1;
y:=random(n-1)+1;
writeln(x,' ',y,' ',x+random(m-x)+1,' ',y+random(1)+1);
end;
end.
