uses math;
var i,j,imax,jmax,m,n: longint;
	a,b: array[1..2000] of char;
    x,y: array[1..2000] of longint;
    f: array[0..2000, 0..2000] of longint;
    c: char;
    kq: longint;

begin
n:=0;
m:=0;
while not seekeoln do begin
	read(c);
    if (c<='z')and(c>='a') then begin
    	inc(n);
        a[n]:=c;
        x[n]:=0;
    end else begin
    	x[n]:=x[n]*10 + ord(c)-48;
    end;
end;
readln;
while not seekeoln do begin
	read(c);
    if (c<='z')and(c>='a') then begin
    	inc(m);
        b[m]:=c;
        y[m]:=0;
    end else begin
    	y[m]:=y[m]*10 + ord(c)-48;
    end;
end;
fillchar(f, sizeof(f), 0);
for i:=1 to n do begin
	for j:=1 to m do begin
    	if a[i]=b[j] then f[i,j]:=f[i-1,j-1]+min(x[i], y[j])
        else f[i,j]:=max(f[i-1,j], f[i,j-1]);
    end;
end;
writeln(f[n,m]);


{kq:=0;
i:=n;
j:=m;
while (i>0)and(j>0) do begin
	if a[i]=b[j] then begin
    	kq:=kq+min(x[i], y[j]);
        i:=i-1;
        j:=j-1;
    end else if f[i,j]=f[i-1, j] then i:=i-1
    else if f[i,j]=f[i,j-1] then j:=j-1;
end;
writeln(kq);                                               }

fillchar(f, sizeof(f), 0);
for i:=1 to n do begin
	for j:=1 to m do begin
    	if a[i]=b[j] then begin
        	f[i,j]:=f[i-1,j-1]+1;
            imax:=i;
            jmax:=j;
        end else f[i,j]:=0;
    end;
end;
kq:=0;
i:=imax;
j:=jmax;
while (i>0)and(j>0)and(a[i]=b[j]) do begin
	kq:=kq+min(x[i], y[j]);
    i:=i-1;
    j:=j-1;
end;
writeln(kq);
end.