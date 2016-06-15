uses math;
type int=longint;
	 link=^node;
     node=record
     	u: int;
        w: int64;
     	next: link;
     end;
     edge=record
     	u,v: int;
        w: int64;
     end;
var n: int;
	ke: array[1..200000] of link;
    c: array[1..200000] of edge;
var trc,bac: array[1..200000] of int;
    path: array[1..200000] of int64;
var cha,rank: array[1..200000] of int;

procedure pushtop(var r: link;u: int;w: int64);
var t: link;
begin
	new(t);
    t^.u:=u;
    t^.w:=w;
    t^.next:=r;
    r:=t;
end;

procedure dfs(u: int);
var t: link;
	v: int;
    w: int64;
begin
	t:=ke[u];
    while t<>nil do begin
    	v:=t^.u; w:=t^.w; t:=t^.next;
        if trc[u]=v then continue;
        trc[v]:=u;
        bac[v]:=bac[u]+1;
        path[v]:=w;
        dfs(v);
    end;
end;

procedure makeset(i: int);
begin
	cha[i]:=i;
    rank[i]:=0;
end;
function find(u: int): int;
begin
	if cha[u]<>u then cha[u]:=find(cha[u]);
    exit(cha[u]);
end;
procedure union(u,v: int);
var tmp: int;
begin
	u:=find(u);
    v:=find(v);
    if u=v then exit();
    if rank[u]=rank[v] then inc(rank[u]);
    if rank[u]<rank[v] then begin
    	tmp:=u;
        u:=v;
        v:=tmp;
    end;	
    cha[v]:=u;
    path[u]:=max(path[u],path[v]);
    if bac[u]>bac[v] then begin
    	bac[u]:=bac[v];
        trc[u]:=trc[v];
    end;
end;

function calc(u,v: int; y: int64): int64;
begin
	while find(u)<>find(v) do begin
    	u:=find(u); v:=find(v);
        if bac[u]>=bac[v] then begin
        	y:=y div path[u];
            u:=trc[u];
        end else begin
        	y:=y div path[v];
            v:=trc[v];
        end;
        if y=0 then break;
    end;
	exit(y);
end;

procedure main();
var i,u,v,m,t: int;	
	y: int64;
begin
	readln(n,m);
    for i:=1 to n-1 do with c[i] do readln(u,v,w);

    for i:=1 to n do ke[i]:=nil;
    for i:=1 to n-1 do with c[i] do begin
    	pushtop(ke[u],v,w);
        pushtop(ke[v],u,w);
    end;
    trc[1]:=0; bac[1]:=1;
    dfs(1);
    for i:=1 to n do makeset(i);
    for i:=1 to n-1 do with c[i] do if w=1 then begin
    	union(u,v);
    end;
    for i:=1 to m do begin
    	read(t);
        if t=1 then begin
        	read(u,v,y);
            writeln(calc(u,v,y));
        end else begin
        	read(u,y);
            with c[u] do begin
            	if trc[u]=v then path[find(u)]:=y
                else path[find(v)]:=y;
            	if y=1 then union(u,v);
            end;
        end;
        readln;
    end;
end;

begin
main();
end.
