# Generated by Django 3.2.9 on 2021-12-02 06:13

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('productmanagement', '0006_banner'),
    ]

    operations = [
        migrations.AddField(
            model_name='products',
            name='category_offer_price',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
