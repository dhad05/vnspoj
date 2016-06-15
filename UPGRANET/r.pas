type int=longint;
var m,n,i,u,v: int;
	a: array[1..5000,1..5000] of int;

begin
randomize();
fillchar(a,sizeof(a),0);
n:=100;
m:=2000;
writeln(n,' ',m);
for i:=1 to m do begin
	repeat
    u:=random(n)+1;
    v:=random(n)+1;
    until (u<>v)and(a[u,v]=0);
    a[u,v]:=1;a[v,u]:=1;
    writeln(u,' ',v,' ',random(1000000)+1);
end;
end.
