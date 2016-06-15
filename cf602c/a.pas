type int=longint;
var n: int;
	a: array[1..400,1..400] of int;
    d,q: array[1..400] of int;

function bfs(k: int): int;
var u,v,first,last: int;
begin
	for u:=1 to n do d[u]:=-1;
	first:=1;
    last:=1;
    q[last]:=1;
    d[1]:=0;
    while first<=last do begin
    	u:=q[first];
        inc(first); 
        if u=n then exit(d[n]);
        for v:=1 to n do if (a[u,v]=k)and(d[v]=-1) then begin
        	d[v]:=d[u]+1;
            inc(last);
            q[last]:=v;
        end;
    end;
    exit(-1);
end;

procedure main();
var u,v,m: int;
begin
	readln(n,m);
    fillchar(a,sizeof(a),0);
    for m:=m downto 1 do begin
    	readln(u,v);
        a[u,v]:=1;
        a[v,u]:=1;
    end;
    writeln(bfs(1-a[1,n]));
end;

begin
main();
end.