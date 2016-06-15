uses math;
type int=longint;
const inf=10000000;
var m,n,i,j,tmp: int;
	a: array[1..100] of int;

begin
readln(n);
readln(m);
for i:=1 to n do readln(a[i]);
for i:=1 to n do for j:=1 to n-1 do begin
	if a[j]<a[j+1] then begin
    	tmp:=a[j];
        a[j]:=a[j+1];
        a[j+1]:=tmp;
    end;
end;
tmp:=0;
for i:=1 to m do begin
	tmp:=tmp+a[i];
    if tmp>=m then begin
    	writeln(i);
        break;
    end;
end;
end.