type int=longint;
	 mang=array[1..500000] of int;
const inf=2100000000;
var h: int;
	a,b: mang;

procedure push(var a: mang; i: int);
begin
	while i>0 do begin
    	inc(a[i]);
    	i:=i-(i and(-i));
    end;
end;

function get(var a: mang; i: int): int;
var kq: int;
begin
	kq:=0;
	while i<=h do begin
    	kq:=kq+a[i];
    	i:=i+(i and (-i));
    end;
    exit(kq);
end;

procedure main();
var n,i,x,this,kq,numkq: int;
begin
	fillchar(a,sizeof(a),0);
    fillchar(b,sizeof(b),0);
	readln(n,h);
    for i:=1 to n do begin
    	readln(x);
        if i mod 2=1 then push(a,x)
        else push(b,x);
    end;

    kq:=inf;
    numkq:=0;
    for i:=1 to h do begin
    	this:=get(a,i)+get(b,h-i+1);
        if this=kq then inc(numkq)
        else if this<kq then begin
        	kq:=this;
            numkq:=1;
        end;
    end;
    writeln(kq,' ',numkq);
end;

begin
main();
end.