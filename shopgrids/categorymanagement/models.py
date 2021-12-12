from django.db import models
from django.db.models.deletion import CASCADE
from django.db.models.fields import DateField

# Create your models here.

class Category(models.Model):
    category_name   = models.CharField(max_length = 100)
    slug            = models.CharField(max_length  =100, unique=True)
    description     = models.TextField(blank = True)
    offer_name      = models.CharField(max_length=200, null=True, blank= True)
    offer_percent   = models.IntegerField(null=True, blank= True)
    expiry_date     = models.DateField(null=True, blank= True)
    offer_status    = models.CharField(max_length=100, default=False, null=True, blank= True)





    def __str__(self):
        return self.category_name



class SubCategory(models.Model):
    sub_category_name   = models.CharField(max_length=100)
    catergory_id        = models.ForeignKey(Category, on_delete = models.CASCADE, blank=True )
    slug                = models.CharField(max_length  =100, unique=True)
    description         = models.TextField(blank = True)


class Offer(models.Model):
    offer_name           = models.CharField(max_length=100, null=True)
    offer_percent        = models.IntegerField()
    expiry_date          = models.DateField()
    expiry_time          = models.TimeField(null=True, blank=True)
    offer_status         = models.CharField(max_length=100, default=True, null=True, blank= True)

