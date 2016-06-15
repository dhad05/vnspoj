type int=longint;
var b: array[0..2000,0..2000] of boolean; 
	a: array[1..2000] of int;

function main(): string;
var m,n: int;
	i,j: int;
begin
readln(n,m);
if n>m then exit('YES');
for i:=1 to n do begin
	read(a[i]);
    a[i]:=a[i] mod m;
end;
for i:=0 to n do for j:=0 to m-1 do b[i,j]:=false;
for i:=1 to n do begin
	for j:=0 to m-1 do begin
    	b[i,j]:=(a[i]=j) or b[i-1,j] or b[i-1,(j-a[i]+m)mod m];
    end;
end;
if b[n,0] then exit('YES');
exit('NO');
end;

begin
writeln(main());
end.