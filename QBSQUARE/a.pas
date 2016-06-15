uses math;
type int=longint;
var a,w,h,f: array[0..1000,0..1000] of int;
	m,n,i,j,kq: int;

begin
readln(m,n);
for i:=1 to m do begin
	for j:=1 to n do read(a[i,j]);
    readln;
end;
for i:=1 to n do a[0,i]:=a[1,i];
for i:=1 to m do a[i,0]:=a[i,1];
for i:=1 to n do h[0,i]:=0;
for i:=1 to m do w[i,0]:=0;
for i:=1 to m do for j:=1 to n do begin
	h[i,j]:=1;
	if a[i,j]=a[i-1,j] then h[i,j]:=h[i-1,j]+1;
    w[i,j]:=1;
	if a[i,j]=a[i,j-1] then w[i,j]:=w[i,j-1]+1;
end;
kq:=1;
for i:=1 to m do for j:=1 to n do begin
	f[i,j]:=1;
    if (w[i,j]>1)and(h[i,j]>f[i,j-1])and(w[i-f[i,j-1],j]>f[i,j-1]) then begin
    	f[i,j]:=max(f[i,j],f[i,j-1]+1);
    end;
    if (h[i,j]>1)and(w[i,j]>f[i-1,j])and(h[i,j-f[i-1,j]]>f[i-1,j]) then begin
    	f[i,j]:=max(f[i,j],f[i-1,j]+1);
    end;
    if (a[i,j]=a[i-1,j-1])and(w[i,j]>f[i-1,j-1])and(h[i,j]>f[i-1,j-1]) then begin
    	f[i,j]:=max(f[i,j],f[i-1,j-1]+1);
    end;
    kq:=max(kq,f[i,j]);
end;

for i:=1 to m do begin
	for j:=1 to n do write(f[i,j],' ');
    writeln;
end;

writeln(kq);
end.