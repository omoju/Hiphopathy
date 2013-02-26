from django.conf.urls import patterns, include, url
from django.contrib import admin
admin.autodiscover()






urlpatterns = patterns('',
    (r'^hiphopathy/$', 'hiphopathy.views.index'),
    (r'^hiphopathy/(?P<artistid>\d+)/song_view/$', 'hiphopathy.views.song_view'),
    (r'^hiphopathy/(?P<songid>\d+)/snippet_view/$', 'hiphopathy.views.snippet_view'),
    (r'^hiphopathy/post/$', 'post'),
    (r'^hiphopathy/search_form/$', 'hiphopathy.views.search_form'),
    (r'^hiphopathy/search/$', 'hiphopathy.views.search'),
    (r'^admin/', include(admin.site.urls)),
    (r'^hiphopathy/about/$', 'hiphopathy.views.about'),
)
