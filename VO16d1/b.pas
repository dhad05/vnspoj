type int=longint;
var n: int;
	a: array[1..100,1..2] of int;
    free: array[1..100] of boolean;
    mx,my: array[1..100] of int;

function dfs(u: int): boolean;
var i,v: int;
begin
	free[u]:=false;
	for i:=1 to 2 do begin
    	v:=a[u,i];
     	if my[v]=0 then begin
        	my[v]:=u;
            mx[u]:=v;
        	exit(true);
        end;
        if (free[my[v]])and(dfs(my[v])) then begin
        	my[v]:=u;
            mx[u]:=v;
        	exit(true);        	
        end;
    end;
    exit(false);
end;

function match(): int;
var i: int;
begin
	fillchar(mx,sizeof(mx),0);
    fillchar(my,sizeof(my),0);
    for i:=1 to n do if mx[i]=0 then begin
    	fillchar(free,sizeof(free),true);
        dfs(i);
    end;
    match:=0;
    for i:=1 to n do if mx[i]<>0 then inc(match);
end;

procedure main();
var i,j: int;
	kq: int64;
begin
	readln(n);
    for i:=1 to n do readln(a[i,1],a[i,2]);
    n:=n+1;
    kq:=0;
	for i:=1 to n do for j:=i+1 to n do begin
    	a[n,1]:=i;
        a[n,2]:=j;
        if match()=n then inc(kq);
    end;
    writeln(kq); 
end;

begin
main();
end.
