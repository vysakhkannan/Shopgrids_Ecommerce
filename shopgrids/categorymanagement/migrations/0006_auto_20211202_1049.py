# Generated by Django 3.2.9 on 2021-12-02 10:49

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('categorymanagement', '0005_rename_category_offer_name_offer_offer_name'),
    ]

    operations = [
        migrations.AddField(
            model_name='category',
            name='expiry_date',
            field=models.DateField(blank=True, null=True),
        ),
        migrations.AddField(
            model_name='category',
            name='offer_name',
            field=models.CharField(blank=True, max_length=200, null=True),
        ),
        migrations.AddField(
            model_name='category',
            name='offer_percent',
            field=models.IntegerField(blank=True, null=True),
        ),
    ]
