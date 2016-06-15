type int=longint;
var m: int;
	heap,a: array[1..15000] of int;

procedure push(x: int);
var i,j,tmp: int;
begin
	if m>=15000 then exit();
	inc(m);
    heap[m]:=x;
    i:=m;
    while i>1 do begin
    	j:=i div 2;
        if heap[j]>=heap[i] then break;
        tmp:=heap[i];heap[i]:=heap[j];heap[j]:=tmp;
        i:=j;
    end;
end;

procedure get();
var i,j,tmp: int;
begin
	if m<=0 then exit();
    heap[1]:=heap[m];
    dec(m);
    i:=1;
    while i*2<=m do begin
    	j:=i*2;
        if (j<m)and(heap[j+1]>heap[j]) then j:=j+1;
        if heap[i]>=heap[j] then break;
        tmp:=heap[i];heap[i]:=heap[j];heap[j]:=tmp;
        i:=j;
    end;
end;

function xl1(): int;
var kq: int;
begin
	if m<=0 then exit(0);
    kq:=heap[1];
    while (m>0)and(heap[1]=kq) do get();
    exit(kq);
end;

procedure main();
var i,n,d: int;
	c: char;
begin
	m:=0;
	while not seekeof() do begin
    	read(c);
        if (c='-') then xl1();
        if (c='+') then begin
        	read(d);
            push(d);
        end;
        readln();
    end;
    n:=0;
    while m>0 do begin
    	inc(n);
        a[n]:=xl1();
    end;
    writeln(n);
    for i:=1 to n do writeln(a[i]);
end;

begin
main();
end.