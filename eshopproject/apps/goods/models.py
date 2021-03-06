from django.db import models
from django_mysql.models import JSONField, ListCharField
from tinymce.models import HTMLField
# Create your models here.
def pic_path_name(instance, filename):
	ext = filename.split('.')[-1]
	return 'goods/pic/{0}/pic.{1}'.format(instance.isbnCode, ext)
class Goods(models.Model):
	isbnCode = models.CharField(max_length=13, unique=True, verbose_name='ISBN_code')
	name = models.CharField(max_length=50, verbose_name='name')
	cost = models.FloatField(verbose_name='进货价', default=0.0)
	price = models.FloatField(verbose_name='price', default=0.0)
	producer = models.TextField(default='', blank=True, null=True)
	params = JSONField(blank=True, null=True)
	picture = models.ImageField(upload_to=pic_path_name, blank=True, default='goods/default.png')
	detail = HTMLField(max_length=200, verbose_name='details(.html)', blank=True, null=True)
	repertory = models.PositiveIntegerField(verbose_name='repertory', default=0)
	gType = models.CharField(max_length=20, verbose_name='goods_type', blank=True, null=True)
	isSelling = models.BooleanField(default=False, blank=False)
	#tags = ListCharField(base_field=models.CharField(max_length=5, null=True), size=5, max_length=(5*6), null=True)
	def __str__(self):
		return '%s[%s]'%(self.name, self.isbnCode)
	
