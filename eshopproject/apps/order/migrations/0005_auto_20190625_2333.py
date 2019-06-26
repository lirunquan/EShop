# Generated by Django 2.2 on 2019-06-25 23:33

from django.db import migrations, models
import django.utils.timezone

class Migration(migrations.Migration):

    dependencies = [
        ('order', '0004_auto_20190625_2330'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='createAt',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='create_at'),
        ),
        migrations.AlterField(
            model_name='order',
            name='updateAt',
            field=models.DateTimeField(default=django.utils.timezone.now, verbose_name='update_at'),
        ),
    ]