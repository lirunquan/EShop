from django.db import models
from django.utils import timezone
# Create your models here.
class User(models.Model):
	username = models.CharField(max_length=20, verbose_name='username', unique=True)
	password = models.CharField(max_length=40, verbose_name='password', blank=False)
	realName = models.CharField(max_length=50, verbose_name='real_name')
	group = models.CharField(max_length=10)
	lastLogin = models.DateTimeField(verbose_name='last_login', default='')
	createAt = models.DateTimeField(verbose_name='create_at', auto_now_add=True)
	updateAt = models.DateTimeField(verbose_name='update_at', auto_now=True)
	class Meta:
		abstract = True

class Customer(User):
	phone = models.CharField(max_length=11, verbose_name='phone_number', unique=True)
	email = models.EmailField(verbose_name='email', unique=True)
	account = models.FloatField(default=1000.0)
class Clerk(User):
	jobnumber = models.CharField(max_length=11)	
