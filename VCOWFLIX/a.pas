uses math;
type int=longint;
var n,c: int;
	a: array[1..16] of int;
    kq,this: int;

procedure dq(i: int);
begin
	if this>c then exit();
	if i=n+1 then kq:=max(kq,this)
    else begin
    	dq(i+1);
        this:=this+a[i];
        dq(i+1);
        this:=this-a[i];
    end;
end;

procedure main();
var i: int;
begin
	readln(c,n);
    for i:=1 to n do readln(a[i]);
    kq:=0;
    this:=0;
    dq(1);
    writeln(kq);
end;

begin
main();
end.