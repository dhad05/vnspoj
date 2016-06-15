type int=longint;
var n,m,i: int;
	u,v,c: array[1..100000] of int;
var kq: int;
	cha,bac: array[1..100000] of int;

function find(u: int): int;
begin
	if cha[u]<>u then cha[u]:=find(cha[u]);
    exit(cha[u]);
end;
function join(u,v: int): boolean;
begin
	u:=find(u);
    v:=find(v);
    if u=v then exit(false);
	if bac[u]>bac[v] then cha[v]:=u
    else if bac[u]<bac[v] then cha[u]:=v
    else begin
    	cha[v]:=u;
        bac[u]:=bac[u]+1;
    end;
    exit(true);
end;

procedure qsort();
var x,t: int;
	procedure swap(var a,b: int);
    begin
    	t:=a;
        a:=b;
        b:=t;
    end;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=c[l+random(r-l+1)];
        while i<=j do begin
        	while c[i]>x do inc(i);
            while c[j]<x do dec(j);
            if i<=j then begin
            	swap(u[i],u[j]);
                swap(v[i],v[j]);
                swap(c[i],c[j]);
                inc(i);
                dec(j);	
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r); 
    end;
begin
	randomize();
    sort(1,m);
end;

begin
readln(n,m);
for i:=1 to m do readln(u[i],v[i],c[i]);
for i:=1 to n do begin
	cha[i]:=i;
    bac[i]:=0;
end;
qsort();
kq:=0;
for i:=1 to m do begin
	if not join(u[i],v[i]) then kq:=kq+c[i];
end;
writeln(kq);
end.