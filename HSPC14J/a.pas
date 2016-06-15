type int=longint;
var n,k: int;
	a: array[1..1000] of int;

function find(n,k: int): int;
var i,j: int;
begin
	for i:=2 to n do a[i]:=1;
    for i:=2 to n do if a[i]=1 then begin
    	j:=i;
        while j<=n do begin
        	k:=k-a[j];
            if k=0 then exit(j);
        	a[j]:=0;
            j:=j+i;
        end;
    end;
end;

begin
while not seekeof do begin
	readln(n,k);
    writeln(find(n,k));
end;
end.