# Generated by Django 2.2 on 2019-06-25 23:39

from django.db import migrations, models
import django.utils.timezone

class Migration(migrations.Migration):

    dependencies = [
        ('record', '0005_auto_20190625_2333'),
    ]

    operations = [
        migrations.AlterField(
            model_name='deliver',
            name='createAt',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
        migrations.AlterField(
            model_name='purchase',
            name='createAt',
            field=models.DateTimeField(default=django.utils.timezone.now),
        ),
    ]
