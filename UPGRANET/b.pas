const r=4500;

type long=longint;
     canh=record u, v, w: long;end;

var e, tmp1: array[1..r] of long;
    n, m: long;
    ke, a, tmp: array[1..r, 1..r] of long;
    ds: array[1..r] of canh;

procedure nhap;
var i, j, w: long;
    f: text;

        procedure qsort;
                procedure sort(l, r: long);
                var i, j, x: long;
                    tmp: canh;
                begin
                        i:=l;
                        j:=r;
                        x:=ds[(l+r)div 2].w;
                        repeat
                                while ds[i].w>x do inc(i);
                                while ds[j].w<x do dec(j);
                                if i<=j then begin
                                        tmp:=ds[i];
                                        ds[i]:=ds[j];
                                        ds[j]:=tmp;
                                        inc(i);
                                        dec(j);
                                end;
                        until i>j;
                        if l<j then sort(l, j);
                        if i<r then sort(i, r);
                end;
        begin
                sort(1, m);
        end;

begin
        //assign(f, 'a.inp');reset(f);
        readln(n, m);
        for i:=1 to m do begin
                readln(ds[i].u, ds[i].v, ds[i].w);
                a[ds[i].u, ds[i].v]:=ds[i].w;
                a[ds[i].v, ds[i].u]:=ds[i].w;
        end;
        //close(f);
        qsort;
        for i:=1 to m do begin
                with ds[i] do begin
                        inc(e[u]);
                        ke[u, e[u]]:=v;
                        inc(e[v]);
                        ke[v, e[v]]:=u;
                end;
        end;
end;

function tlmax(u, v: long): long;
var _bfs, max: long;
    //tmp: array[1..10000, 1..10000] of long;

        function bfs(u, v: long): long;
        var q, trc: array[1..r] of long;
            free: array[1..r] of boolean;
            i, j, k, min: long;
            first, last: long;
        begin
                for i:=1 to n do free[i]:=true;

                q[1]:=u;
                first:=1;
                last:=1;
                free[u]:=false;
                trc[u]:=0;
                while first<=last do begin
                        i:=q[first];
                        inc(first);
                        for j:=1 to e[i] do begin
                                if ke[i, j]=v then begin
                                        min:=a[v, i];
                                        k:=i;
                                        while trc[k]<>0 do begin
                                                if min>a[k, trc[k]] then 
min:=a[k, trc[k]];
                                                k:=trc[k];
                                        end;
                                        exit(min);
                                end else if free[ke[i, j]] then begin
                                        inc(last);
                                        q[last]:=ke[i, j];
                                        free[ke[i, j]]:=false;
                                        trc[ke[i, j]]:=i;
                                end;
                        end;
                end;
                exit(0);
        end;

        procedure xoa(max: long);
        var i, j: long;
        begin
                for i:=1 to n do for j:=1 to e[i] do begin
                        if a[i, ke[i, j]]<=max then begin
                                ke[i, j]:=ke[i, e[i]];
                                dec(e[i]);
                        end;
                end;
        end;

        procedure backup;
        var i, j: long;
        begin
                for i:=1 to n do begin
                        tmp1[i]:=e[i];
                        for j:=1 to e[i] do tmp[i, j]:=ke[i, j];
                end;
        end;
        procedure restore;
        var i, j: long;
        begin
                for i:=1 to n do begin
                        e[i]:=tmp1[i];
                        for j:=1 to e[i] do ke[i, j]:=tmp[i, j];
                end;
        end;
begin
        backup;
        _bfs:=bfs(u, v);
        while _bfs<>0 do begin
                max:=_bfs;
                xoa(max);
                _bfs:=bfs(u, v);
        end;
        restore;
        exit(max);
end;

procedure xl;
var i, x, tong: long;
begin
        tong:=0;
        for i:=1 to m do begin
                x:=tlmax(ds[i].u, ds[i].v);
                tong:=tong+(x-a[ds[i].u, ds[i].v])
        end;
        writeln(tong);
end;

begin
nhap;
xl;
end.


