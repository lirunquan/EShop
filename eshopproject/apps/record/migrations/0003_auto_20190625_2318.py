# Generated by Django 2.2 on 2019-06-25 23:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('record', '0002_auto_20190625_2257'),
    ]

    operations = [
        migrations.AlterField(
            model_name='deliver',
            name='createAt',
            field=models.DateTimeField(auto_now_add=True),
        ),
        migrations.AlterField(
            model_name='purchase',
            name='createAt',
            field=models.DateTimeField(auto_now_add=True),
        ),
    ]