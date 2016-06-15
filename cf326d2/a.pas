uses math;
type int=longint;
var a,b: array[1..100000] of int64;
	n: int; 

procedure main();
var i: int;
	kq, bmin: int64;
begin
	readln(n);
    for i:=1 to n do readln(a[i],b[i]);

    kq:=0;
    bmin:=1000;
    for i:=1 to n do begin
    	bmin:=min(bmin,b[i]);
        kq:=kq+a[i]*bmin;
    end;
    writeln(kq);
end;

begin
main();
end.