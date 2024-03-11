#!/bin/csh
# 파일과 디렉토리를 구별하는 쉘프로그램
set tmp = `ls`
if ($#argv < 1) then
    @ i = 0
    while ($#tmp)
        if (-d $tmp[1]) then
            echo -n "$tmp[1]<D>   "
            @ i++
        else
            echo -n "$tmp[1]    "
            @ i++
        endif
        if ( $i == 5) then
            echo ""
            @ i = 0
        endif
        shift tmp
     end
else
    @ i = 0
    switch ($argv[1])
       case "-d" :
           while ($#tmp)
           if (-d $tmp[1]) then
               echo -n "$tmp[1]<D>   "
               @ i++
           endif
        if ( $i == 5) then
            echo ""
            @ i = 0
        endif
           shift tmp
           end
           breaksw
       case "-f" :
           while ($#tmp)
           if (-f $tmp[1]) then
               echo -n "$tmp[1]   "
               @ i++
           endif
        if ( $i == 5) then
            echo ""
            @ i = 0
        endif
           shift tmp
           end
           breaksw
   endsw
endif