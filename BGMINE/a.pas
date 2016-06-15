uses math;
type int=longint;
var n: int;
	x,g,d: array[1..100000] of int64;
var m: int;
    f,sd,sg,dx: array[0..100000] of int64;

function find(k: int64): int;
var l,r,i: int;
begin
	l:=1;
    r:=m;
    while l<=r do begin
    	i:=(l+r) div 2;
        if dx[i]<=k then l:=i+1
        else r:=i-1;
    end;
    exit(r);
end;
function get(i: int): int64;
begin
	get:=high(int64);
    while i>0 do begin
    	get:=min(get,f[i]);
        i:=i-(i and(-i));
    end;
end;
procedure up(i: int;k: int64);
begin
	while i<=m do begin
    	f[i]:=min(f[i],k);
        i:=i+(i and(-i));
    end;
end;

procedure xl();
var i,j: int;
	kq: int64;
	procedure sort(l,r: int);
    var i,j: int;
    	x,tmp: int64;
    begin
    	i:=l; j:=r;
        x:=dx[l+random(r-l+1)];
        while i<=j do begin
        	while dx[i]<x do inc(i);
            while dx[j]>x do dec(j);
            if i<=j then begin
            	tmp:=dx[i];dx[i]:=dx[j];dx[j]:=tmp;
            	inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for i:=1 to n do begin
    	sd[i]:=sd[i-1]+d[i];
        sg[i]:=sg[i-1]+g[i];
    end;
    for i:=n downto 1 do begin
    	sd[i]:=sd[i-1];
        sg[i]:=sg[i-1];
    end;
    for i:=1 to n do dx[i]:=sd[i]-x[i];
    sort(1,n);
    m:=1;
    for i:=2 to n do if dx[i]<>dx[i-1] then begin
    	inc(m);
        dx[m]:=dx[i];
    end;
    for i:=1 to m do f[i]:=high(int64);
    kq:=0;
    for i:=1 to n do begin
        j:=find(sd[i]-x[i]+d[i]);
        if d[i]>0 then up(find(sd[i]-x[i]),sg[i]);
        if j>0 then kq:=max(kq,g[i]+sg[i]-get(j));
        if d[i]=0 then up(find(sd[i]-x[i]),sg[i]);
    end;
    writeln(kq);
end;



procedure qsort();
	procedure sort(l,r: int);
    var k,tmp: int64;
    	i,j: int;
    begin
    	i:=l; j:=r;
        k:=x[l+random(r-l+1)];
        while i<=j do begin
        	while x[i]<k do inc(i);
            while x[j]>k do dec(j);
            if i<=j then begin
            	tmp:=x[i];x[i]:=x[j];x[j]:=tmp;
                tmp:=g[i];g[i]:=g[j];g[j]:=tmp;
                tmp:=d[i];d[i]:=d[j];d[j]:=tmp;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,n);
end;

procedure main();
var i,j: int;
	rthis,gthis,kq: int64;
begin
	readln(n);
    for i:=1 to n do readln(x[i],g[i],d[i]);
	qsort();
{    kq:=0;
    for i:=1 to n do begin
    	rthis:=0;
        gthis:=0;
    	for j:=i downto 1 do begin
        	rthis:=rthis+d[j];
            gthis:=gthis+g[j];
            if (rthis>0)and(rthis>=x[i]-x[j]) then kq:=max(kq,gthis);
        end;
    end;
    writeln(kq);}
    xl();
end;

begin
randomize();
main();
end.