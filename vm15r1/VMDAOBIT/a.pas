var a,b: array[1..100, 1..100] of integer;
	m,n,i,j,u,v,c: integer;

begin
readln(m, n);
for i:=1 to m do begin
	for j:=1 to n do read(a[i,j]);
    readln();
end;

fillchar(b, sizeof(b), 0);
for i:=1 to m do for j:=1 to n do begin
	c:=a[i,j];
    for u:=i downto i-2 do for v:=j downto j-2 do begin
    	if (1<=u)and(1<=v)and(u<=m-2)and(v<=n-2) then begin
        	c:=c+b[u,v];
        end;
    end;
    if (1<=i)and(1<=j)and(i<=m-2)and(j<=n-2) then b[i,j]:=c mod 2
    else if c mod 2 <> 0 then begin
    	writeln(-1);
        halt;
    end;
end;
c:=0;
for i:=1 to n do for j:=1 to n do if b[i,j]<>0 then c:=c+1;
writeln(c);
for i:=1 to n do for j:=1 to n do if b[i,j]<>0 then writeln(i,' ', j);
end.
