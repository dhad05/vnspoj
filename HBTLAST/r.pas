var j,i,n,k: longint;

begin
randomize;
writeln(10);
for j:=1 to 10 do begin
n:=100000;
k:=7;
writeln(n,' ',k);
for i:=1 to n do write(chr(ord('a')+random(k)+1));
writeln;
end;
end.
