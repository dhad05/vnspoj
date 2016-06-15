type int=longint;
	 pack=record u,v,c: int; end;
var n,m: int;
	cha,rank: array[1..10000] of int;
    c: array[1..15000] of pack;

procedure qsort();
var x,tmp: pack;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=c[l+random(r-l+1)];
        while i<=j do begin
        	while c[i].c<x.c do inc(i);
            while c[j].c>x.c do dec(j);
            if i<=j then begin
            	tmp:=c[i];c[i]:=c[j];c[j]:=tmp;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,m);
end;

function find(x: int): int;
begin
	if cha[x]<>x then cha[x]:=find(cha[x]);
    exit(cha[x]);
end;
function union(x,y: int): boolean;
begin
	x:=find(x);
    y:=find(y);
    if x=y then exit(false);
    if rank[x]=rank[y] then inc(rank[x]);
    if rank[x]>rank[y] then cha[y]:=x
    else cha[x]:=y;
    exit(true);
end;

procedure main();
var i: int;
	kq: int;
begin
	readln(n,m);
    for i:=1 to n do begin
    	cha[i]:=i;
        rank[i]:=0;
    end;
    for i:=1 to m do with c[i] do readln(u,v,c);
    qsort();
    kq:=0;
    for i:=1 to m do with c[i] do begin
    	if union(u,v) then kq:=kq+c;
    end;
    writeln(kq);
end;

begin
randomize();
main();
end.