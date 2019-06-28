# Generated by Django 2.2 on 2019-06-28 15:06

from django.db import migrations, models
import django_mysql.models
import tinymce.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Goods',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('isbnCode', models.CharField(max_length=13, unique=True, verbose_name='ISBN_code')),
                ('name', models.CharField(max_length=50, verbose_name='name')),
                ('price', models.DecimalField(decimal_places=2, max_digits=8, verbose_name='price')),
                ('params', django_mysql.models.JSONField(default=dict)),
                ('pictures', django_mysql.models.ListCharField(models.CharField(max_length=20), max_length=147, size=7)),
                ('detail', tinymce.models.HTMLField(max_length=200, verbose_name='details(.html)')),
                ('repertory', models.PositiveIntegerField(verbose_name='repertory')),
                ('gType', models.CharField(max_length=20, verbose_name='goods_type')),
                ('isSelling', models.BooleanField()),
                ('tags', django_mysql.models.ListCharField(models.CharField(max_length=5), max_length=30, size=5)),
            ],
        ),
    ]
