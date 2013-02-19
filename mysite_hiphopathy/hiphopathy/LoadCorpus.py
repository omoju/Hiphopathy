import re
import nltk
import pprint
import string

from nltk.corpus import PlaintextCorpusReader
corpus_root = 'JayZ'
wordlist = PlaintextCorpusReader(corpus_root, '.*')	



## This displays three stats for each lyric text
## Average word length, average sentence length, the number of times each vocabulary item appears
## in the text 

def begin(wordlist): #process the files so I know what was read in
    for fileid in wordlist.fileids():
        num_chars = len(wordlist.raw(fileid))
        num_words = len(wordlist.words(fileid))
        num_sents = len(wordlist.sents(fileid))
        
        # normalize the vocabulary, stem d words using porter stemmer 
        num_vocab = len(set([w.lower() for w in wordlist.words(fileid)]))
        
        #print fileid, int(num_chars/num_words), int(num_words/num_sents), int(num_words/num_vocab)



files = wordlist.fileids()
raw = wordlist.raw(files[5])

## normalize and tokenize
porter = nltk.PorterStemmer()
temp = re.split(r'\W+', raw) ## split the raw text into appropriate words 
##pattern = r'\W+'
##temp = nltk.regexp_tokenize(ld.raw, pattern)

temp = [porter.stem(t) for t in temp]
temp = [t.lower() for t in temp]
## You should also tokenize contractions like didn't to did and not
## Also put numbers that belong together as one unit. For example 9 1/2 should be "9" and "1/2"
## not "9", "1", "2"


## part of speech tagging
words = nltk.word_tokenize(raw)
words = [t.lower() for t in words]
tagged = nltk.pos_tag(words)


## CLASSIFICATION
all_words = nltk.FreqDist(words)
word_features = all_words.keys()[:300]
## word features now contains the 300 most common words across the
## corpus. This variable is used to define a feature extractor:

def document_features(document, word_features): ## 
    document_words = document
    features = {}
    for word in word_features:
        features['contains(%s)' % word] = (word in document_words)
    return features
## Each document has now an associated dictionary with True or False on
## whether a specific word appear in the document

# Some document to classify on 'output.txt'
#newcorpus_root = ''
#document = PlaintextCorpusReader(newcorpus_root, '.*')
#docu = document.raw(document.fileids()[214])
#docuwords = nltk.word_tokenize(docu)
#docuwords = [t.lower() for t in docuwords]

## write the processed file out
#output_file = open('output2.txt', 'w')
#for words in sorted(set(temp)):
#     output_file.write(words + "\n")

#output_file.write(str(len(set(temp))) + "\n")
#output_file.close()