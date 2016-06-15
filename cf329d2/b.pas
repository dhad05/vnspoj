uses math;
type int=longint;
var n: int;
	k,b,f,g: array[1..100000] of int64;

procedure qsort();
var i,j: int;
	x,tmp: int64;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=g[l+random(r-l+1)];
        while i<=j do begin
        	while g[i]<x do inc(i);
            while g[j]>x do dec(j);
            if i<=j then begin
            	tmp:=g[i];g[i]:=g[j];g[j]:=tmp;
                tmp:=f[i];f[i]:=f[j];f[j]:=tmp;
            	inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,n);
end;

function main():string;
var i,j: int;
	x1,x2,maxf: int64;
begin
	readln(n);
    readln(x1,x2);
    for i:=1 to n do readln(k[i],b[i]);

    for i:=1 to n do begin
    	f[i]:=k[i]*x1+b[i];
        g[i]:=k[i]*x2+b[i];
    end;
    qsort();
    maxf:=low(int64);
    j:=1;
    for i:=2 to n do begin
    	if g[i]<>g[i-1] then begin
        	for j:=j to i-1 do maxf:=max(maxf,f[j]);
            j:=i;
        end;
        if maxf>f[i] then exit('YES');
    end;
    exit('NO');
end;

begin
randomize();
writeln(main());
end.
