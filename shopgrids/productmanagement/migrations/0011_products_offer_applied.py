# Generated by Django 3.2.9 on 2021-12-03 14:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('productmanagement', '0010_products_offer_status'),
    ]

    operations = [
        migrations.AddField(
            model_name='products',
            name='offer_applied',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
    ]
