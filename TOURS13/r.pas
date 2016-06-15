var m,n,i,u,v: longint;
	a: array[1..1000,1..1000] of longint;

begin
randomize();
fillchar(a,sizeof(a),0);
n:=1000;
m:=100000;
writeln(1);
writeln(n,' ',m);
for i:=1 to m do begin
	repeat
    u:=random(n)+1;
    v:=random(n)+1;
    until (u<>v)and(a[u,v]=0);
    a[u,v]:=1;
    writeln(u,' ',v,' ',random(1000000)+1);
end;
end.
