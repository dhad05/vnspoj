uses math;
type int=longint;
	 link=^node;
     node=record
     	d: int;
        next: link;
     end;
var n,top: int;
	ke: array[1..200000] of link;
    c,dep,id,l,r: array[1..200000] of int;
    s,f: array[1..500000] of int;

procedure dfs(u: int);
var v: int;
	t: link;
begin
	inc(top);
    s[top]:=u;
    l[u]:=top;
    r[u]:=0;
    t:=ke[u];
    while t<>nil do begin
    	v:=t^.d; t:=t^.next;
        if l[v]<>0 then continue;
        dep[v]:=dep[u]+1;
        dfs(v);
        inc(top);
        s[top]:=u;
        r[u]:=top;
    end;
    if r[u]<>top then begin
	    inc(top);
    	s[top]:=u;
    	r[u]:=top;
    end;
end;

procedure sort();
var i: int;
	procedure sort(l,r: int);
    var i,j,x,tmp: int;
    begin
    	i:=l; j:=r;
        x:=c[l+random(r-l+1)];
        while i<=j do begin
        	while c[i]<x do inc(i);
            while c[j]>x do dec(j);
            if i<=j then begin
            	tmp:=c[i]; c[i]:=c[j]; c[j]:=tmp;
                tmp:=id[i]; id[i]:=id[j]; id[j]:=tmp;
            	inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for i:=1 to n do id[i]:=i;
	sort(1,n);
end;
function get(u,v: int): int;
begin
	get:=0;
	while u<=v do begin
    	if u<=v-(v and(-v)) then begin
        	if(get=0)or(dep[get]>dep[f[v]]) then get:=f[v];
        	v:=v-(v and(-v));
        end else begin
        	if(get=0)or(dep[get]>dep[s[v]]) then get:=s[v];
            v:=v-1;
        end;
    end;
end;
function calc(u,v: int): int;
var x: int;
begin
	x:=get(min(l[u],l[v]),max(r[u],r[v]));
    exit(dep[u]+dep[v]-2*dep[x]);
end;

procedure main();
var t: link;
	this,i,j,u,v,x,m: int;
begin
	readln(n,m);
    for i:=1 to  n do begin
    	read(c[i],j);
        if j=0 then continue;
        new(t);
        t^.d:=i;
        t^.next:=ke[j];
        ke[j]:=t;
        new(t);
        t^.d:=j;
        t^.next:=ke[i];
        ke[i]:=t;
    end;
    top:=0;
    dep[1]:=0;
    dfs(1);
    sort();

    for i:=1 to top do begin
    	j:=i;
        while j<=top do begin
        	if (f[j]=0)or(dep[f[j]]>dep[s[i]])then f[j]:=s[i];
        	j:=j+(j and(-j));
        end;
    end;
    u:=1;
    for i:=1 to m do begin
    	v:=u;
        while (v<n)and(c[v+1]=c[v]) do inc(v);
        x:=id[u];
        for j:=u+1 to v do if dep[x]<dep[id[j]] then x:=id[j];
        this:=0;
        for u:=u to v do if id[u]<>x then begin
        	this:=max(this,calc(id[u],x));
        end;
        u:=v+1;
        writeln(this);
    end;
end;

begin
main();
end.