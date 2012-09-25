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
    	
class MyArtist(models.Model):
	artist_name = models.CharField(max_length=200)
	alias = models.CharField(max_length=200)
	def __unicode__(self):
		return self.artist_name
		
class MySong(models.Model):
	singer = models.ForeignKey(MyArtist)
	song = models.CharField(max_length=200)
	album = models.CharField(max_length=200)
	def __unicode__(self):
		return self.song
		
		
class Artist(models.Model):
    artistid = models.IntegerField(primary_key=True)
    artist = models.CharField(max_length=765)
    type = models.CharField(max_length=765)
    start = models.DateField()
    end = models.DateField()
    alias = models.TextField()
    city = models.CharField(max_length=765)
    state = models.CharField(max_length=765)
    county = models.CharField(max_length=765)
    country = models.CharField(max_length=765)
    latitude = models.CharField(max_length=765)
    longitude = models.CharField(max_length=765)
    origin_city = models.CharField(max_length=765)
    origin_state = models.CharField(max_length=765)
    origin_county = models.CharField(max_length=765)
    origin_country = models.CharField(max_length=765)
    origin_latitude = models.CharField(max_length=765)
    origin_longitude = models.CharField(max_length=765)
    folderid = models.CharField(max_length=765)
    class Meta:
        db_table = u'artist'
    def __unicode__(self):
    	return self.artist
	
class Album(models.Model):
    albumid = models.IntegerField(primary_key=True)
    album = models.CharField(max_length=765)
    release_date = models.DateField()
    units_sold = models.IntegerField()
    record_label = models.CharField(max_length=765)
    artistid = models.ForeignKey(Artist, db_column='artistid', to_field='artistid')
    folderid = models.CharField(max_length=765)
    class Meta:
        db_table = u'album'

class Song(models.Model):
    songid = models.IntegerField(primary_key=True)
    #albumid = models.IntegerField()
    albumid = models.ForeignKey(Album, db_column='albumid', to_field='albumid')
    #theartist = models.ForeignKey(Artist)
    title = models.CharField(max_length=765)
    lyrics = models.TextField()
    omp_score = models.CharField(max_length=765)
    waveform_jpg_url = models.CharField(max_length=765)
    wordclouds_jpg_url = models.CharField(max_length=765)
    smogdataid = models.IntegerField()
    artistid = models.ForeignKey(Artist, db_column='artistid', to_field='artistid')
    song_styleid = models.IntegerField()
    typed_by = models.CharField(max_length=765)
    filenameid = models.CharField(max_length=765)
    producer = models.CharField(max_length=765)
    class Meta:
        db_table = u'song'
    def __unicode__(self):
    	return self.title
        
class Snippet(models.Model):
    snippetid = models.IntegerField(primary_key=True)
    songid = models.ForeignKey(Song, db_column='songid', to_field='songid')
    snippet = models.TextField()
    answer = models.CharField(max_length=765)
    comments = models.TextField()
    def __unicode__(self):
    	return self.snippet
    
class Userdata(models.Model):
    userdataid = models.IntegerField(primary_key=True)
    snippet =  models.ForeignKey(Snippet)
    name =  models.CharField(max_length=765)
    answer = models.CharField(max_length=765)
    
class Frame(models.Model):
    frameid = models.IntegerField(primary_key=True, db_column='Frameid') # Field name made lowercase.
    name = models.CharField(max_length=240, unique=True, db_column='Name', blank=True) # Field name made lowercase.
    definition = models.TextField(db_column='Definition', blank=True) # Field name made lowercase.
    createddate = models.DateTimeField(null=True, db_column='CreatedDate', blank=True) # Field name made lowercase.
    createdby = models.CharField(max_length=120, db_column='CreatedBy', blank=True) # Field name made lowercase.
    image = models.TextField(db_column='Image', blank=True) # Field name made lowercase.
    symbolicrep = models.CharField(max_length=240, db_column='SymbolicRep', blank=True) # Field name made lowercase.
    modifieddate = models.DateTimeField(db_column='ModifiedDate') # Field name made lowercase.
    class Meta:
        db_table = u'Frame'
    def __unicode__(self):
    	return self.name

class Frameelement(models.Model):
    frameelementid = models.IntegerField(primary_key=True, db_column='FrameElementid') # Field name made lowercase.
    name = models.CharField(max_length=240, db_column='Name', blank=True) # Field name made lowercase.
    abbrev = models.CharField(max_length=120, db_column='Abbrev', blank=True) # Field name made lowercase.
    definition = models.TextField(db_column='Definition', blank=True) # Field name made lowercase.
    semrolerank = models.IntegerField(null=True, db_column='SemRoleRank', blank=True) # Field name made lowercase.
    type = models.CharField(max_length=48, db_column='Type', blank=True) # Field name made lowercase.
    core = models.CharField(max_length=3, db_column='Core', blank=True) # Field name made lowercase.
    createddate = models.DateTimeField(null=True, db_column='CreatedDate', blank=True) # Field name made lowercase.
    createdby = models.CharField(max_length=120, db_column='CreatedBy', blank=True) # Field name made lowercase.
    #frameid = models.IntegerField(null=True, db_column='Frameid', blank=True) # Field name made lowercase.
    frameid = models.ForeignKey(Frame, db_column='frameid', to_field='frameid')
    modifieddate = models.DateTimeField(db_column='ModifiedDate') # Field name made lowercase.
    class Meta:
        db_table = u'FrameElement'
    def __unicode__(self):
    	return self.name