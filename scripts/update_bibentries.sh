: '
Script to count and save the number of bibtex entries of each type.
Thanks to:
    https://unix.stackexchange.com/q/39039/46442
'

echo "    updating data/bibentries.txt"
echo "===== Bib entries =====" > data/bibentries.txt
cat src/ref.bib \
    | grep -oh "@\w*" \
    | sort \
    | uniq -c \
    | sort -bnr \
    >> data/bibentries.txt
cat src/ref.bib \
    | grep -oh "@\w*" \
    | wc -l \
    | awk '{$1=$1;print}' \
    | sed 's_^_ _' \
    | sed 's_$_ total_' \
    >> data/bibentries.txt
