: '
Script to update the wordcloud image.
Requires the wordcloud_cli python tool:
    pip install wordcloud
    https://github.com/amueller/word_cloud
'

echo "    updating src/ALL.tex.temp"
cat src/[0-9]-*.tex src/ack.tex src/appendix.tex > src/ALL.tex.temp
echo "    updating src/img/wordcloud.png"
wordcloud_cli --text src/ALL.tex.temp --width 2000 --height 1000 --imagefile src/img/wordcloud.png --random_state 1 --stopwords scripts/wordcloud_omit.txt
echo "    updating src/img/wordcloud_refs.png"
wordcloud_cli --text src/ref.bib --width 2000 --height 1000 --imagefile src/img/wordcloud_refs.png --random_state 1 --stopwords scripts/wordcloud_omit.txt
