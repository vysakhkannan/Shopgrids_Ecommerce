# Generated by Django 3.2.9 on 2021-11-20 07:12

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('cart', '0003_cartitems_sub_total'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserAddress',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('first_name', models.CharField(blank=True, max_length=50)),
                ('last_name', models.CharField(blank=True, max_length=50)),
                ('email', models.EmailField(blank=True, max_length=50, unique=True)),
                ('phone_number', models.IntegerField(null=True)),
                ('address', models.CharField(blank=True, max_length=100)),
                ('city', models.CharField(blank=True, max_length=50)),
                ('post_code', models.IntegerField(null=True)),
                ('country', models.CharField(blank=True, max_length=50)),
                ('state', models.CharField(blank=True, max_length=50)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
