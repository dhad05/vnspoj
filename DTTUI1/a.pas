uses math;
type int=longint;
var n: int;
	z,cl,kq,this,curr: int64;
    a,b: array[1..40] of int64;

procedure dq(i: int);
begin
    if curr>z then exit();
    kq:=max(kq,this);
	if i>n then exit();
    if this+cl<=kq then exit();
    cl:=cl-b[i];
    this:=this+b[i];
    curr:=curr+a[i];
    dq(i+1);
    this:=this-b[i];
    curr:=curr-a[i];
    dq(i+1);
    cl:=cl+b[i];
end;

procedure main();
var i,j: int;
	tmp: int64;
begin
	readln(n,z);
    for i:=1 to n do readln(a[i],b[i]);
    for i:=1 to n do for j:=1 to n-1 do if b[j]<b[j+1] then begin
    	tmp:=a[j]; a[j]:=a[j+1]; a[j+1]:=tmp;
        tmp:=b[j]; b[j]:=b[j+1]; b[j+1]:=tmp;
    end;
    cl:=0;
    for i:=1 to n do cl:=cl+b[i];
    kq:=0;
    this:=0;
    curr:=0;
    dq(1);
    writeln(kq);
end;

begin
main();
end.