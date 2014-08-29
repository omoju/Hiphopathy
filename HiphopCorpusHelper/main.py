import re
import nltk
import Index



## This displays three stats for each lyric text
## Average word length, average sentence length, the number of times each vocabulary item appears
## in the text 

def begin(wordlist, the_corpus): #process the files so I know what was read in
    for fileid in wordlist.fileids():
        raw = wordlist.raw(fileid)
        raw = re.split(r'\W+', raw) ## split the raw text into appropriate words 
        ## while I am cleaning up, I should strip out the word chorus followed by the next word
        the_corpus.extend(raw)
        print fileid
        
    return the_corpus




 
## You should also tokenize contractions like didn't to did and not
## Also put numbers that belong together as one unit. For example 9 1/2 should be "9" and "1/2"
## not "9", "1", "2"

## write the processed file out
def write_output(mycorpus):
    output_file = open('output2.txt', 'w')
    for words in sorted(set(mycorpus)):
        output_file.write(words + "\n")
    output_file.write(str(len(set(mycorpus))) + "\n")
    output_file.close()


## We want to load the entire corpus into memory and have the concordance set up as well

from nltk.corpus import PlaintextCorpusReader
corpus_root = 'JayZ'
wordlist = PlaintextCorpusReader(corpus_root, '.*')	



the_corpus = begin(wordlist, [])
porter = nltk.PorterStemmer()
text = Index.IndexedText(porter, the_corpus)
#text.concordance('Know')
#text.newconc('Forever')
#text.newconc_v2('Jigga')

## As of now got all of Jay's lyric words in the system. 
## I can access the concordance to see how they are used.






