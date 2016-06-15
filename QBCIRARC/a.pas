type int=longint;
	 link=^node;
     node=record
     	u: int;
        next: link;
     end;
const inf=2100000000;
var n: int;
	ke : array[1..1000] of link;
    boo: array[1..1000,1..1000] of int;
    z: int;
var cha,trc: array[1..1000] of int;
	p,q,d: array[1..1000] of int;
	f: int;

function bfs(s: int;x,y: int): int;
var first,last: int;
	u,v: int;
    t: link;
begin
	z:=z+1;
    first:=1;
    last:=1;
    q[last]:=s;
    p[s]:=z;
    d[s]:=0;
    while first<=last do begin
    	u:=q[first];
        inc(first);
        t:=ke[u];
        while t<>nil do begin
        	v:=t^.u;
            t:=t^.next;
            if (u=x)and(v=y) then continue;
            if v=s then begin
            	trc[s]:=u;
            	exit(d[u]);
            end;
            if p[v]=z then continue;
            inc(last);
            q[last]:=v;
            trc[v]:=u;
            d[v]:=d[u]+1;
            p[v]:=z;
        end;	
    end;
    exit(inf);
end;

procedure find();
var i,j: int;
	kq,this: int;
begin
    kq:=inf;
	for i:=1 to n do begin
    	this:=bfs(i,0,0);
        if this<kq then begin
        	kq:=this;
            f:=i;
            for j:=1 to n do cha[j]:=trc[j];
        end;
    end;
end;

function exist(x,y: int): boolean;
var i: int;
begin
	for i:=1 to n do begin
    	if bfs(i,x,y)<inf then exit(true);
    end;
    exit(false);
end;

procedure main();
var m,i,j,u,v: int;
	t: link;
    kq: int;
begin
	readln(n,m);
    for u:=1 to n do ke[u]:=nil;
    for i:=1 to m do begin
    	readln(u,v);
        new(t);
        t^.u:=v;
        t^.next:=ke[u];
        ke[u]:=t;
    end;
    for i:=1 to n do for j:=1 to n do boo[i,j]:=0;
    z:=1;
    for i:=1 to n do p[i]:=0;
    f:=0;
    find();

    if f=0 then begin
    	writeln(-1);
        exit(); 
    end;

    u:=f;
    repeat
    	boo[cha[u],u]:=1-int(exist(cha[u],u));
    	u:=cha[u];
    until u=f;

    kq:=0;
    for i:=1 to n do for j:=1 to n do kq:=kq+boo[i,j];
    if kq=0 then begin
    	writeln(-1);
        exit();
    end;
    writeln(kq);
    for i:=1 to n do for j:=1 to n do if boo[i,j]=1 then begin
    	writeln(i,' ',j);
    end;
end;

begin
main();
end.