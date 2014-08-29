import re
import nltk
import pprint
import string
from urllib import urlopen
url = "http://www.azlyrics.com/j/jayz.html"
raw = urlopen(url).read()

## Get song titles and album titles based on the format of this website
artist = "JayZ"
songNameList = re.compile('target="_blank">(.*?)</a>').findall(raw)
albumlist = re.compile('<div class="album">album: <b>"(.*?)"</b>').findall(raw)

## They changed their format recently - albumlist = re.compile('<br>album: <b>"(.*?)"</b>').findall(raw)

##Now I want to get the hyperlink associated with each song and extract the lyrics
song_url=re.compile('<a href="../lyrics/jayz/(.*?)" target="_blank">').findall(raw)
song_url = re.compile('(.*?)/j/jayz.html$').findall(url)

def get_song(song):
    start = song.find("<!-- start of lyrics -->")
    start = start + len("<!-- start of lyrics -->")
    end = song.rfind("<!-- end of lyrics -->")
    song = song[start:end]
    song = nltk.clean_html(song)
    return song


def write_song_file(album_number, start, end):
    for element  in songNameList[ start : end ]:
        tmp = re.compile('<a href="../(.*?)" target="_blank">' + element + '</a>').findall(raw)
        print element
        s_url = song_url[0] + '/' + tmp[0]
        print s_url
        song = urlopen(s_url).read()
        t = get_song(song)
        wo = element.translate(string.maketrans("",""), string.punctuation)
        fname =  artist + '_' + albumlist[album_number] + '_' + wo + '.txt'
        print fname
        f = open(fname, "w+")
        f.write(t)
        f.close()
    print "\n**** A L L  D O N E ****"



## The songs and their url list didn't aling as i want
songUrlList =re.compile('<a href="../(.*?)" target="_blank">').findall(raw)
song_url = song_url[0] + '/' + songUrlList[1]
sUrl = re.compile('<a href="../(.*?)target="_blank">'+songNameList[item]+'</a>').findall(raw)


## Extract the song lyrics
start = song.find("<!-- start of lyrics -->")
start = start + len("<!-- start of lyrics -->")
end = song.rfind("<!-- end of lyrics -->")
song = song[start:end]
song = nltk.clean_html(song)

##Write out the file
fname =  artist + '_' + albumlist[1] + '_' + songlist[1] + '.txt'
f = open(fname, "w+")
f.write(song)
f.close()

for element in songUrlList:
print element

for element in songUrlList:
newelement = element + '\n'
f.write(newelement)