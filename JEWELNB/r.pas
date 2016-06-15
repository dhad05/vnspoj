var m,n,i,s,e,u,v: longint;

function dau(): longint;
begin
	if random(2)=0 then exit(1);
    exit(-1);
end;

begin
randomize;
n:=200000;
m:=200000;
writeln(n,' ',m);
for i:=1 to m do begin
	s:=random(n)+1;
    e:=s+random(n-s+1);
    u:=random(1000000000);
    v:=dau()*random(1000000000);
	writeln(s,' ',e,' ',u,' ',v);
end;
end.
