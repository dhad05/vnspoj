uses math;
type int=longint;
const inf=1000000050;
var n: int;
	a: array[1..1000,1..1000] of int;

procedure main();
var T,i,j,k,u,v,m: int;
begin
	readln(T);
    for T:=T downto 1 do begin
		readln(n,m);
        for i:=1 to n do for j:=1 to n do a[i,j]:=inf;
        for i:=1 to m do begin
        	read(u,v);
            readln(a[u,v]);
        end;	
        for k:=1 to n do begin
        	for i:=1 to n do begin
            	for j:=1 to n do begin
        			a[i,j]:=min(a[i,j],a[i,k]+a[k,j]);        	
                end;
            end;
        end;
        for i:=1 to n do if a[i,i]=inf then a[i,i]:=-1;
        for i:=1 to n do writeln(a[i,i]);
    end;
end;

begin
main();
end.
