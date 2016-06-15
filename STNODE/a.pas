type int=longint;
	 link=^node;
     node=record
     	u: int;
        next: link;
     end;
var n,s,t: int;
	ke: array[1..10000] of link;
var q,p,trc: array[1..10000] of int;
	z: int;

function bfs(o: int): boolean;
var first,last,u,v: int;
	r: link;
begin
	inc(z);
	first:=1;
    last:=1;
    q[last]:=s;
    p[s]:=z;
    while first<=last do begin
    	u:=q[first];
        inc(first);
        r:=ke[u];
        while r<>nil do begin
        	v:=r^.u;
            r:=r^.next;
            if v=o then continue;
            if p[v]=z then continue;
            inc(last);
            q[last]:=v;
            if o=0 then trc[v]:=u;
            p[v]:=z;
            if v=t then exit(true);
        end;
    end;
    exit(false);
end;

procedure main();
var i,u,v,kq: int;
	m: int;
    r: link;
begin
	readln(n,m,s,t);
    for u:=1 to n do ke[u]:=nil;
    for i:=1 to m do begin
    	readln(u,v);
        new(r);
        r^.u:=v;
        r^.next:=ke[u];
        ke[u]:=r;
    end;
    fillchar(p,sizeof(p),0);
    z:=1;
    bfs(0);
    kq:=0;
    u:=trc[t];
    while u<>s do begin
    	if not bfs(u) then kq:=kq+1;
        u:=trc[u];
    end;
    writeln(kq);
end;

begin
main();
end.