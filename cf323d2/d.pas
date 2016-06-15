uses math;
type int=longint;
var a: array[1..100] of int;
	f: array[1..300] of int;
    n: int;

function get(i: int): int;
var kq: int;
begin
	kq:=-1;
	while i>=1 do begin
    	kq:=max(kq,f[i]);
        i:=i-(i and (-i));
    end;
    exit(kq);
end;

function up(i,k: int): int;
begin
	while i<=300 do begin
    	f[i]:=max(f[i],k);
        i:=i+(i and (-i));
    end;
	exit(k);
end;

function count(k: int): int;
var i,kq: int;
begin
	kq:=0;
	for i:=1 to n do if a[i]=k then inc(kq);
    exit(kq);
end;

procedure main();
var t,i: int;
	kq,this,curr: int;
    athis,maxa: int;
    m: int;
begin
	fillchar(f,sizeof(f),0);
	readln(n,t);
    for i:=1 to n do read(a[i]);
    maxa:=0;
    for i:=1 to n do maxa:=max(maxa,a[i]);
    kq:=-1;
    m:=0;
    while t>0 do begin
    	dec(t);
        inc(m);
        this:=-1;
        for i:=1 to n do begin
        	curr:=up(a[i],get(a[i])+1);
            if curr>this then begin
            	this:=curr;
                athis:=a[i];
            end else if curr=this then begin
            	athis:=min(athis,a[i]);
            end;
            kq:=max(kq,curr+count(a[i])*t);
        end;
        if m=n+1 then break;
    end;
    writeln(kq);
end;

begin
main();
end.
