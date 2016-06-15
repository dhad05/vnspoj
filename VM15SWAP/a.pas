uses math;
type int=longint;
var m,n: int;
	a: array[1..1000,1..1000] of int;
    q,trc,x,y: array[1..1000] of int;
    zx,zy: array[1..1000] of boolean;

function dfs(i: int): boolean;
var j: int;
begin
	for j:=1 to n do if a[i,j]=0 then begin
    	if (y[j]=0)or((trc[y[j]]=i)and(dfs(y[j]))) then begin
        	y[j]:=i;
            x[i]:=j;
        	exit(true);
        end;
    end;
    exit(false);
end;

function bfs(): boolean;
var i,j,top,first,last: int;
begin
	first:=1;
    last:=0;
    for i:=1 to m do if x[i]=0 then begin
    	inc(last);
        q[last]:=i;
        trc[i]:=0;
        zx[i]:=true;
    end else begin
        trc[i]:=-1;
        zx[i]:=false;
    end;
    for i:=1 to n do zy[i]:=false;
    top:=0;
    while first<=last do begin
    	i:=q[first];
        inc(first);
        for j:=1 to n do if a[i,j]=0 then begin
            zy[j]:=true;
        	if y[j]=0 then begin
            	inc(top);
            end else if trc[y[j]]=-1 then begin
            	inc(last);
                q[last]:=y[j];
                trc[y[j]]:=i;
                zx[y[j]]:=true;
            end;
        end;
    end;
    exit(top>0);
end;

procedure main();
var i,j,c,kq,kqx,kqy: int;
begin
    readln(m,n);
    for i:=1 to m do for j:=1 to n do read(a[i,j]);
    fillchar(x,sizeof(x),0);
    fillchar(y,sizeof(y),0);
    kq:=0;
    while bfs() do begin
        for i:=1 to m do if x[i]=0 then kq:=kq+int(dfs(i));
    end;
    kq:=0;
    for i:=1 to m do kq:=kq+int(x[i]<>0);
    kq:=m+n-kq;
    if kq<=max(m,n) then begin
    	writeln('0 0');
        exit();
    end;
    kqx:=0;
    for i:=1 to m do if zx[i] then inc(kqx);
    kqy:=0;
    for i:=1 to n do if not zy[i] then inc(kqy);
    writeln(kqx,' ',kqy);
    writeln(kqx+kqy);
    c:=0;
    for i:=1 to m do if zx[i] then begin
    	inc(c);
    	writeln('R ',i,' ',c);
    end;
    c:=0;
    for i:=1 to n do if not zy[i] then begin
    	inc(c);
        writeln('C ',i,' ',c);
    end;
end;

begin
randomize();
main();
end.
