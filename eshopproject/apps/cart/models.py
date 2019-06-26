from django.db import models
from django_mysql.models import JSONField
from apps.user.models import Customer
# Create your models here.
class Cart(models.Model):
	customer = models.ForeignKey(Customer, on_delete=models.CASCADE, verbose_name='owner')
	goodsList = JSONField()
