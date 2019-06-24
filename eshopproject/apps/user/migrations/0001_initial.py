# Generated by Django 2.2 on 2019-06-24 23:08

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Clerk',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=20, unique=True, verbose_name='username')),
                ('password', models.CharField(max_length=40, verbose_name='password')),
                ('realname', models.CharField(max_length=50, verbose_name='real_name')),
                ('group', models.CharField(max_length=10)),
                ('jobnumber', models.CharField(max_length=11)),
            ],
            options={
                'abstract': False,
            },
        ),
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('username', models.CharField(max_length=20, unique=True, verbose_name='username')),
                ('password', models.CharField(max_length=40, verbose_name='password')),
                ('realname', models.CharField(max_length=50, verbose_name='real_name')),
                ('group', models.CharField(max_length=10)),
                ('phone', models.CharField(max_length=11, unique=True, verbose_name='phone_number')),
                ('email', models.EmailField(max_length=254, unique=True, verbose_name='email')),
            ],
            options={
                'abstract': False,
            },
        ),
    ]
