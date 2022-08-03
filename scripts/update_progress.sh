: '
Script to update progress.txt with total size of all input files
'

echo "    updating data/progress.txt"
echo "===== Writing progress =====" > data/progress.txt
echo "   words   chars file" >> data/progress.txt
find src -name '*.tex' | xargs wc -w -c | sort >> data/progress.txt
