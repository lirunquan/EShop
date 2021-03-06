# Generated by Django 2.2 on 2019-06-28 15:06

from django.db import migrations, models
import django.db.models.deletion
import django_mysql.models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Order',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=10, verbose_name='order_code')),
                ('createAt', models.DateTimeField(auto_now_add=True)),
                ('updateAt', models.DateTimeField(auto_now=True)),
                ('goodsList', django_mysql.models.JSONField(default=dict)),
                ('totalPrice', models.DecimalField(decimal_places=2, max_digits=15, verbose_name='total_price')),
                ('isPaid', models.BooleanField()),
                ('payment_method', models.PositiveIntegerField(choices=[(1, 'online'), (0, 'cash')], default=1, max_length=2, verbose_name='payment method')),
                ('isDelivered', models.BooleanField()),
                ('remarks', models.TextField(default='None')),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='user.Customer', verbose_name='customer')),
                ('rcvInfo', models.ForeignKey(on_delete=django.db.models.deletion.DO_NOTHING, to='user.RecieveInfo', verbose_name='reciever_info')),
            ],
        ),
    ]
