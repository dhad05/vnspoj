type int=longint;
var a, b: array[1..200000] of char;
	m, n: int;
    boo: int;
    co: int;

function ev(i,j,m: int): int;
var u: int;
	e: int;
begin co:=co+1; 
	e:=1;
//	if co mod 1000000=0 then writeln(co);
    u:=0;
{    while u<m do begin
    	if a[i+u]<>b[j+u] then begin
        	e:=0;
            break;
        end;
    	u:=u+1;
    end; }
    e:=0;

    if e=0 then begin
    	if m mod 2=0 then begin
        	m:=m div 2;
        	e:=(ev(i, j, m) and ev(i+m, j+m, m));
            e:=e or (ev(i, j+m, m) and ev(i+m, j, m));
        end;
    end;
    exit(e);
end;

begin
m:=0;
while not seekeoln() do begin
	inc(m);
    read(a[m]);
end;
readln;
n:=0;
while not seekeoln() do begin
	inc(n);
    read(b[n]);
end;
co:=0;
boo:=ev(1, 1, m);
if boo=1 then writeln('YES') else writeln('NO');
writeln(co);
end.
