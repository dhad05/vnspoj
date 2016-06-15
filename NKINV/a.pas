type int=longint;
const max=60000;
var n: int;
	a: array[1..60000] of int;
	f: array[1..60000] of int64;

procedure up(i: int);
begin
	while i>=1 do begin
    	inc(f[i]);
        i:=i-(i and(-i));
    end;
end;
function get(i: int): int64;
begin
	get:=0;
    while i<=max do begin
    	get:=get+f[i];
        i:=i+(i and(-i));
    end;
end;

procedure main();
var i: int;
	kq: int64;
begin
	readln(n);
    for i:=1 to n do readln(a[i]);
    fillchar(f,sizeof(f),0); 
    kq:=0;
    for i:=1 to n do begin
    	kq:=kq+get(a[i]+1);
        up(a[i]);
    end;
    writeln(kq);
end;

begin
main();
end.