: '
Script to update the wordcloud image.
Requires the wordcloud_cli python tool:
    pip install wordcloud
    https://github.com/amueller/word_cloud
'

echo "    updating src/ALL.tex.temp"
cat src/[0-9]-*.tex src/ack.tex src/appendix.tex > src/ALL.tex.temp

echo "    updating src/ALL.txt.temp"
cat src/ALL.tex.temp \
  | sed -E 's/^%.*//' \
  | sed -E 's/\\label{.*}/ /g' \
  | sed -E 's/\\Cref{.*}/ /g' \
  | sed -E 's/\\ref{.*}/ /g' \
  | sed -E 's/\\eqref{.*}/ /g' \
  | sed -E 's/\\cite(Main)?{.*}/ /g' \
  | sed -E 's/\\begin{.*}/ /g' \
  | sed -E 's/\\end{.*}/ /g' \
  | sed -E 's/\\[a-zA-Z]*//g' \
  | sed -E 's/_/ /g' \
  | sed -E 's/'\''/ /g' \
  > src/ALL.txt.temp

echo "    updating src/BIB.txt.temp"
cat src/ref.bib \
  | grep -o -E '(\btitle|\bauthor).*=.*' \
  | sed -E 's/.*=//' \
  > src/BIB.txt.temp

echo "    updating src/img/wordcloud.png"
wordcloud_cli --text src/ALL.txt.temp \
  --width 2000 --height 1000 \
  --imagefile src/img/wordcloud.png \
  --random_state 1 \
  --stopwords scripts/wordcloud_omit.txt \
  --min_word_length 2

echo "    updating src/img/wordcloud_refs.png"
wordcloud_cli --text src/BIB.txt.temp \
  --width 2000 --height 1000 \
  --imagefile src/img/wordcloud_refs.png \
  --random_state 1 \
  --stopwords scripts/wordcloud_omit.txt \
  --min_word_length 2
