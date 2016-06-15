type int=longint;
	 link=^node;
     node=record
     	u: int;
        next: link;
     end;
var kq: int64;
    ke: array[1..100000] of link;
    trc, l: array[1..100000] of int;
    b: array[1..100000] of int64;
    n, i, u: int;
    t: link;

procedure dfs(u: int);
var t: link;
	v: int;
begin
	if (u<>1)and(trc[u]<>1) then begin
        if l[u]<l[trc[trc[u]]] then inc(b[trc[trc[u]]]);
    end;
    t:=ke[u];
    while t<>nil do begin
    	v:=t^.u;
        t:=t^.next;
        if l[v]<l[u] then b[u]:=b[u]+1;
        trc[v]:=u;
        dfs(v);
    end;
    kq:=kq+(b[u]-1)*b[u] div 2;
end;

begin
readln(n);
readln(l[1]);
fillchar(b, sizeof(b), 0);
for i:=1 to n do ke[i]:=nil;
for i:=2 to n do begin
	readln(u, l[i]);
    new(t);
    t^.u:=i;
    t^.next:=ke[u];
    ke[u]:=t;
end;

kq:=0;
dfs(1);
writeln(kq);
end.