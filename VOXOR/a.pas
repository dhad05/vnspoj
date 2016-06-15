type int=longint;
	 link=^node;
     node=record
     	n: int;
     	c: array[0..1] of link;
     end;
     mang=array[1..32] of int;
var x: int;
	a: link;

function init(): link;
begin
	new(init);
    init^.n:=0;
    init^.c[0]:=nil;
    init^.c[1]:=nil;
end;
function convert(z: int): mang;
var i: int;
begin
	for i:=32 downto 1 do begin
    	convert[i]:=z and 1;
        z:=z shr 1;
    end;
end;
procedure push(z: int);
var x: mang;
	i: int;
    cur: link;
begin
	x:=convert(z);
    cur:=a;
    for i:=2 to 32 do begin
		if cur^.c[x[i]]=nil then cur^.c[x[i]]:=init();
        cur:=cur^.c[x[i]];
        inc(cur^.n);	
    end;
end;
function find(k: int): int;
var cur: link;
	i: int;
    b: mang;
begin
	find:=0;
	cur:=a;
    b:=convert(x);
    for i:=2 to 32 do begin
    	if (cur^.c[b[i]]<>nil)and(cur^.c[b[i]]^.n>=k) then begin
        	cur:=cur^.c[b[i]];
        end else begin
        	if cur^.c[b[i]]<>nil then k:=k-cur^.c[b[i]]^.n;
        	cur:=cur^.c[1-b[i]];
            find:=1 shl (32-i)+find;
        end;
    end;
end;

procedure main();
var q,z,i,n: int;
	c: char;
begin	
	a:=init();
	readln(n,q);
    for i:=1 to n do begin
    	read(z);
        push(z);
    end;
    readln;
    for q:=q downto 1 do begin
    	read(c);
        if c='F' then begin
        	for z:=1 to 4 do read(c);
            readln(z);
            writeln(find(n-z+1));
        end else begin
        	for z:=1 to 3 do read(c);
            readln(z);
            x:=x xor z;
        end;
    end;
end;

begin
main();
end.