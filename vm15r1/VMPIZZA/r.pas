var m,n,i,a,b,t: integer;
begin
randomize;
n:=10;
m:=random(10);
t:=0;
writeln(n,' ',m);
for i:=1 to n do begin
	t:=t+random(5)+1;
    a:=random(10);
    b:=random(10);
    writeln(t, ' ', a, ' ', b);
end;
end.
