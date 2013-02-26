# Create your views here.

from django.template import Context, loader
from hiphopathy.models import Poll
from hiphopathy.models import Artist
from hiphopathy.models import Song
from hiphopathy.models import Album
from hiphopathy.models import Snippet
from django.shortcuts import get_object_or_404, render_to_response
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.core.context_processors import csrf



def index(request):
    artist_list = Artist.objects.all().order_by('artist')
    return render_to_response('index.html', {'artist_list': artist_list})
    
def search_form(request):
    return render_to_response('search_form.html')
    
def search(request):
    if 'q' in request.GET and request.GET['q']:
        q = request.GET['q']
        snippet_list = Snippet.objects.filter(songid = q)
        return render_to_response('search_results.html',
        {'snippet_list': snippet_list, 'query': q})
    else:
        return HttpResponse('Please submit a search term.')

    
    
def song_view(request, artistid):
    artist = Artist.objects.filter(artistid=artistid)
    song_list = Song.objects.filter(artistid=artistid)
    return render_to_response('song_index.html', {'song_list': song_list, 'artist': artist})
    
    
def snippet_view(request, songid):
    song = Song.objects.filter(songid=songid)
    artist = song[0].artistid
    chunk_list = Snippet.objects.filter(songid = songid)
    return render_to_response('snippet_index.html', {'chunk_list': chunk_list, 'song': song, 'artist': artist})
    

def post(request):
	if 'user_supplied_answer' in request.GET and request.GET['user_supplied_answer']:
		a = request.GET['user_supplied_answer']
		return render_to_response('snippet_post.html', {'answer': user_supplied_answer})
	else:
		return HttpResponse('Bye')

def about(request):
    return render_to_response('about.html')
