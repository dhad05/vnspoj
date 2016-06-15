type int=longint;
var n,m: int;
	num: array['A'..'Z'] of int;
    x,b: array[1..9] of char;

function dem(n: int): int;
begin
	dem:=1;
    for n:=n downto 1 do dem:=dem*n;
end;

procedure xuat();
var i: int;
begin
	for i:=1 to n do write(x[i]);
    writeln;
end;

procedure try(i: int);
var j: int;
begin
	if i>n then begin
    	xuat();
        exit();
    end;
    for j:=1 to m do if num[b[j]]>0 then begin
    	dec(num[b[j]]);
        x[i]:=b[j];
        try(i+1);
        inc(num[b[j]]);
    end;
end;

procedure main();
var s: string;
	i: int;
    c: char;
    kq: int;
begin
readln(s);
n:=length(s);
fillchar(num,sizeof(num),0);
for i:=1 to n do inc(num[s[i]]);
for c:='A' to 'Z' do begin
	if num[c]>0 then begin
    	inc(m);
        b[m]:=c;
    end;
end;
kq:=dem(n);
for i:=1 to m do kq:=kq div dem(num[b[i]]);
writeln(kq);
try(1);
end;

begin
main();
end.