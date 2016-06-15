uses math;
type int=longint;
	 link=^node;
     node=record
     	d,c: int;
        next: link;
     end;
     mang=array[1..1000] of int;
const inf=2100000000;
var n: int;
	ke: array[1..1000] of link;
    a,b: array[1..1000] of mang;
    kq,d,trc: mang;
var m: int;
	heap,vt: mang;

function get(): int;
var i,j,tmp: int;
begin
	get:=heap[1];
    heap[1]:=heap[m];
    vt[heap[1]]:=1;
    dec(m);
    i:=1;
    while i*2<=m do begin
  		j:=i*2;
        if (j<m)and(d[heap[j]]>d[heap[j+1]]) then j:=j+1;
        if d[heap[i]]<=d[heap[j]] then break;
        vt[heap[i]]:=j; vt[heap[j]]:=i;
        tmp:=heap[i]; heap[i]:=heap[j]; heap[j]:=tmp;
        i:=j;	
    end;
end;

procedure upheap(i: int);
var j,tmp: int;
begin
	while i>1 do begin
    	j:=i div 2;
        if d[heap[j]]<=d[heap[i]] then break;
        vt[heap[i]]:=j; vt[heap[j]]:=i;
        tmp:=heap[i]; heap[i]:=heap[j]; heap[j]:=tmp;
        i:=j;
    end;
end;

procedure push(u: int);
begin
	inc(m);
    heap[m]:=u;
    vt[u]:=m;
    upheap(m);
end;

procedure xl(s: int);
var u,v: int;
	t: link;
	procedure xet(u: int);
    var v,c: int;
    begin
    	t:=ke[u];
        while t<>nil do begin
        	v:=t^.d; c:=t^.c; t:=t^.next;
            if d[u]+c>=kq[s] then continue;
            if v=s then begin
            	kq[s]:=min(kq[s],d[u]+c);
            end;
            if a[v,s]<>inf then begin
            	kq[s]:=min(kq[s],d[u]+a[v,s]+c);	
            end;// else
            if d[v]=inf then begin
                d[v]:=d[u]+c;
                trc[v]:=u;
                push(v);
            end else if d[v]>d[u]+c then begin
            	d[v]:=d[u]+c;
                trc[v]:=u;
                upheap(vt[v]);
            end;
        end;
    end;
begin
	m:=0;
    d:=a[s];
    for u:=1 to n do trc[u]:=0;
    for u:=1 to n do if d[u]<>inf then xet(u);
    while m>0 do begin
    	u:=get();
        a[s,u]:=d[u];
        if d[u]>=kq[s] then break;
        v:=trc[u];
        while (v<>0)and(v<>s) do begin
        	a[v,u]:=min(a[v,u],d[u]-d[v]);
        	v:=trc[v];
        end;
//        if a[u,s]<>inf then kq[s]:=min(kq[s],a[u,s]+a[s,u])
        xet(u);
    end;
    if kq[s]=inf then kq[s]:=-1;
end;

procedure main();
var T: int;
	r: link;
    m,u,v,i,j,c: int;
begin
	readln(T);
    for T:=T downto 1 do begin
    	readln(n,m);
        for i:=1 to n do ke[i]:=nil;
        for i:=1 to m do begin
        	readln(u,v,c);
            new(r);
            r^.d:=v;
            r^.c:=c;
            r^.next:=ke[u];
            ke[u]:=r;
        end;
        for i:=1 to n do begin
        	for j:=1 to n do a[i,j]:=inf;
            a[i,i]:=0;
            kq[i]:=inf;
        end;
        for i:=1 to n do xl(i);
        for i:=1 to n do writeln(kq[i]);
    end;
end;

begin
main();
end.


