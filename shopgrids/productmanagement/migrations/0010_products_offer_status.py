# Generated by Django 3.2.9 on 2021-12-03 10:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('productmanagement', '0009_rename_category_offer_price_products_old_sale_price'),
    ]

    operations = [
        migrations.AddField(
            model_name='products',
            name='offer_status',
            field=models.CharField(blank=True, default=True, max_length=100, null=True),
        ),
    ]