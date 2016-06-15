type int=longint;
	 pack=record u,v,t: int; end;
var m,n: int;
	c: array[1..100000] of pack;
    a,b: array[0..10000] of int;
    cha,rank: array[1..10000] of int;
    boo: array[1..100000] of int;

procedure reset();
var i: int;
begin
	for i:=1 to n do begin
    	cha[i]:=i;
        rank[i]:=0;
    end;
end;
function find(u: int): int;
begin
	if cha[u]<>u then cha[u]:=find(cha[u]);
    exit(cha[u]);
end;
function union(u,v: int): boolean;
begin
	u:=find(u);
    v:=find(v);
    if u=v then exit(false);
    if rank[u]>rank[v] then cha[v]:=u
    else if rank[v]>rank[u] then cha[u]:=v
    else begin
    	cha[v]:=u;
        rank[u]:=rank[u]+1;
    end;
    exit(true);
end;

procedure find(var x,y: int);
var i: int;
begin
	reset();
	for i:=1 to m do boo[i]:=0;

    y:=0;
    for i:=1 to m do with(c[i]) do begin
    	if (t=1)and(union(u,v)) then inc(y);
    end;
    for i:=1 to m do with(c[i]) do begin
    	if (t=2)and(union(u,v)) then boo[i]:=1;
    end;

    reset();
    x:=0;
    for i:=1 to m do with(c[i]) do if boo[i]=1 then begin
    	union(u,v);
        inc(x);
    end;
    for i:=1 to m do with(c[i]) do begin
    	if (t=2)and(union(u,v)) then inc(x);
    end;
    x:=n-1-x;
end;

procedure make(x,y: int);
var i,count: int;
begin
	reset();
    for i:=1 to m do boo[i]:=0;

    for i:=1 to m do with(c[i]) do begin
    	if (t=1) then union(u,v);
    end;
    for i:=1 to m do with(c[i]) do begin
    	if (t=2)and(union(u,v)) then begin
        	boo[i]:=1;
        end;
    end;
    reset();
    count:=0;
    for i:=1 to m do with(c[i]) do if boo[i]=1 then begin
    	union(u,v);
        inc(count);
    end;
    if count<y then for i:=1 to m do with(c[i]) do begin
    	if (t=2)and(union(u,v)) then begin
        	boo[i]:=1;
        	inc(count);
            if count=y then break;
        end;
    end;
    for i:=1 to m do with(c[i]) do begin
    	if (t=1)and(union(u,v)) then begin	
        	boo[i]:=1;
        end;
    end;
end;

procedure xl();
var x,y,i,k: int;
begin
	find(x,y);
    k:=x;
    for i:=x+1 to y do begin
    	if a[k]+b[n-1-k]>a[i]+b[n-1-i] then k:=i;
    end;
    make(k,n-1-k);
	for i:=1 to m do if boo[i]=1 then write(i,' ');
    writeln;
end;

procedure main();
var t: int;
	i: int;
begin
	readln(t);
    while t>0 do begin
    	dec(t);
        readln(n,m);
        a[0]:=0;
        b[0]:=0;
        for i:=1 to n-1 do read(a[i]);
        readln;
        for i:=1 to n-1 do read(b[i]);
        readln;
        for i:=1 to m do with(c[i]) do readln(u,v,t);
        xl();
    end;
end;

begin
main();
end.
