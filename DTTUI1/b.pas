uses math;
type int=longint;
	 mang=array[1..1050000] of int64;
const inf=10000000000000;
var n,m,m1: int;
    a,b: array[1..40] of int64;
    c,d,e,f,tmp,tmp1: mang;

function gen(var c,d: mang; l,r: int; z: int64): int;
var i,j,m,m1,x,y: int;
begin
	m:=1;
	c[m]:=0;
    d[m]:=0;
	for i:=l to r do begin
    	m1:=m;
        for j:=1 to m1 do begin
        	if c[j]+a[i]>z then continue;
        	inc(m);
            c[m]:=c[j]+a[i];
            d[m]:=d[j]+b[i];
        end;
        x:=1; y:=m1+1;
        j:=1;
        while (x<=m1)or(y<=m) do begin
        	if (y>m)or((x<=m1)and(c[x]<c[y])) then begin
            	tmp[j]:=c[x];
                tmp1[j]:=d[x];
                inc(x);
            end else begin
            	tmp[j]:=c[y];
                tmp1[j]:=d[y];
                inc(y);
            end;
            inc(j);
        end;
        for j:=1 to m do begin
        	c[j]:=tmp[j];
            d[j]:=tmp1[j];
        end;
    end;
    m1:=1;
    for i:=2 to m do if c[i]<>c[i-1] then begin
    	inc(m1);
        c[m1]:=c[i];
        d[m1]:=d[i];
    end else d[m1]:=max(d[m1],d[i]);
    m:=m1;
    exit(m);
end;

procedure main();
var tmp,kq,z: int64;
    i,j: int;
begin
    readln(n,z);
	for i:=1 to n do readln(a[i],b[i]);
    m:=gen(c,d,1,n div 2,z);
    m1:=gen(e,f,n div 2+1,n,z);
    for i:=2 to m do d[i]:=max(d[i],d[i-1]);
    j:=m;
    kq:=0;
    for i:=1 to m1 do begin
    	while c[j]+e[i]>z do dec(j);
        kq:=max(kq,d[j]+f[i]);
    end;
    writeln(kq);
end;

begin
main();
end.
