# Generated by Django 3.2.9 on 2021-11-19 09:42

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('cart', '0002_auto_20211118_0723'),
    ]

    operations = [
        migrations.AddField(
            model_name='cartitems',
            name='sub_total',
            field=models.IntegerField(null=True),
        ),
    ]
