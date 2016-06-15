type int=longint;
	 link=^node;
     node=record
     	d: int;
        c: int64;
        next: link;
     end;
var n: int;
	ke: array[1..10000] of link;
	p: array[1..10000] of int;
    kq: int64;

function dfs(u: int): int64;
var t: link;
	v: int;
    con, this, c: int64;
begin
	p[u]:=1;
	con:=1;
    t:=ke[u];
    while t<>nil do begin
    	v:=t^.d;
        c:=t^.c;
        t:=t^.next;
        if p[v]=1 then continue;
        this:=dfs(v);
        kq:=kq+c*this*(int64(n)-this);
        con:=con+this;
    end;
    exit(con);
end;

procedure main();
var i, u, v: int;
	c: int64;
    t: link;
begin
	readln(n);
    for i:=1 to n do ke[i]:=nil;
    fillchar(p,sizeof(p),0);
    for i:=1 to n-1 do begin
    	readln(u,v,c);
        inc(u);inc(v);
        new(t);
        t^.d:=v;
        t^.c:=c;
        t^.next:=ke[u];
        ke[u]:=t;
        new(t);
        t^.d:=u;
        t^.c:=c;
        t^.next:=ke[v];
        ke[v]:=t;
    end;
    kq:=0;
    dfs(1);
    writeln(kq);
end;

begin
main();
end.