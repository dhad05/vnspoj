type int=longint;
var n,m: int;
	a: array[1..100,1..100] of int;
    trc,x,y,q: array[1..100] of int;
    first,last: int;

function dfs(i: int): boolean;
var j: int;
begin
	for j:=1 to m do if a[i,j]=1 then begin
    	if (y[j]=0)or((trc[y[j]]=i)and(dfs(y[j]))) then begin
        	y[j]:=i;
            x[i]:=j;
        	exit(true);
        end;
    end;	
    exit(false);
end;

function bfs(): boolean;
var i,j,top: int;
begin
	first:=1;
    last:=0;
    for i:=1 to n do if x[i]=0 then begin
    	inc(last);
        q[last]:=i;
        trc[i]:=0;
    end else trc[i]:=-1;
    top:=0;
    while first<=last do begin
    	i:=q[first];
        inc(first);
        for j:=1 to m do if a[i,j]=1 then begin
        	if y[j]=0 then begin
            	inc(top);
            end else if trc[y[j]]=-1 then begin
            	inc(last);
                q[last]:=y[j];
                trc[y[j]]:=i;
            end;
        end;
    end;
    exit(top>0);
end;

procedure main();
var i,j,kq,u,v: int;
begin
	fillchar(a,sizeof(a),0);
	readln(n,m);
    while not seekeof() do begin
    	readln(u,v);
        a[u,v]:=1;
    end;
    fillchar(x,sizeof(x),0);
    fillchar(y,sizeof(y),0);
    while bfs() do begin
    	for i:=1 to n do if x[i]=0 then dfs(i);
    end;
    kq:=0;
    for i:=1 to n do kq:=kq+int(x[i]<>0);
    writeln(kq);
    for i:=1 to n do if x[i]<>0 then writeln(i,' ',x[i]);
end;

begin
randomize();
main();
end.