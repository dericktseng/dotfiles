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

function mkcd
    /usr/bin/mkdir -p "$argv[1]" && cd "$argv[1]"
end

function cpcd
    /usr/bin/mkdir -p "$argv[2]" && cp "$argv[1]" "$argv[2]" && cd "$argv[2]"
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
