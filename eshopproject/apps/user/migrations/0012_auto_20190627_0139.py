# Generated by Django 2.2 on 2019-06-26 17:39

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0011_auto_20190626_0004'),
    ]

    operations = [
        migrations.AddField(
            model_name='clerk',
            name='isOnline',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='customer',
            name='isOnline',
            field=models.BooleanField(default=False),
        ),
    ]