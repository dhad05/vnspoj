uses math;
type int=longint;
const inf=2100000000;
var d,t: array[0..300000] of int;
	m: array[1..2,0..300000] of int;
    n: int;

procedure qsort(n: int);
var z,x: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;
        j:=r;
        x:=d[l+random(r-l+1)];
        while i<=j do begin
        	while d[i]<x do inc(i);
            while d[j]>x do dec(j);
            if i<=j then begin
            	z:=d[i];d[i]:=d[j];d[j]:=z;
                z:=t[i];t[i]:=t[j];t[j]:=z;
                inc(i);
                dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	randomize();
	sort(1,n);
end;

function bs(t,k: int): int;
var l,r,i: int;
begin
	l:=1;
    r:=n;
    while l<=r do begin
    	i:=(l+r)div 2;
        if m[t,i]<=k then l:=i+1
        else r:=i-1;
    end;
    exit(r);
end;

function main(): int;
var u,v,i,j: int;
begin
	fillchar(d,sizeof(d),0);
    fillchar(t,sizeof(t),0);
    fillchar(m,sizeof(m),0);
	readln(n,u,v);
    for i:=1 to n do readln(d[i],t[i]);
    qsort(n);
    for i:=1 to n do begin	
    	m[1,i]:=m[1,i-1]+int(t[i]=1);
        m[2,i]:=m[2,i-1]+int(t[i]=2);
    end;
    if (m[1,n]<u)or(m[2,n]<v) then exit(-1);
    main:=inf;
	for i:=1 to n do begin
    	if (m[1,i]<u)or(m[2,i]<v) then continue;
    	j:=min(bs(1,m[1,i]-u),bs(2,m[2,i]-v));
        main:=min(main, d[i]-d[j+1]);
    end;
end;

begin
writeln(main());
end.