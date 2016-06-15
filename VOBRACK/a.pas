uses math;
type int=longint;
     pack=record
        n,m,x: int;
        a,b,c: array[1..1000] of int;
        l,s: array[0..5000000] of int;
     end;
const inf=2100000000;
var a,b: pack;
	l1,s1: array[0..5000000] of int;

procedure swap(var a,b: int);
var t: int;
begin
    t:=a;a:=b;b:=t;
end;

procedure xl(var a: pack);
var i,j,m1: int;
begin with a do begin
    x:=0;
    for i:=1 to n do x:=x+a[i];
    for i:=0 to x do l[i]:=-inf;
    for i:=1 to n do for j:=1 to n-1 do begin
        if b[j]<b[j+1] then begin
            swap(a[j],a[j+1]);
            swap(b[j],b[j+1]);
            swap(c[j],c[j+1]);
        end;
    end;
    m:=0;
    for i:=1 to n do begin
    	m1:=0;
		for j:=1 to m do if s[j]>=-b[i] then begin
            inc(m1);
            s1[m1]:=s[j]+a[i];
            l1[s1[m1]]:=l[s[j]]+c[i];
        end;
        if b[i]>=0 then begin
        	inc(m1);
        	s1[m1]:=a[i];
        	l1[s1[m1]]:=c[i];
        end;
        for j:=1 to m1 do begin	
        	if l[s1[j]]=-inf then begin
            	inc(m);
                s[m]:=s1[j];
                l[s1[j]]:=l1[s1[j]];
            end else l[s1[j]]:=max(l[s1[j]],l1[s1[j]]);
        end;
    end;
  //  for i:=1 to m do write(l[s[i]],' ');writeln;
end end;


procedure main();
var tmp,z,L,this,i: int;
    s: ansistring;
    kq: int;
begin
    readln(tmp);
    a.n:=0;
    b.n:=0;
    for tmp:=tmp downto 1 do begin
        readln(s);
        this:=0;
        L:=0;
        z:=inf;
        for i:=1 to length(s) do begin
            L:=L+1;
            if s[i]='(' then this:=this+1
            else if s[i]=')' then this:=this-1
            else L:=L-1;
            z:=min(z,this);
        end;
        if this>=0 then begin
            inc(a.n);
            a.a[a.n]:=this;
            a.b[a.n]:=z;
            a.c[a.n]:=L;
        end;
        if this<0 then begin
            this:=0;
            z:=inf;
            for i:=length(s) downto 1 do begin
                if s[i]='(' then this:=this-1
                else if s[i]=')' then this:=this+1;
                z:=min(z,this);
            end;
            inc(b.n);
            b.a[b.n]:=this;
            b.b[b.n]:=z;
            b.c[b.n]:=L;
        end;
    end;
    xl(b); xl(a);
    kq:=max(0,a.l[0]);
    for i:=1 to min(a.x, b.x) do if (a.l[i]>0)and(b.l[i]>0) then begin
        kq:=max(kq,a.l[i]+b.l[i]);
//        writeln(i,' ',a.l[i],' ',b.l[i]);
    end;
    writeln(kq);
end;

begin
main();
end.

