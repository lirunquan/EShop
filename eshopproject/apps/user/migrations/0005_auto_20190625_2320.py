# Generated by Django 2.2 on 2019-06-25 23:20

from django.db import migrations, models
import django.utils.timezone

class Migration(migrations.Migration):

    dependencies = [
        ('user', '0004_auto_20190625_2318'),
    ]

    operations = [
        migrations.AlterField(
            model_name='clerk',
            name='lastLogin',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='last_login'),
        ),
        migrations.AlterField(
            model_name='customer',
            name='lastLogin',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='last_login'),
        ),
    ]