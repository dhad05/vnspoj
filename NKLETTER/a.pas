var m,n,i: longint;
    sb,se: string;

function con(s: string; i,j: longint): string;
var k: longint;
begin
    con:='';
    for k:=i to j do con:=con+s[k];
end;

begin
readln(sb);
readln(se);
n:=length(sb);
m:=length(se);
for i:=1 to n do begin
    if con(sb,i,n)=con(se,1,n-i+1) then begin
        writeln(i-1+m);
        halt;
    end;
end;
writeln(n+m);
end.

