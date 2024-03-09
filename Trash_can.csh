#!/bin/csh
#
# Trash Program
# Usage : can -d/-l/-x (Filenames)

if (! -e $home/.can) mkdir $home/.can
if (! -e $home/.path) mkdir $home/.path
if ($#argv < 1) then
    echo "사용법: $0 -d/r/l/x (filenames)"
    exit
endif
@ size = 2000
set tmp = `ls $home/.can`
@ sum = 0
while ($#tmp)
    set aaa = `ls -l $home/.can/$tmp[1]`
    @ sum = $sum + $aaa[4]
    shift tmp
end

switch ($argv[1])
    case "-d":
        if ($#argv < 2) then
            echo "사용법: $0 -d Filename"
            exit
        else
            set num = `ls -l $cwd | grep $argv[2]`
            @ sum = $sum + $num[4]
            if ($sum > 2000) then
                echo "용량이 초과 : 휴지통으로 가지 않고 삭제합니까 (y/n)"
                set answer = $<
                if ($answer == "y") then
                    rm -r $argv[2]
                    echo "파일이 삭제되었습니다."
                else
                    echo "파일 삭제가 취소되었습니다."
                endif
            exit
            endif
            @ i = 2
            while ($i <= $#argv)
                if (-e $argv[$i]) then
                    mv $argv[$i] $home/.can
                    echo "$argv[$i] file deleted"
                    echo "$cwd $argv[$i]" >> $home/.path
                else
                    echo "$argv[$i] file is not found"
                endif
            @ i++
            end
        endif
        breaksw
    case "-r":
        if ($#argv < 2) then
            echo "사용법: $0 -r Filename"
            exit
        else
            @ i = 2
            while ($i <= $#argv)
                if (-e $home/.can/$argv[$i]) then
                    set tmp = `grep $argv[$i] $home/.path`
                    mv $home/.can/$argv[$i] $tmp[1]
                    grep -v $argv[$i] $home/.path > aaa
                    mv aaa $home/.path
                    echo "$argv[$i] file is recoverd"
                else
                    echo "$argv[$i] file not found"
                endif
            @ i++
            end
        endif
        breaksw
    case "-l":
        @ a = 2000 - $sum
        echo "현재 휴지통 용량 : $sum Byte"
        echo "------- 휴지통 ------"
        ls $home/.can
        echo "---------------------"
        breaksw
    case "-x":
        echo -n "정말로 비우실겁니까?(y/n)"
        set answer = $<
        if ($answer == "y") then
            rm -r $home/.can
            echo "휴지통이 완전이 삭제되었습니다"
        else
            echo "휴지통 삭제가 되었습니다"
        endif
        breaksw

endsw 