echo "    updating progress.txt"
echo "===== Writing progress =====" > data/progress.txt
echo "   words   chars file" >> data/progress.txt
find . -name '*.tex' | xargs wc -w -c | sort >> data/progress.txt
