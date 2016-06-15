type int=longint;
	 link=^node;
     node=record
     	d: int;
        next: link;
     end;
var n: int;
	ke: array[1..10000] of link;
    q,trc,p,z: array[1..10000] of int;

procedure xl(i: int);
var t: link;
	v,x,m: int;
begin
	m:=0;
	t:=ke[i];
    while t<>nil do begin
    	v:=t^.d; t:=t^.next;
        if v<=i then continue;
        if z[v]=i then continue;
        inc(m);
        q[m]:=v;
        z[v]:=i;
    end;
    for m:=m downto 1 do begin
    	v:=q[m];
        t:=ke[v];
        while t<>nil do begin
        	x:=t^.d; t:=t^.next;
            if x<=i then continue;
            if p[x]<>i then begin
            	p[x]:=i;
                trc[x]:=v;
            end else if trc[x]<>v then begin
            	writeln(i,' ',v,' ',x,' ',trc[x]);
                halt;
            end;
        end;
    end;
end;

procedure main();
var t: link;
	i,u,v,m: int;
begin
	readln(n,m);
    for i:=1 to n do ke[i]:=nil;
    for i:=1 to m do begin
    	readln(u,v);
        new(t);
        t^.d:=v;
        t^.next:=ke[u];
        ke[u]:=t;
        new(t);
        t^.d:=u;
        t^.next:=ke[v];
        ke[v]:=t;
    end;
    fillchar(p,sizeof(p),0);
    for i:=1 to n do xl(i);
    writeln(-1);
end;

begin
main();
end.