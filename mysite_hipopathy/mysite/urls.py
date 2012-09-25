from django.conf.urls import patterns, include, url

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^polls/$', 'polls.views.index'),
    url(r'^polls/(?P<artistid>\d+)/song_view/$', 'polls.views.song_view'),
    url(r'^polls/(?P<songid>\d+)/snippet_view/$', 'polls.views.snippet_view'),
    url(r'^polls/post/$', 'post'),
    url(r'^polls/search-form/$', 'polls.views.search_form'),
    url(r'^polls/search/$', 'polls.views.search'),
    url(r'^admin/', include(admin.site.urls)),
)
