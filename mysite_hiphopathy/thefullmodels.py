# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#     * Rearrange models' order
#     * Make sure each model has one field with primary_key=True
# Feel free to rename the models, but don't rename db_table values or field names.
#
# Also note: You'll have to insert the output of 'django-admin.py sqlcustom [appname]'
# into your database.

from django.db import models

class Album(models.Model):
    albumid = models.IntegerField(primary_key=True)
    album = models.CharField(max_length=765)
    release_date = models.DateField()
    units_sold = models.IntegerField()
    record_label = models.CharField(max_length=765)
    artistid = models.IntegerField()
    folderid = models.CharField(max_length=765)
    class Meta:
        db_table = u'album'

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

class AuthGroup(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=240, unique=True)
    class Meta:
        db_table = u'auth_group'

class AuthGroupPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    group = models.ForeignKey(AuthGroup)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_group_permissions'

class AuthPermission(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=150)
    content_type = models.ForeignKey(DjangoContentType)
    codename = models.CharField(max_length=300, unique=True)
    class Meta:
        db_table = u'auth_permission'

class AuthUser(models.Model):
    id = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=90, unique=True)
    first_name = models.CharField(max_length=90)
    last_name = models.CharField(max_length=90)
    email = models.CharField(max_length=225)
    password = models.CharField(max_length=384)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    is_superuser = models.IntegerField()
    last_login = models.DateTimeField()
    date_joined = models.DateTimeField()
    class Meta:
        db_table = u'auth_user'

class AuthUserGroups(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    group = models.ForeignKey(AuthGroup)
    class Meta:
        db_table = u'auth_user_groups'

class AuthUserUserPermissions(models.Model):
    id = models.IntegerField(primary_key=True)
    user = models.ForeignKey(AuthUser)
    permission = models.ForeignKey(AuthPermission)
    class Meta:
        db_table = u'auth_user_user_permissions'

class Base64Data(models.Model):
    c = models.CharField(max_length=3, blank=True)
    val = models.IntegerField(null=True, blank=True)
    class Meta:
        db_table = u'base64_data'

class DjangoAdminLog(models.Model):
    id = models.IntegerField(primary_key=True)
    action_time = models.DateTimeField()
    user = models.ForeignKey(AuthUser)
    content_type = models.ForeignKey(DjangoContentType, null=True, blank=True)
    object_id = models.TextField(blank=True)
    object_repr = models.CharField(max_length=600)
    action_flag = models.IntegerField()
    change_message = models.TextField()
    class Meta:
        db_table = u'django_admin_log'

class DjangoContentType(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=300)
    app_label = models.CharField(max_length=300, unique=True)
    model = models.CharField(max_length=300, unique=True)
    class Meta:
        db_table = u'django_content_type'

class DjangoSession(models.Model):
    session_key = models.CharField(max_length=120, primary_key=True)
    session_data = models.TextField()
    expire_date = models.DateTimeField()
    class Meta:
        db_table = u'django_session'

class DjangoSite(models.Model):
    id = models.IntegerField(primary_key=True)
    domain = models.CharField(max_length=300)
    name = models.CharField(max_length=150)
    class Meta:
        db_table = u'django_site'

class EducationLevel(models.Model):
    education_levelid = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=765)
    class Meta:
        db_table = u'education_level'

class PollsChoice(models.Model):
    id = models.IntegerField(primary_key=True)
    poll = models.ForeignKey(PollsPoll)
    choice = models.CharField(max_length=600)
    votes = models.IntegerField()
    class Meta:
        db_table = u'polls_choice'

class PollsMyartist(models.Model):
    id = models.IntegerField(primary_key=True)
    artist_name = models.CharField(max_length=600)
    alias = models.CharField(max_length=600)
    class Meta:
        db_table = u'polls_myartist'

class PollsMysong(models.Model):
    id = models.IntegerField(primary_key=True)
    singer = models.ForeignKey(PollsMyartist)
    song = models.CharField(max_length=600)
    album = models.CharField(max_length=600)
    class Meta:
        db_table = u'polls_mysong'

class PollsPoll(models.Model):
    id = models.IntegerField(primary_key=True)
    question = models.CharField(max_length=600)
    pub_date = models.DateTimeField()
    class Meta:
        db_table = u'polls_poll'

class PollsSnippet(models.Model):
    snippetid = models.IntegerField(primary_key=True)
    songid = models.IntegerField()
    snippet = models.TextField()
    answer = models.CharField(max_length=2295)
    comments = models.TextField()
    class Meta:
        db_table = u'polls_snippet'

class ReadingLevel(models.Model):
    reading_levelid = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=765)
    class Meta:
        db_table = u'reading_level'

class Smogdata(models.Model):
    smogdataid = models.IntegerField(primary_key=True)
    word_count = models.IntegerField()
    syllable_count = models.IntegerField()
    polysyllabic_word_count = models.IntegerField()
    sentence_count = models.IntegerField()
    flesh_score = models.FloatField()
    smog_score = models.FloatField()
    longest_polysyllabic_word = models.CharField(max_length=765)
    average_syllables_per_word = models.FloatField()
    average_letters_per_word = models.FloatField()
    average_letters_per_syllable = models.FloatField()
    education_level = models.IntegerField()
    song_filenameid = models.CharField(max_length=765)
    class Meta:
        db_table = u'smogdata'

class Song(models.Model):
    songid = models.IntegerField(primary_key=True)
    albumid = models.IntegerField()
    title = models.CharField(max_length=765)
    lyrics = models.TextField()
    omp_score = models.CharField(max_length=765)
    waveform_jpg_url = models.CharField(max_length=765)
    wordclouds_jpg_url = models.CharField(max_length=765)
    smogdataid = models.IntegerField()
    artistid = models.IntegerField()
    song_styleid = models.IntegerField()
    typed_by = models.CharField(max_length=765)
    filenameid = models.CharField(max_length=765)
    producer = models.CharField(max_length=765)
    class Meta:
        db_table = u'song'

class SongStyle(models.Model):
    song_styleid = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=765)
    class Meta:
        db_table = u'song_style'

