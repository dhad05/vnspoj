type int=longint;
var n,m: int;
	u,v,cha: array[1..10000] of int;
    w: array[1..10000] of int64;

procedure qsort();
	procedure swap(var a,b: int);
    var t: int;
    begin
    	t:=a; a:=b; b:=t;
    end;
    procedure swap(var a,b: int64);
    var t: int64;
    begin
		t:=a; a:=b; b:=t;
    end;
	procedure sort(l,r: int);
    var i,j: int;
    	x: int64;
    begin	
    	i:=l; j:=r;
        x:=w[l+random(r-l+1)];
        while i<=j do begin
        	while w[i]<x do inc(i);
            while w[j]>x do dec(j);
            if i<=j then begin
            	swap(u[i],u[j]);
                swap(v[i],v[j]);
                swap(w[i],w[j]);
            	inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,m);
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
    cha[v]:=u; 
    exit(true);
end;

procedure main();
var i: int;
	kq: int64;
begin
	readln(n,m);
    for i:=1 to m do read(u[i],v[i],w[i]);
    qsort();
    kq:=0;
    for i:=1 to n do cha[i]:=i;
    for i:=1 to m do if union(u[i],v[i]) then kq:=w[i];
    writeln(kq);
end;

begin
randomize();
main();
end.