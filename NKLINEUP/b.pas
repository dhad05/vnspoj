uses math;
type int=longint;
const inf=2100000000;
var n: int;
	a,f,g: array[1..50000] of int;

procedure up(i,c: int);
begin
	while i<=n do begin
    	f[i]:=max(f[i],c);
        g[i]:=min(g[i],c);
    	i:=i+(i and(-i));
    end;
end;
function get(l,r: int): int;
var u,v,i: int;
begin	
	i:=r;
    u:=a[l];
    v:=a[l];
    while i>l do begin
    	if i-(i and(-i))<l then begin
        	u:=max(u,a[i]);
            v:=min(v,a[i]);
            i:=i-1;
        end else begin
        	u:=max(u,f[i]);
            v:=min(v,g[i]);
        	i:=i-(i and(-i));
        end;
    end;
    exit(u-v);
end;

procedure main();
var i,u,v,m: int;
begin
	readln(n,m);
    for i:=1 to n do readln(a[i]);
    for i:=1 to n do begin
    	f[i]:=0;
        g[i]:=inf;
    end;
    for i:=1 to n do up(i,a[i]);
    for i:=1 to m do begin
    	readln(u,v);
        writeln(get(u,v));
    end;
end;

begin
main();
end.