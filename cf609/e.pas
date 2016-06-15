uses math;
type int=longint;
	 pack=record
     	u,v,id: int;
        w: int64;
     end;
     link=^node;
     node=record
     	u,id: int;
        w: int64;
        next: link;
     end;
const inf: int64=2100000000;
var n,m: int;
	ke,list,queue: array[1..200000] of link;
    c: array[1..200000] of pack;
    kq,path: array[1..200000] of int64;
    cha,free: array[1..200000] of int;

procedure push(var t: link; u: int; w: int64; id: int);
var r: link;
begin
	new(r);
    r^.u:=u; r^.w:=w; r^.id:=id; r^.next:=t;
    t:=r;
end;
procedure qsort();
	procedure sort(l,r: int);
    var i,j: int;
    	x,tmp: pack;
    begin
    	i:=l; j:=r;
        x:=c[l+random(r-l+1)];
        while i<=j do begin
        	while c[i].w<x.w do inc(i);
            while c[j].w>x.w do dec(j);
            if i<=j then begin
				tmp:=c[i]; c[i]:=c[j]; c[j]:=tmp;
                inc(i); dec(j);	
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,m);
end;
procedure makeset(i: int);
begin
	cha[i]:=i; path[i]:=-1;
end;
function find(u: int): int;
begin
	if cha[u]<>u then begin
    	find(cha[u]);
        path[u]:=max(path[u],path[cha[u]]);
        cha[u]:=cha[cha[u]];
    end;
    exit(cha[u]);
end;
function union(u,v: int): boolean;
begin
	u:=find(u); v:=find(v);
    if u=v then exit(false);
    cha[v]:=u;
    exit(true);
end;
procedure dfs(u: int);
var v,id: int;
	w: int64;
    t: link;
begin
	free[u]:=0;
    t:=ke[u];
    while t<>nil do begin
        v:=t^.u; w:=t^.w; t:=t^.next;
        if free[v]<>1 then continue;
        dfs(v);
        union(u,v);
        path[v]:=w;
    end;	
    t:=list[u];
    while t<>nil do begin
        v:=t^.u; id:=t^.id; t:=t^.next;
        if free[v]=1 then continue;
        find(v);
        push(queue[cha[v]],u,path[v],id);
    end;
    t:=queue[u];
    while t<>nil do begin
    	v:=t^.u; id:=t^.id; w:=t^.w; t:=t^.next;
        find(v);
        kq[id]:=max(w,path[v]);
    end;
    free[u]:=-1;
end;

procedure main();
var i: int;
	mini: int64;
begin
	readln(n,m);
    for i:=1 to m do with c[i] do readln(u,v,w);
    for i:=1 to m do c[i].id:=i;
    qsort();
    for i:=1 to n do begin
    	ke[i]:=nil;
        list[i]:=nil;
        queue[i]:=nil;
    end;
    for i:=1 to n do makeset(i);
    mini:=0;
    for i:=1 to m do with c[i] do if union(u,v) then begin
    	push(ke[u],v,w,id);
        push(ke[v],u,w,id);
        mini:=mini+w;
        kq[id]:=w;
    end else begin 
    	push(list[u],v,w,id);
        push(list[v],u,w,id);
    end;
    for i:=1 to n do makeset(i);
    for i:=1 to n do free[i]:=1;
    dfs(1);
    for i:=1 to m do with c[i] do kq[id]:=mini-kq[id]+w;
    for i:=1 to m do writeln(kq[i]);
end;

begin
randomize();
main();
end.