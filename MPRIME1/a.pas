type int=longint;
var n,m: int;
	prime: array[1..11000] of boolean;
    a: array[0..2000] of int;
    num: array[0..7000000] of int;

procedure init();
var i,j: int;
begin
	fillchar(prime,sizeof(prime),true);
    fillchar(num,sizeof(num),0);
    num[0]:=1;
	m:=0;
	for i:=2 to 11000 do if prime[i] then begin
    	inc(m);
        a[m]:=a[m-1]+i;
        j:=i*i;
        while j<=11000 do begin
        	prime[j]:=false;
            j:=j+i;
        end;
        inc(num[a[m]]);
    end;
end;

function calc(n: int): int;
var i,kq: int;
begin
	kq:=0;
	for i:=1 to m do begin
    	if a[i]-n>=0 then inc(kq,num[a[i]-n]);
    end;
    exit(kq);
end;

begin
init();
while not eof() do begin
	readln(n);
    if n<>0 then writeln(calc(n))
    else break;
end;
end.