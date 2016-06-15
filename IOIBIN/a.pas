type int=longint;
const n=10000;
var cha,rank: array[1..n] of int;

function find(i: int): int;
begin
	if cha[i]<>i then cha[i]:=find(cha[i]);
    exit(cha[i]);
end;

procedure union(x,y: int);
begin
	x:=find(x);
    y:=find(y);
    if x=y then exit();
    if rank[x]>rank[y] then cha[y]:=x
    else if rank[x]<rank[y] then cha[x]:=y
    else begin
    	inc(rank[x]);
        cha[y]:=x;
    end;	
end;

procedure main();
var p,x,y,c: int;
begin
	for x:=1 to n do begin
    	cha[x]:=x;
        rank[x]:=0;
    end;
	readln(p);
    for p:=p downto 1 do begin
    	readln(x,y,c);
        if c=1 then union(x,y);
        if c=2 then writeln(int(find(x)=find(y)));
    end;
end;

begin
main();
end.