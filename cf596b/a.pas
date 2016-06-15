type int=longint;
var n,i,j: int;
	kq: int64;
    a: array[1..200000] of int;

begin
	readln(n);
    for i:=1 to n do read(a[i]);
    j:=1;
	if a[1]>0 then kq:=a[1]
    else kq:=-a[1]; 
    for i:=2 to n+1 do begin
    	if (i=n+1)or(a[i-1]>a[i]) then begin
        	if j>1 then kq:=kq+a[j-1]-a[j];
        	kq:=kq+a[i-1]-a[j];
            j:=i;
        end;
    end;
    writeln(kq);
end.