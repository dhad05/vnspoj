uses math;
type int=longint;
var m,n: int;
	a,b: array[1..1000] of int;
    f,g: array[-1..1000,-1..1000] of int;

procedure main();
var i,j: int;
begin
	readln(m,n);
    for i:=1 to m do readln(a[i]);
    for i:=1 to n do readln(b[i]);
    fillchar(f,sizeof(f),0);
    fillchar(g,sizeof(g),0);
    for i:=1 to m do for j:=1 to n do begin
    	if a[i]=b[j] then f[i,j]:=g[i-2,j-2]+1;
        g[i,j]:=max(f[i,j],max(g[i-1,j],g[i,j-1]));
    end;
    writeln(g[m,n]);
end;

begin
main();
end.