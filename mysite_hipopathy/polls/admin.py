from django.contrib import admin
from polls.models import Choice
from polls.models import Artist
from polls.models import Song
from polls.models import Album
from polls.models import Snippet
from polls.models import Frame
from polls.models import Frameelement
from polls.models import Userdata


class AlbumInline(admin.TabularInline):
    model = Album
    extra = 3
    
class SongInline(admin.TabularInline):
    model = Song
    extra = 3
    
class ArtistAdmin(admin.ModelAdmin):
	fieldsets = [
        ('Name',               {'fields': ['artist']}),
        ('Alias', {'fields': ['alias'],'classes': ['collapse']}),
        ]
        inlines = [SongInline]
  
class SnippetAdmin(admin.ModelAdmin):
	fieldsets = [
        ('Snippet',          {'fields': ['snippet']}),
        ('KEY',              {'fields': ['snippetid']}),
        ('SONG',             {'fields': ['songid']}),
        ('Answer',           {'fields': ['answer']}),
        ('Remarks',          {'fields': ['comments']}),
    	]
    	list_display = ('songid', 'snippetid')

class UserAdmin(admin.ModelAdmin):
	fieldsets = [
        ('ID',          {'fields': ['userdataid']}),
        ('Snippet',          {'fields': ['snippet']}),
        ('User Name',          {'fields': ['name']}),
        ('Answer',           {'fields': ['answer']}),
    	]
    	list_display = ('name', 'answer')
        

class SongAdmin(admin.ModelAdmin):
	fieldsets = [
        ('Title',               {'fields': ['title']}),
        ('Lyrics', {'fields': ['lyrics'],'classes': ['collapse']}),
    	]
    	search_fields=['title']
    	list_display = ('title', 'albumid', 'artistid')
 
class FrameelementInline(admin.TabularInline):
	model = Frameelement
	extra = 0
	
class FrameAdmin(admin.ModelAdmin):
	fieldsets = [
        ('Name',               {'fields': ['name']}),
        ('Definition', {'fields': ['definition'],'classes': ['collapse']}),
    	]
    	search_fields=['name']
    	inlines = [FrameelementInline]
    	



admin.site.register(Artist, ArtistAdmin)
admin.site.register(Snippet, SnippetAdmin)
admin.site.register(Song, SongAdmin)
admin.site.register(Frame, FrameAdmin)
admin.site.register(Userdata, UserAdmin)



