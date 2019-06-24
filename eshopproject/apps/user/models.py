from django.db import models

# Create your models here.
class User(models.Model):
	username = models.CharField(max_length=20, verbose_name='username', unique=True)
	password = models.CharField(max_length=40, verbose_name='password', blank=False)
	realname = models.CharField(max_length=50, verbose_name='real_name')
	group = models.CharField(max_length=10)
	class Meta:
		abstract = True

class Customer(User):
	phone = models.CharField(max_length=11, verbose_name='phone_number', unique=True)
	email = models.EmailField(verbose_name='email', unique=True)

class Clerk(User):
	jobnumber = models.CharField(max_length=11)	
