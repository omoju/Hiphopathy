# Create your views here.

from django.template import Context, loader
from polls.models import Poll
from polls.models import Artist
from polls.models import Song
from polls.models import Album
from polls.models import Snippet
from django.shortcuts import get_object_or_404, render_to_response
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.core.context_processors import csrf  
import datetime

def current_datetime(request):
           now = datetime.datetime.now()
           html = "<html><body>It is now %s.</body></html>" % now
           return HttpResponse(html)


def index(request):
    artist_list = Artist.objects.all().order_by('-artist')
    return render_to_response('polls/index.html', {'artist_list': artist_list})
    
def search_form(request):
    return render_to_response('polls/search_form.html')
    
def search(request):
    if 'q' in request.GET and request.GET['q']:
        q = request.GET['q']
        snippet_list = Snippet.objects.filter(songid = q)
        return render_to_response('polls/search_results.html',
        {'snippet_list': snippet_list, 'query': q})
    else:
        return HttpResponse('Please submit a search term.')

    
    
def song_view(request, artistid):
    song_list = Song.objects.filter(artistid=artistid)
    return render_to_response('polls/song_index.html', {'song_list': song_list})
    
    
def snippet_view(request, songid):
    snippet_list = Snippet.objects.filter(songid = songid)
    return render_to_response('polls/snippet_index.html', {'snippet_list': snippet_list})
    

def post(request):
	if 'a' in request.GET and request.GET['a']:
		a = request.GET['a']
		return render_to_response('polls/snippet_post.html', {'answer': a})
	else:
		return HttpResponse('Bye')
