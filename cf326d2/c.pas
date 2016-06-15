type int=longint;
const maxX=1000032;
var n: int;
	a: array[0..maxX] of int;

function log2(x: int): int;
var kq: int;
begin
	kq:=0;
    while x>1 do begin
    	x:=x div 2;
        inc(kq);
    end;
    exit(kq);
end;

procedure main();
var i,x: int;
	kq: int;
begin
	readln(n);
    fillchar(a,sizeof(a),0);
    for i:=1 to n do begin
    	read(x);
        inc(a[x]);
    end;

    for i:=0 to maxX do if a[i]>0 then begin
    	x:=a[i];
        a[i]:=0;
        while x>0 do begin
        	inc(a[i+log2(x and(-x))]);
            x:=x-(x and(-x));
        end;
    end;
    kq:=0;
    for i:=0 to maxX do begin
    	kq:=kq+a[i];
    end;
    writeln(kq);
end;

begin
main();
end.