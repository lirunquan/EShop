# Generated by Django 2.2 on 2019-06-28 20:31

import apps.goods.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('goods', '0002_auto_20190629_0417'),
    ]

    operations = [
        migrations.AlterField(
            model_name='goods',
            name='picture',
            field=models.ImageField(blank=True, default='goods/default.png', upload_to=apps.goods.models.pic_path_name),
        ),
    ]
