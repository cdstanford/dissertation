: '
Script to update the wordcloud image.
Requires the wordcloud_cli python tool:
    pip install wordcloud
    https://github.com/amueller/word_cloud
'

cat src/[0-9]-*.tex src/ack.tex src/appendix.tex > src/ALL.tex.temp
wordcloud_cli --text src/ALL.tex.temp --width 2000 --height 1000 --imagefile src/img/wordcloud.png --random_state 1
