# Generated by Django 3.2.9 on 2021-12-07 12:40

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('useraccount', '0006_accounts_refereral_code'),
    ]

    operations = [
        migrations.RenameField(
            model_name='accounts',
            old_name='refereral_code',
            new_name='referral_code',
        ),
    ]
