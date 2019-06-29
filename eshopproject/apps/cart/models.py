from django.db import models
from django_mysql.models import JSONField
from apps.user.models import Customer
# Create your models here.
def df_json():
	return {'list':[]}
class Cart(models.Model):
	customer = models.OneToOneField(Customer, on_delete=models.CASCADE, verbose_name='owner')
	goodsList = JSONField(default=df_json)
