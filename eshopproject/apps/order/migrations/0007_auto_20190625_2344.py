# Generated by Django 2.2 on 2019-06-25 23:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('order', '0006_auto_20190625_2339'),
    ]

    operations = [
        migrations.AlterField(
            model_name='order',
            name='createAt',
            field=models.DateTimeField(default='2019-06-25 23:44:29.343760', verbose_name='create_at'),
        ),
        migrations.AlterField(
            model_name='order',
            name='updateAt',
            field=models.DateTimeField(default='2019-06-25 23:44:29.343788', verbose_name='update_at'),
        ),
    ]