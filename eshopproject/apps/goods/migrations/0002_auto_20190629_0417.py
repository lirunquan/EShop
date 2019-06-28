# Generated by Django 2.2 on 2019-06-28 20:17

import apps.goods.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0001_initial'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='goods',
            name='pictures',
        ),
        migrations.AddField(
            model_name='goods',
            name='picture',
            field=models.ImageField(blank=True, upload_to=apps.goods.models.pic_path_name),
        ),
    ]
