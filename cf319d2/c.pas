type int=longint;
var n,i,j,kq: int;
	a,b: array[1..2000] of boolean;

begin
readln(n);
for i:=2 to n do begin
	a[i]:=true;
    b[i]:=false;
end;
for i:=2 to n do if a[i] then begin
	j:=i;
    while j<=n do begin
    	a[j]:=false;
        j:=j+i;
    end;
    j:=i;
    while j<=n do begin
    	b[j]:=true;
        j:=j*i;
    end;
end;
kq:=0; 
for i:=2 to n do kq:=kq+int(b[i]);
writeln(kq);
for i:=2 to n do if b[i] then write(i,' ');
writeln;
end.