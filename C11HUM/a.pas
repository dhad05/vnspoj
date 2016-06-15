uses math;
type int=longint;
var n,k: int;
	b: array[1..100000] of int64;
    a,c,id: array[1..1000] of int64;

function getmin(): int64;
var i: int;
	kq: int64;
begin
	kq:=c[1];
    for i:=2 to k do kq:=min(kq,c[i]);
    exit(kq);
end;

procedure main();
var i,j: int;
	this: int64;
begin
	readln(k,n);
    fillchar(a,sizeof(a),0);
    for i:=1 to k do begin
    	read(j);
        inc(a[j]);
    end;
    k:=0;
    for i:=2 to 1000 do if a[i]>0 then begin
    	inc(k);
        a[k]:=i;
        c[k]:=i;
    end;
    for i:=1 to k do id[i]:=0;
    for i:=1 to n do begin
    	this:=getmin();
        b[i]:=this;
        for j:=1 to k do if c[j]=this then begin
        	inc(id[j]);
            c[j]:=a[j]*b[id[j]];
        end;
    end;
    writeln(b[n]);
end;

begin
main();
end.