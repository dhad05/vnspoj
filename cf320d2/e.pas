type int=longint;
var n,m: int;
	s,a: array[0..100000] of char;
    b: array[0..100000] of int;

procedure main();
var i: int;
	n1: int;
    kq: int64;
begin
	readln(n,m);
    s[0]:='A';
    for i:=1 to n do read(s[i]);
    n1:=0;
    for i:=1 to n do begin
    	if s[i]=s[i-1] then begin
        	inc(b[n1]);
        end else begin
        	inc(n1);
            a[n1]:=s[i];
            b[n1]:=1;
        end;
    end;
    kq:=0;
    for i:=1 to n1 do begin
    	kq:=kq+(m-1)*(n)
    end;
    writeln(kq);
end;

begin
main();
end.