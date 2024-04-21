function flame
    perf record -F 99 -a -g -- $argv
    perf script | stackcollapse-perf.pl > out.perf-folded
    flamegraph.pl out.perf-folded > perf.svg
    firefox perf.svg
end

function fixpk
    sudo pkcon -v -p repair
    sudo pkcon refresh force -c -1 -v -p
end

function rainbowband
    awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
    }'
end

function mkcd
    /usr/bin/mkdir -p "$argv[0]" && cd "$argv[0]"
end

function cpcd
    /usr/bin/mkdir -p "$argv[1]" && cp "$argv[0]" "$argv[1]" && cd "$argv[1]"
end

function mvcd
    /usr/bin/mv $1 $2 && cd $2
end

function lscwd
    set tot (/bin/ls -1 -f | wc -l)
    set visible (/bin/ls -1 -U --color=never | wc -l)
    if test "$tot" -eq 2
        /bin/echo "This directory is empty"
    else if test "$visible" -eq 0
        ls -A
    else
        ls
    end
end
