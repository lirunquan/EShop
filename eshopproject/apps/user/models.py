from django.db import models
from django.utils import timezone
import time
# Create your models here.
class User(models.Model):
	g_methods = (('1', 'Customer'),('0', 'Clerk'))
	username = models.CharField(max_length=20, verbose_name='username', unique=True)
	password = models.CharField(max_length=40, verbose_name='password', blank=False)
	realName = models.CharField(max_length=50, verbose_name='real_name')
	group = models.CharField(max_length=10, choices=g_methods, default='1')
	lastLogin = models.DateTimeField(default=timezone.now)
	createAt = models.DateTimeField(auto_now_add=True)
	updateAt = models.DateTimeField(auto_now=True)
	isOnline = models.BooleanField(default=False)
	class Meta:
		abstract = True

class Customer(User):
	phone = models.CharField(max_length=11, verbose_name='phone_number', unique=True)
	email = models.EmailField(verbose_name='email', unique=True)
	account = models.FloatField(default=1000.0)
	def __str__(self):
		return '%s %s %s'%(self.username, self.phone, self.email)
class Clerk(User):
	jobnumber = models.CharField(max_length=11)	
	def __str__(self):
		return '%s %s'%(self.username, self.jobnumber)
class RecieveInfo(models.Model):
	owner = models.ForeignKey(Customer, on_delete=models.CASCADE, verbose_name='customer')
	reciever = models.CharField(max_length=50, verbose_name='reciever_name')
	address = models.TextField(verbose_name='recive_address')
	phone = models.CharField(max_length=11, verbose_name='reciever_phone', unique=True)
	postcode = models.CharField(max_length=6)
	def __str__(self):
		return '%s\t%s %s'%(self.reciever, self.address, self.phone)
