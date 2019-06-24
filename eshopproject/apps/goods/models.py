from django.db import models
from django_mysql.models import JSONField, ListCharField
# Create your models here.
class Goods(models.Model):
	isbncode = models.CharField(max_length=13, unique=True, verbose_name='ISBN_code')
	name = models.CharField(max_length=50, verbose_name='name')
	price = models.DecimalField(max_digits=8, decimal_places=2, verbose_name='price')
	params = JSONField()
	pictures = ListCharField(base_field=models.CharField(max_length=20), size=7, max_length=(7*21))
	detail = models.CharField(max_length=20, unique=True, verbose_name='details(.html)')
	repertory = models.PositiveIntegerField()
	gtype = models.CharField(max_length=20, verbose_name='goods_type')
	isselling = models.BooleanField(blank=False)
	tags = ListCharField(base_field=models.CharField(max_length=5), size=5, max_length=(5*6))