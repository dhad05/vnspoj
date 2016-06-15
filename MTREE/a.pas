type int=longint;
	 link=^node;
     node=record
     	d: int;
        c: int64;
        next: link;
     end;
const m:int64=1000000007;
var n: int;
	ke: array[1..100000] of link;
	p: array[1..100000] of int;
    kq: int64;

function dfs(u: int): int64;
var t: link;
	v: int;
    con, this, c: int64;
begin
	p[u]:=1;
	this:=0;
    t:=ke[u];
    while t<>nil do begin
    	v:=t^.d;
        c:=t^.c;
        t:=t^.next;
        if p[v]=1 then continue;
        con:=dfs(v);
        kq:=kq+(((con*c+c) mod m)*this) mod m;
        this:=(this+(con*c+c) mod m) mod m;
    end;
    kq:=(kq+this)mod m;
    exit(this);
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
