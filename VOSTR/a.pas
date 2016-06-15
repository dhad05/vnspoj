type int=longint; 
var m, n: int;
	a, b: array[1..1000000] of char;
	u,v,x,y: int;
    i,k: int;

function ss(u,v,x,y: int):char;
begin
    while (u<=v)and(x<=y) do begin
    	if a[u]<b[x] then exit('<')
        else if a[u]>b[x] then exit('>');
    	u:=u+1;
        x:=x+1;
    end;
    if u<=v then exit('>');
    if x<=y then exit('<');
    exit('=');
end;

begin
readln(n, m);
for i:=1 to n do read(a[i]);
readln();
for i:=1 to m do read(b[i]);
readln(k);
for i:=1 to k do begin
	readln(u, v, x, y);
    write(ss(u,v,x,y));
end;
end.