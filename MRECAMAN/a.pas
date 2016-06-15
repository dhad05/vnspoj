type int=longint;
var a,f: array[0..4000000] of int;
	n: int;

procedure init;
var i: int;
begin
	fillchar(f,sizeof(f),0);
    a[0]:=0;
    f[0]:=1;
    for i:=1 to 500000 do begin
    	if (a[i-1]-i>0)and(f[a[i-1]-i]=0) then a[i]:=a[i-1]-i
        else a[i]:=a[i-1]+i;
        f[a[i]]:=1;
    end;
end;

begin
init;
while not eof() do begin
	readln(n);
    if n>-1 then writeln(a[n])
    else break;
end;
end.