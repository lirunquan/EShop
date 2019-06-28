from django.db import models
from django.utils import timezone
from django_mysql.models import JSONField
from apps.goods.models import Goods
from apps.user.models import Customer
import time
# Create your models here.
class RecieveInfo(models.Model):
	reciever = models.CharField(max_length=50, verbose_name='reciever_name')
	address = models.TextField(verbose_name='recive_address')
	phone = models.CharField(max_length=11, verbose_name='reciever_phone', unique=True)
	postcode = models.CharField(max_length=6)
	def __str__(self):
		return '%s\t%s %s'%(self.reciever, self.address, self.phone)
class Order(models.Model):
	p_methods = ((1, 'online'),(0, 'cash'))
	code = models.CharField(max_length=10, verbose_name='order_code')
	createAt = models.DateTimeField(auto_now_add=True)
	updateAt = models.DateTimeField(auto_now=True)
	customer = models.ForeignKey(Customer, on_delete=models.DO_NOTHING, verbose_name='customer')
	goodsList = JSONField()
	rcvInfo = models.ForeignKey(RecieveInfo, on_delete=models.DO_NOTHING, verbose_name='reciever_info')
	totalPrice = models.DecimalField(max_digits=15, decimal_places=2, verbose_name='total_price')
	isPaid = models.BooleanField()
	payment_method = models.PositiveIntegerField(max_length=2, verbose_name='payment method', choices=p_methods, default=1)
	isDelivered = models.BooleanField()
	remarks = models.TextField(default='None')
