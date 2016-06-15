var i,n: longint;

begin
n:=100000;
randomize();
writeln(n);
for i:=1 to n do write(random(20)+1,' ');
end.
