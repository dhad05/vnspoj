uses math;
type int=longint;
	 link=^node;
     node=record
     	u,w: int;
        next: link;
     end;
     edge=record u,v,w: int64; end;
const maxw=1000000;
var kq: int64;
	n,m: int;
	ke,list: array[1..100000] of link;
    c: array[1..100000] of edge;
var tmparr: array[1..100000] of edge;
	num,first: array[1..maxw+1] of int;
var cha,rank: array[1..100000] of int;
var free: array[1..100000] of boolean;
	arr,path: array[1..100000] of int;
    queue: array[1..100000] of link;

procedure makeset(i: int);
begin
	cha[i]:=i;
    rank[i]:=0;
    path[i]:=maxw+1;
end;
function find(u: int; boo: boolean): int;
begin
	if cha[u]<>u then begin
    	find(cha[u],boo);
        if boo then path[u]:=min(path[u],path[cha[u]]);
        cha[u]:=cha[cha[u]];
    end;
    exit(cha[u]);
end;
function union(u,v: int; boo: boolean;w: int): boolean;
begin
	u:=find(u,boo);
    v:=find(v,boo);
    if u=v then exit(false);
    if boo then begin
    	path[v]:=w;
    	cha[v]:=u;
        exit(true);
    end;
    if rank[u]=rank[v] then inc(rank[u]);
    if rank[u]>rank[v] then cha[v]:=u
    else cha[u]:=v;
    exit(true);
end;

procedure push_top(var r: link; u,w: int);
var t: link;
begin
	new(t);
    t^.u:=u;
    t^.w:=w;
    t^.next:=r;
    r:=t;
end;

procedure sort();
var i: int;
begin
	fillchar(num,sizeof(num),0);
    for i:=1 to m do inc(num[c[i].w]);
    for i:=maxw downto 1 do begin
    	first[i]:=num[i+1]+1;
        num[i]:=num[i+1]+num[i];
    end;
    for i:=1 to m do with(c[i]) do begin
    	tmparr[first[w]]:=c[i];
        inc(first[w]);
    end;
    for i:=1 to m do c[i]:=tmparr[i];
end;

procedure dfs(u: int);
var v,w: int;
	t: link;
begin
	makeset(u);
    t:=ke[u];
    while t<>nil do begin
    	v:=t^.u; w:=t^.w; t:=t^.next;
        if arr[u]=v then continue;
        arr[v]:=u;
        dfs(v);
        union(u,v,true,w);
    end;
    free[u]:=false;
    t:=list[u];
    while t<>nil do begin
    	v:=t^.u; w:=t^.w; t:=t^.next;
        if free[v]=true then continue;
        find(v,true);
        push_top(queue[cha[v]],u,path[v]);
    end;
    t:=queue[u];
    while t<>nil do begin
    	v:=t^.u; w:=t^.w; t:=t^.next;
        find(v,true);
        kq:=kq+int64(min(w,path[v]));
    end;
end;

procedure main();
var i: int;
begin
	readln(n,m);
    for i:=1 to m do with(c[i]) do readln(u,v,w);
    sort();
    for i:=1 to n do begin
    	makeset(i);
        ke[i]:=nil;
        list[i]:=nil;
    end;
    kq:=0;
    for i:=1 to m do with(c[i]) do if union(u,v,false,0) then begin
    	push_top(ke[u],v,w);
        push_top(ke[v],u,w);
    end else begin
		push_top(list[u],v,w);
        push_top(list[v],u,w);
        kq:=kq-int64(w);	
    end;
    fillchar(free,sizeof(free),true);
    fillchar(arr,sizeof(arr),0);
    for i:=1 to n do queue[i]:=nil;
    dfs(1);
    writeln(kq);
end;

begin
main();
end.
