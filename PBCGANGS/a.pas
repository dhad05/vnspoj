type int=longint;
	 edge=record u,v: int; end;
var n,m: int;
	f,g: array[1..10000] of edge;
    a, cha, rank: array[1..1000] of int;
var x,l: array[1..1000] of int;

function find(u: int): int;
begin
	if cha[u]<>u then cha[u]:=find(cha[u]);
    exit(cha[u]);
end;
procedure union(u,v: int);
begin	
	u:=find(u);
    v:=find(v);
    if u=v then exit();
    if rank[u]=rank[v] then inc(rank[u]);
    if rank[u]>rank[v] then cha[v]:=u
    else cha[u]:=v;
end;

procedure sort();
var i,u: int;
begin
	fillchar(x,sizeof(x),0);
	for i:=1 to m do inc(x[f[i].u]);
    l[1]:=1;
    for i:=2 to n do begin
    	l[i]:=x[i-1]+1;
        x[i]:=x[i]+x[i-1];
    end;
    for i:=1 to m do begin
    	u:=f[i].u;
        g[l[u]]:=f[i];
        inc(l[u]);
    end;
end;

procedure main();
var i,u,v,num,kq: int;
	c: char;
begin
	readln(n);
    for i:=1 to n do begin
    	cha[i]:=i;
        rank[i]:=0;
    end;
    readln(num);
    m:=0;
    for i:=1 to num do begin
    	readln(c,u,v);
        if c='F' then union(u,v)
    	else begin
        	inc(m);
            f[m].u:=u;
            f[m].v:=v;
            inc(m);
            f[m].u:=v;
            f[m].v:=u;
        end;
    end;
    sort();
    for i:=2 to m do begin
    	if g[i].u=g[i-1].u then union(g[i].v,g[i-1].v);
    end;
    fillchar(a,sizeof(a),0);
    for i:=1 to n do a[find(i)]:=1;
    kq:=0;
    for i:=1 to n do kq:=kq+a[i];
    writeln(kq);
end;

begin
main();
end.               	