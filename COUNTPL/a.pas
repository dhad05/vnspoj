uses math;
type int=longint;
const inf=2100000000;
var s: string;
	n,i,j: int;
    f: array[0..256] of int;
    a: array[1..255,1..255] of int;

begin
readln(s);
n:=length(s);
for i:=1 to n do for j:=1 to n do a[i,j]:=inf;
for i:=1 to n do begin
	a[i,i]:=0;
	for j:=i+1 to n do begin
    	if s[j]=s[2*i-j] then a[j,i*2-j]:=0
        else break;
    end;
    if i<n then
    if s[i]=s[i+1] then begin
    	for j:=i+2 to n do begin
    		if s[j]=s[i*2-j+1] then a[j,i*2-j+1]:=0
        	else break;
   		end;
        a[i+1,i]:=0;
    end;
end;
f[0]:=0;
for i:=1 to n do begin
	f[i]:=inf;
	for j:=i downto 1 do begin
    	f[i]:=min(f[i],f[j-1]+a[i,j]);
    end;
    f[i]:=f[i]+1;
end;
writeln(f[n]);
end.