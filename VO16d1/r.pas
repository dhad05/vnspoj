var n,u,v,i: longint;

begin
randomize; 
n:=200000;
for i:=1 to n do begin
	u:=random(n)+1;
    repeat
    	v:=random(n)+1;
    until u<>v;
    if u<v then writeln(u,' ',v)
    else writeln(v,' ',u);
end;
end.
