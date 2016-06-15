type int=longint;
var n: int;
	a: array[1..200000,1..2] of int;
    free: array[1..200000] of boolean;
    mx,my,ok,p,trc,q: array[1..200000] of int;
    first,last: int;

function dfs(i: int): boolean;
var j,v: int;
begin
	for v:=1 to 2 do begin
    	j:=a[i,v];
        if j=0 then continue;
    	if (my[j]=0)or((trc[my[j]]=i)and(dfs(my[j]))) then begin
        	my[j]:=i;
            mx[i]:=j;
        	exit(true);
        end;
    end;	
    exit(false);
end;

function bfs(): boolean;
var i,j,v,top: int;
begin
	first:=1;
    last:=0;
    for i:=1 to n do if mx[i]=0 then begin
    	inc(last);
        q[last]:=i;
        trc[i]:=0;
    end else trc[i]:=-1;
    top:=0;
    while first<=last do begin
    	i:=q[first];
        inc(first);
        for v:=1 to 2 do begin
        	j:=a[i,v];
            if j=0 then continue;
        	if my[j]=0 then begin
            	inc(top);
            end else if trc[my[j]]=-1 then begin
            	inc(last);
                q[last]:=my[j];
                trc[my[j]]:=i;
            end;
        end;
    end;
    exit(top>0);
end;

function match(): int;
var i: int;
begin
	fillchar(mx,sizeof(mx),0);
    fillchar(my,sizeof(my),0);
	while bfs() do begin
    	for i:=1 to n do if mx[i]=0 then dfs(i);
    end;
    match:=0;
    for i:=1 to n do if mx[i]<>0 then inc(match);
end;

function try(i: int): int;
var u,j: int;
begin	
	if ok[i]<>0 then exit(ok[i]);
	p[i]:=1;
	for u:=1 to 2 do begin
    	j:=a[i,u];
        if j=0 then continue;
        if my[j]=0 then begin
            ok[i]:=1;
            p[i]:=0;
            exit(ok[i]);
        end;
        if (p[my[j]]<>1)and(try(my[j])=1) then begin
        	ok[i]:=1;
            p[i]:=0;
            exit(ok[i]);
        end;
    end;	
    p[i]:=0;
    ok[i]:=-1;
    exit(ok[i]);
end;

procedure main();
var i,j: int;
	kq,x: int64;
begin
	fillchar(p,sizeof(p),0);
	fillchar(a,sizeof(a),0);
    fillchar(ok,sizeof(ok),0);
	readln(n);
    for i:=1 to n do readln(a[i,1],a[i,2]);
    n:=n+1;
    if match()<>n-1 then begin	
    	writeln(0);
        exit();
    end;
    for i:=1 to n-1 do try(i);
    kq:=n-1;
    x:=1;
    for i:=1 to n do if ok[i]=1 then begin
    	kq:=kq+int64(n-1);
        x:=x+1;
    end;
    kq:=kq-x*(x-1) div 2;
    writeln(kq);
end;

begin
main();
end.
