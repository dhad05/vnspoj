uses math;
var n,k,i,j: longint;
	a: array[1..1000] of longint;
    f: array[0..1000,0..49] of longint;  

begin
readln(n,k);
for i:=1 to n do begin
	read(a[i]);
    a[i]:=a[i] mod k;
end;
fillchar(f,sizeof(f),0);
for i:=0 to n do for j:=0 to k-1 do f[i,j]:=-10000;
for i:=0 to n do f[i,0]:=0;
for i:=1 to n do begin
	for j:=0 to k-1 do begin
    	f[i,j]:=max(f[i-1,j], f[i-1,(j-a[i]+k) mod k]+1);
    end;
end;
writeln(f[n,0]);
end.