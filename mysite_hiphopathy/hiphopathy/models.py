import datetime
from django.db import models
from django.utils import timezone

# Create your models here.

class Poll(models.Model):
    question = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')
    
    # Make the output in a better format
    def __unicode__(self):
    	return self.question
    	
    # Create a better representation for the date
    def was_published_recently(self):
        return self.pub_date >= timezone.now() - datetime.timedelta(days=1)
    was_published_recently.admin_order_field = 'pub_date'
    was_published_recently.boolean = True
    was_published_recently.short_description = 'Published recently?'
    	

class Choice(models.Model):
    poll = models.ForeignKey(Poll)
    choice = models.CharField(max_length=200)
    votes = models.IntegerField()
    def __unicode__(self):
    	return self.choice

		
		
class Artist(models.Model):
    artistid = models.IntegerField(primary_key=True)
    artist = models.CharField(max_length=765)
    alias = models.TextField()
    class Meta:
        db_table = u'artist'
    def __unicode__(self):
    	return self.artist
	
class Album(models.Model):
    albumid = models.IntegerField(primary_key=True)
    album = models.CharField(max_length=765)
    artistid = models.ForeignKey(Artist, db_column='artistid', to_field='artistid')
    class Meta:
        db_table = u'album'

class Song(models.Model):
    songid = models.IntegerField(primary_key=True)
    albumid = models.ForeignKey(Album, db_column='albumid', to_field='albumid')
    title = models.CharField(max_length=765)
    lyrics = models.TextField()
    artistid = models.ForeignKey(Artist, db_column='artistid', to_field='artistid')

    class Meta:
        db_table = u'song'
    def __unicode__(self):
    	return self.title
        
class Snippet(models.Model):
    snippetid = models.IntegerField(primary_key=True)
    songid = models.ForeignKey(Song, db_column='songid', to_field='songid')
    chunk = models.TextField()
    user_answer = models.CharField(max_length=765)
    decoded = models.CharField(max_length=765)
    comments = models.TextField()
    def __unicode__(self):
    	return self.chunk