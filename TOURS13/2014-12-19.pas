//*** tours voi 2014 (2014-12-19)
//*** spoj: TOURS13 (2014-12-19)
//*** 90%

type long=longint;
     link=^node;
     node=record
        c, d: long;
        next: link;
     end;

const inf=2100000000;

var n, m, minc: long;
    ke: array[1..1000] of link;

var heap, d: array[1..1000] of long;
    stt, sh: array[1..1000] of long;
    free: array[1..1000] of shortint;

var p: array[1..1000] of long;//tarjan result

function fmin(a, b: long): long;
begin
    if a>b then exit(b) else exit(a);
end;
procedure tarjan;
var s, num, low: array[1..1000] of long;
    i, top, sv, count: long;

    procedure try(i: long);
    var t: link;
        j: long;
    begin
        count:=count+1;
        num[i]:=count;
        low[i]:=count;
        top:=top+1;
        s[top]:=i;

        t:=ke[i];
        while t<>nil do begin
            j:=t^.d;
            if p[j]=0 then begin
                if num[j]=0 then begin
                    try(j);
                    low[i]:=fmin(low[i], low[j]);
                end else begin
                    low[i]:=fmin(low[i], num[j]);
                end;
            end;
            t:=t^.next;
        end;

        if low[i]=num[i] then begin
            sv:=sv+1;
            while s[top]<>i do begin
                p[s[top]]:=sv;
                top:=top-1;
            end;
            p[i]:=sv;
            top:=top-1;
        end;
    end;
begin
    sv:=0;
    top:=0;
    count:=0;
    for i:=1 to n do begin
        p[i]:=0;
        num[i]:=0;
    end;
    for i:=1 to n do if p[i]=0 then try(i);
end;

function get(var u: long): long; //u return a vertex, get return a weight
var i, j: long;
    tmp: long;
begin
    get:=heap[1];
    u:=sh[1];

    heap[1]:=heap[m];
    sh[1]:=sh[m];
    stt[sh[1]]:=1;

    m:=m-1;
    i:=1;
    while i shl 1<=m do begin
        j:=i shl 1;
        if j<m then if heap[j+1]<heap[j] then j:=j+1;
        if heap[i]>heap[j] then begin
            stt[sh[i]]:=j;
            stt[sh[j]]:=i;
            tmp:=heap[i];
            heap[i]:=heap[j];
            heap[j]:=tmp;
            tmp:=sh[i];
            sh[i]:=sh[j];
            sh[j]:=tmp;
            i:=j;
        end else break;
    end;
end;
procedure edit(d: long; c: long); //d is a vertex number, c is a weight
var i: long;
    tmp: long;
begin
    d:=stt[d]; //d change to an index
    heap[d]:=c;

    while d>1 do begin
        i:=d shr 1;
        if heap[i]>heap[d] then begin
            stt[sh[i]]:=d;
            stt[sh[d]]:=i;
            tmp:=heap[d];
            heap[d]:=heap[i];
            heap[i]:=tmp;
            tmp:=sh[d];
            sh[d]:=sh[i];
            sh[i]:=tmp;
            d:=i;
        end else break;
    end;
end;
procedure push(d: long; c: long); //same as edit()
var i: long;
    tmp: long;
begin
    m:=m+1;
    heap[m]:=c;
    sh[m]:=d;
    stt[d]:=m;
    c:=m; //c change to an index

    while (c>1) do begin
        i:=c shr 1;
        if heap[i]>heap[c] then begin
            stt[sh[c]]:=i;
            stt[sh[i]]:=c;
            tmp:=heap[c];
            heap[c]:=heap[i];
            heap[i]:=tmp;
            tmp:=sh[i];
            sh[i]:=d;
            sh[c]:=tmp;
            c:=i;
        end else break;
    end;
end;

function dijs(s: long): long;
var t: link;
    u: long;
    c: long;
begin
    for u:=1 to n do begin
        free[u]:=1;
    end;

    dijs:=inf;
    m:=0; //init heap
    push(s, 0);
    free[s]:=0;
    while m>0 do begin
        c:=get(u);
        free[u]:=-1;
        d[u]:=c;
        if d[u]+minc>=dijs then exit;
        t:=ke[u];
        while t<>nil do begin
            if p[t^.d]<>p[s] then begin //different component
                t:=t^.next;
                continue;
            end;

            if t^.d=s then begin //cycle
                if d[u]+t^.c<dijs then dijs:=d[u]+t^.c;
            end;
            if free[t^.d]=1 then begin
                push(t^.d, d[u]+t^.c);
                free[t^.d]:=0;
            end else if free[t^.d]<>-1 then
            if heap[stt[t^.d]]>d[u]+t^.c then edit(t^.d, d[u]+t^.c);
            t:=t^.next;
        end;
    end;
    if dijs=inf then dijs:=-1;
end;

procedure main;
var u: long;
begin
    tarjan;
    for u:=1 to n do begin
        writeln(dijs(u));
    end;
end;

procedure nhap;
var m, i, u, v, c: long;
    f: text;
    t: link;
    ss, k: long;
begin
    assign(f, 'tour.inp');
    reset(f);
    readln(f, ss);
    for k:=1 to ss do begin
    readln(f, n, m);
    for i:=1 to n do begin
        ke[i]:=nil;
    end;
    minc:=inf;
    for i:=1 to m do begin
        readln(f, u, v, c);
        if minc>c then minc:=c;
        new(t);
        t^.d:=v;
        t^.c:=c;
        t^.next:=ke[u];
        ke[u]:=t;
    end;
    main;
    end;
    close(f);
end;

begin
nhap;
end.
