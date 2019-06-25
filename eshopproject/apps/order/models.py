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
class Order(models.Model):
	code = models.CharField(max_length=10, verbose_name='order_code')
	createAt = models.DateTimeField(verbose_name='create_at', default=str(timezone.now()))
	updateAt = models.DateTimeField(verbose_name='update_at', default=str(timezone.now()))
	customer = models.ForeignKey(Customer, on_delete=models.DO_NOTHING, verbose_name='customer')
	goodsList = JSONField()
	rcvInfo = models.ForeignKey(RecieveInfo, on_delete=models.DO_NOTHING, verbose_name='reciever_info')
	totalPrice = models.DecimalField(max_digits=15, decimal_places=2, verbose_name='total_price')
	isPaid = models.BooleanField()
	isDelivered = models.BooleanField()
	remarks = models.TextField(default='None')
