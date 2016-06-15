uses math;
type int=longint;
const inf=2100000000;
var n: int;
	x,dup,f: array[0..2000] of int;
    c: array[1..2000,1..2000] of int;

function gcd(a,b: int): int;
var r: int;
begin
	while b>0 do begin
    	r:=a mod b;
        a:=b;
        b:=r;
    end;
    exit(a);
end;

procedure main();
var i,j: int;
	a,d,xmax: int;
begin
	readln(n);
    for i:=1 to n do read(x[i]);
    fillchar(c,sizeof(c),0);
    for i:=1 to n do begin
    	dup[i]:=n+1;
    	for j:=i+1 to n do if x[i]=x[j] then begin
        	dup[i]:=j;
            break;
        end;
    end;
    for i:=1 to n do begin
    	c[i,i]:=1;
        a:=x[i];
        xmax:=x[i];
        d:=0;
    	for j:=i-1 downto 1 do begin
        	if dup[j]<=i then break;
        	d:=gcd(d,abs(x[j]-x[i]));
            a:=min(a,x[j]);
            xmax:=max(xmax,x[j]);
            if (xmax-a)div d=i-j then c[i,j]:=1;
        end;
    end;
    f[0]:=0;
    for i:=1 to n do begin
    	f[i]:=inf;
    	for j:=i downto 1 do if c[i,j]=1 then begin
        	f[i]:=min(f[i],f[j-1]+1);
        end;
    end;
    writeln(f[n]);
end;

begin
main();
end.
