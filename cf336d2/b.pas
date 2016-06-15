type int=longint;
var n,m: int;
	a,b: array[0..200000] of int64;

procedure main();
var i: int;
	kq: int64;
    s: ansistring;
begin
	readln(s);
    a[0]:=0;
    n:=length(s);
    for i:=1 to length(s) do if (s[i]='0')or(s[i]='1') then
    	a[i]:=a[i-1]+int64(s[i]='1');
    readln(s);
    b[0]:=0;
    m:=length(s);
    for i:=1 to length(s) do if (s[i]='0')or(s[i]='1') then
    	b[i]:=b[i-1]+int64(s[i]='1');
    kq:=0;
    for i:=1 to n do if a[i]<>a[i-1] then begin
    	kq:=kq+(m-n+1-b[m-n+i]+b[i-1]);
    end else begin
    	kq:=kq+(b[m-n+i]-b[i-1]);
    end;
    writeln(kq);
end;

begin
main();
end.