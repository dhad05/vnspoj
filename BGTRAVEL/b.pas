uses math;
type int=longint;
	 pack=record u,v: int; end;
     link=^node;
     node=record
     	d,id: int;
        next: link;
     end;
var n,m,k: int;
	nn: int64;
	c: array[1..200000] of pack;
    ke: array[1..100000] of link;
    exist: array[1..200000] of boolean;
    num,a,p,trc,d: array[1..200000] of int;

procedure swap(var u,v: int);
var tmp: int;
begin
	tmp:=u;
    u:=v;
    v:=tmp;
end;

procedure qsortc();
var i,m1: int;
	procedure sort(l,r: int);
    var i,j: int;
    	tmp,x: pack;
    begin
    	i:=l;j:=r;
        x:=c[l+random(r-l+1)];
        while i<=j do begin
        	while (c[i].u<x.u)or((c[i].u=x.u)and(c[i].v<x.v)) do inc(i);
			while (c[j].u>x.u)or((c[j].u=x.u)and(c[j].v>x.v)) do dec(j);
            if i<=j then begin
            	tmp:=c[i]; c[i]:=c[j]; c[j]:=tmp;
            	inc(i); dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	sort(1,m);
    m1:=1;
    num[m1]:=1;
    for i:=2 to m do if (c[i].u<>c[i-1].u)or(c[i].v<>c[i-1].v) then begin
    	inc(m1);
        c[m1]:=c[i];
        num[m1]:=1;	
    end else inc(num[m1]);
    m:=m1;
end;

function calc(x,k: int): int64;
var this: int64;
	
	procedure dfs(u: int);
    var v: int;
    	t: link;
    begin
    	if d[u]>=k then exit();
    	this:=this+num[u];
        t:=ke[u];
        while t<>nil do begin
        	v:=t^.d; t:=t^.next;
            if v=trc[u] then continue;
            trc[v]:=u;
            d[v]:=d[u]+1;
    		dfs(v);
        end;
    end;
begin
	trc[x]:=0;
	d[x]:=0;
    this:=0;
    dfs(x);
    exit((nn-this)*int64(num[x]));
end;

procedure main();
var t: link;
	i,top,u,v: int;
    kq: int64;
    procedure cau(u: int);
    var v,id: int;
    	t: link;
    begin
    	inc(top);
        a[u]:=top;
        p[u]:=top;
        t:=ke[u];
        while t<>nil do begin
        	v:=t^.d; id:=t^.id; t:=t^.next;
            if a[v]=0 then begin
            	trc[v]:=u;
            	cau(v);
                if (p[v]>a[u])and(num[id]=1) then exist[id]:=false;
                p[u]:=min(p[u],p[v]);
            end else if trc[u]<>v then begin
            	p[u]:=min(p[u],a[v]);
            end;
        end;
    end;
    procedure dfs(u: int);
    var v,id: int;
    	t: link;
    begin
    	p[u]:=top;
        inc(num[top]);
        t:=ke[u];
        while t<>nil do begin
        	v:=t^.d; id:=t^.id; t:=t^.next;
            if not exist[id] then continue;
            if p[v]=0 then dfs(v);
        end;
    end;
begin
	readln(n,m,k);
    for i:=1 to m do readln(c[i].u,c[i].v);
    for i:=1 to m do if c[i].u>c[i].v then swap(c[i].u,c[i].v);
    qsortc();
    for i:=1 to n do ke[i]:=nil;
    for i:=1 to m do with c[i] do begin
    	new(t);
        t^.d:=u;
        t^.next:=ke[v];
        t^.id:=i;
        ke[v]:=t;
        new(t);
        t^.d:=v;
        t^.next:=ke[u];
        t^.id:=i;
        ke[u]:=t;
    end;
    top:=0;
    fillchar(a,sizeof(a),0);
    fillchar(exist,sizeof(exist),true);
    cau(1);  writeln(top,' ',n);
    top:=0;
    fillchar(num,sizeof(num),0);
    fillchar(p,sizeof(p),0);
    for i:=1 to n do if p[i]=0 then begin
    	inc(top);
        dfs(i);
    end;
    nn:=n;
    n:=top;
    top:=0;
    for i:=1 to m do if not exist[i] then begin
    	inc(top);
        c[top]:=c[i];
    end;
    m:=top;
    fillchar(exist,sizeof(exist),true);
    for i:=1 to n do ke[i]:=nil;
    for i:=1 to m do with c[i] do begin
    	u:=p[u]; v:=p[v];
        if u>v then swap(u,v);
    	new(t);
        t^.d:=u;
        t^.next:=ke[v];
        t^.id:=i;
        ke[v]:=t;
        new(t);
        t^.d:=v;
        t^.next:=ke[u];
        t^.id:=i;               	
        ke[u]:=t;
    end;
    kq:=0;
    for i:=1 to n do if a[i]<>0 then kq:=kq+calc(i,k);
    writeln(kq div 2);
end;

begin
randomize();
main();
end.
