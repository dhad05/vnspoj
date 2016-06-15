type int=longint;
var n,top: int;
	a,b,id,s: array[1..500000] of int;

procedure qsort();
var x,tmp,i: int;
	procedure sort(l,r: int);
    var i,j: int;
    begin
    	i:=l;j:=r;
        x:=a[l+random(r-l+1)];
        while i<=j do begin
        	while a[i]<x do inc(i);
            while a[j]>x do dec(j);
            if i<=j then begin
                tmp:=a[i];a[i]:=a[j];a[j]:=tmp;
                tmp:=b[i];b[i]:=b[j];b[j]:=tmp;
                tmp:=id[i];id[i]:=id[j];id[j]:=tmp;
                inc(i);dec(j);
            end;
        end;
        if l<j then sort(l,j);
        if i<r then sort(i,r);
    end;
begin
	for i:=1 to n do id[i]:=i;
    sort(1,n);
end;

function get(): int;
var i,tmp,j: int;
begin
	get:=s[1];
    s[1]:=s[top];
    dec(top);
    i:=1;
    while i*2<=top do begin
    	j:=i*2;
        if (j<top)and(b[s[j]]<b[s[j+1]]) then j:=j+1;
        if b[s[i]]>b[s[j]] then break;
        tmp:=s[i];s[i]:=s[j];s[j]:=tmp;
        i:=j;
    end;
end;

procedure push(i: int);
var j,tmp: int;
begin
	inc(top);
    s[top]:=i;
    i:=top;
    while i>1 do begin
    	j:=i div 2;
        if b[s[j]]>b[s[i]] then break;
        tmp:=s[i];s[i]:=s[j];s[j]:=tmp;
        i:=j;
    end;
end;

procedure main();
var i,j: int;
	kq: int64;
begin
	readln(n);
    for i:=1 to n do read(a[i]);
    for i:=1 to n do read(b[i]);
    qsort();
    fillchar(a,sizeof(a),0);
    kq:=0;
    for i:=1 to n do begin
    	push(i);
        if i mod 2=1 then begin
        	j:=get();
        	a[j]:=1;
            kq:=kq+int64(b[j]);
        end;
    end;
    writeln(kq);
    top:=0;
    for i:=1 to n do begin
    	if a[i]=0 then begin
        	writeln(id[i],' ',id[s[top]]);
            dec(top);
        end else begin
        	inc(top);
            s[top]:=i;
        end;
    end;
end;

begin
randomize();
main();
end.