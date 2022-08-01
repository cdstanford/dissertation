: '
Script to count and save the number of bibtex entries of each type,
as well as the list of unused bibtex entries.

Thanks to:
    https://unix.stackexchange.com/q/39039/46442
    https://tex.stackexchange.com/a/232771/28267
'

if [ ! -d build ]; then
    echo "build directory not found -- run make build first."
    exit 1
fi

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
echo "===== By venue =====" >> data/bibentries.txt
cat src/ref.bib \
    | grep -oh -E 'booktitle(.*)=(.*)|journal(.*)=(.*)' \
    | sed -E 's/.*=.*({|\")(.*)(}|\")/\2/' \
    | sed -E 's/[0-9]+(th|st|nd|rd) //' \
    | sed -E 's/first |second |third //I' \
    | sed -E 's/biennial //I' \
    | sort \
    | uniq -c \
    | sort -bnr \
    >> data/bibentries.txt

echo "    updating data/bibunused.txt"
cd build \
    && checkcites --unused dissertation.aux Main.aux \
    > ../data/bibunused.txt
