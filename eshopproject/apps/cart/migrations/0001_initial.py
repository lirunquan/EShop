# Generated by Django 2.2 on 2019-06-26 17:41

from django.db import migrations, models
import django.db.models.deletion
import django_mysql.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0012_auto_20190627_0139'),
    ]

    operations = [
        migrations.CreateModel(
            name='Cart',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('goodsList', django_mysql.models.JSONField(default=dict)),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.Customer', verbose_name='owner')),
            ],
        ),
    ]
