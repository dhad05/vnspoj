var l,r,kq,i,j: longint;
	f: array[1..100000] of longint;

begin
readln(l,r);
for i:=1 to r do f[i]:=1;
kq:=0;
for i:=2 to r do begin
	if (i>=l)and(f[i]>i) then inc(kq);
	j:=i*2;
    while j<=r do begin
    	f[j]:=f[j]+i;
        j:=j+i;
    end;
end;
writeln(kq);
end.