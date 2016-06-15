import sys

def ggxx(seq):
    seqLen = len(seq)
    l = []
    i = 0
    palLen = 0
    while i < seqLen:
        if i > palLen and seq[i - palLen - 1] == seq[i]:
            palLen += 2
            i += 1
            continue

        l.append(palLen)

        s = len(l) - 2
        e = s - palLen
        for j in range(s, e, -1):
            d = j - e - 1

            if l[j] == d: # *
                palLen = d
                break

            l.append(min(d, l[j]))
        else:
            palLen = 1
            i += 1

    l.append(palLen)

    lLen = len(l)
    s = lLen - 2
    e = s - (2 * seqLen + 1 - lLen)
    for i in range(s, e, -1):
        d = i - e - 1
        l.append(min(d, l[i]))
    k=0;
    for i in l:
        if i > k:
             k = i
    
    return k
        

sys.stdin.readline()
s = sys.stdin.readline()
s=s.rstrip()
print(ggxx(s))
