from django.db import models
from django.utils import timezone
from django_mysql.models import JSONField
from apps.goods.models import Goods
from apps.user.models import Customer, RecieveInfo
import time
# Create your models here.
class Order(models.Model):
	p_methods = ((1, 'online'),(0, 'cash'))
	code = models.CharField(max_length=10, verbose_name='order_code', unique=True)
	createAt = models.DateTimeField(auto_now_add=True)
	updateAt = models.DateTimeField(auto_now=True)
	customer = models.ForeignKey(Customer, on_delete=models.DO_NOTHING, verbose_name='customer')
	goodsList = JSONField()
	rcvInfo = models.ForeignKey(RecieveInfo, on_delete=models.DO_NOTHING, verbose_name='reciever_info')
	totalPrice = models.DecimalField(max_digits=15, decimal_places=2, verbose_name='total_price')
	isPaid = models.BooleanField(default=False)
	payment_method = models.PositiveIntegerField(max_length=2, verbose_name='payment method', choices=p_methods, default=1)
	isDelivered = models.BooleanField(default=False)
	remarks = models.TextField(default='None')
