uses math;
type int=longint;
	 pack=record l,r: int; end;
     mang=array[1..100000] of int;
     fuck=record
     	first,last: int;
        q: array[-100000..100000] of int;
        a: mang;
     end;
var n: int;
	vitri, a: array[1..100000] of int;
    qa, qd: fuck;

function get(var q: fuck): int;
begin
	exit(q.a[q.q[q.first]]);
end;

procedure head(var q: fuck; u,v: int);
var i: int;
begin with q do begin
	for i:=u downto max(v,1) do begin
    	if (first>last)or(a[i]>a[q[first]]) then begin
        	dec(first);
            q[first]:=i;
        end;
    end;
end end;

procedure push(var q: fuck; i: int);
begin with q do begin
	while (first<=last)and(a[i]>=a[q[last]]) do begin	
    	dec(last);
    end;
    inc(last);
    q[last]:=i;
end end;

procedure pop(var q: fuck; i: int);
begin with q do begin
	while (first<=last)and(q[first]<i) do inc(first);
end end;

function xl(i,u,v: int): int;
var kq,this,j,l,k: int;
begin
	with qa do begin
    	first:=1;
        last:=1;
        q[last]:=i;
    end;
    with qd do begin
    	first:=1;
        last:=1;
        q[last]:=i;
    end;
	kq:=1;
    l:=1;
    for j:=i+1 to v do begin
    	push(qa,j);
        push(qd,j);
    	if l>=a[j] then begin	
        	pop(qa,j-l+1);
            pop(qd,j-l+1);
        end else begin
        	head(qa,j-l,j-a[j]+1);
            head(qd,j-l,j-a[j]+1);
        	l:=a[j];
        end;
        k:=j-l+1;
        if (u<=k)and(k<=i)and(get(qa)=l)and(get(qd)<k)then begin
        	kq:=l;
        end;
    end;
    exit(kq);
end;

function calc(): int;
var this,i,kq: int;
begin
	fillchar(vitri,sizeof(vitri),0);
    for i:=1 to n do begin
    	qd.a[i]:=vitri[a[i]];
        vitri[a[i]]:=i;
        qa.a[i]:=a[i];
    end;
    this:=n+1;
    kq:=0;
    for i:=n downto 1 do if a[i]=1 then begin
    	kq:=max(kq,xl(i,qd.a[i]+1,this-1));
        this:=i;
    end;
    exit(kq);
end;

procedure main();
var i,j,tmp,kq: int;	
begin
	readln(n);
    for i:=1 to n do read(a[i]);
    kq:=calc();
    j:=n;
    for i:=1 to n div 2 do begin
    	tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
        dec(j);
    end;
    writeln(max(kq,calc()));
end;

begin
main();
end.
