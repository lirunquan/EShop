from django.db import models
from django.utils import timezone
from django_mysql.models import JSONField
from apps.user.models import Clerk, RecieveInfo
from apps.order.models import Order
import time
# Create your models here.
class Record(models.Model):
	createAt = models.DateTimeField(auto_now_add=True)
	operation = models.CharField(max_length=8, verbose_name='operation')
	remarks = models.TextField(verbose_name='remarks', default='None')
	clerk = models.ForeignKey(Clerk, on_delete=models.CASCADE, verbose_name='clerk')
	class Meta:
		abstract = True

class Purchase(Record):
	goodsList = JSONField()
	totalPrice = models.DecimalField(max_digits=12, decimal_places=2, verbose_name='total_price')
	producer = models.TextField(default='')

class Deliver(Record):
	recieveInfo = models.ForeignKey(RecieveInfo, on_delete=models.CASCADE)
	order = models.ForeignKey(Order, related_name='order_deliver', on_delete=models.CASCADE)
	logistics = models.CharField(max_length=40, verbose_name='logistics_company')
	expressnumber = models.CharField(max_length=15, unique=True, default='')