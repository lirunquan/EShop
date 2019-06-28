# Generated by Django 2.2 on 2019-06-28 15:06

from django.db import migrations, models
import django.db.models.deletion
import django_mysql.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
        ('order', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Purchase',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('createAt', models.DateTimeField(auto_now_add=True)),
                ('operation', models.CharField(max_length=8, verbose_name='operation')),
                ('remarks', models.TextField(default='None', verbose_name='remarks')),
                ('goodsList', django_mysql.models.JSONField(default=dict)),
                ('totalPrice', models.DecimalField(decimal_places=2, max_digits=12, verbose_name='total_price')),
                ('clerk', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.Clerk', verbose_name='clerk')),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Deliver',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('createAt', models.DateTimeField(auto_now_add=True)),
                ('operation', models.CharField(max_length=8, verbose_name='operation')),
                ('remarks', models.TextField(default='None', verbose_name='remarks')),
                ('recieveInfo', django_mysql.models.JSONField(default=dict)),
                ('logistics', models.CharField(max_length=40, verbose_name='logistics_company')),
                ('clerk', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.Clerk', verbose_name='clerk')),
                ('order', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='order_deliver', to='order.Order')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
