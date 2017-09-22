for i in $(grep -i '#\s*\(place\|put\) in' . -r | sed 's/^\([^:]*\):\s*#\s*[Pp]\(lace\|ut\)\s*in\s*\([^[:space:]]*\).*/\1:\3/')
do 
    git_path=$(echo $i | sed 's/\([^:]*\):\(.*\)/\1/')
    etc_path=$(echo $i | sed 's/\([^:]*\):\(.*\)/\2/')$(basename $git_path)
    diff $git_path $etc_path >/dev/null
    is_diff=$?
    if [ $is_diff -ne 0 ]
    then
        cp $etc_path $git_path
    fi
done
