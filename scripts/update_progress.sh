echo "    updating progress.txt"
echo "===== Writing progress =====" > progress.txt
echo "   words   chars file" >> progress.txt
find . -name '*.tex' | xargs wc -w -c | sort >> progress.txt
