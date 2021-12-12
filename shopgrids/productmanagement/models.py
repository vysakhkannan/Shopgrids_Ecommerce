from django.contrib.auth.models import User
from django.db import models
from django.db.models.deletion import CASCADE
from django.db.models.fields.related import ForeignKey

from categorymanagement.models import Category, SubCategory
from useraccount.models import Accounts

# Create your models here.

class Products(models.Model):
    product_name            = models.CharField(max_length=200,unique=True)
    slug                    = models.CharField(max_length=250,unique=True)
    description             = models.TextField(blank = True)
    mrp                     = models.FloatField()
    sale_price              = models.IntegerField()
    stocks                  = models.IntegerField()
    product_cover           = models.ImageField(upload_to ='photos/products',blank=True)
    is_available            = models.BooleanField(default = True)
    category                = models.ForeignKey(Category, on_delete = models.CASCADE, blank=True, null=True)
    sub_category            = models.ForeignKey(SubCategory, on_delete = models.CASCADE, blank=True)
    created_date            = models.DateTimeField(auto_now_add = True)
    modified_date           = models.DateTimeField(auto_now_add = True)
    old_sale_price          = models.IntegerField(null=True, blank=True)
    offer_name              = models.CharField(max_length=200, null=True, blank= True)
    offer_percent           = models.IntegerField(null=True, blank= True)
    expiry_date             = models.DateField(null=True, blank= True)
    offer_status            = models.CharField(max_length=100, default=False, null=True, blank= True)
    offer_applied           = models.CharField(max_length=200, null=True, blank= True)


    def __str__(self):
        return self.product_name


class ImageGallery(models.Model):
    product_id      = models.ForeignKey(Products, on_delete = models.CASCADE, blank=True)
    image           = models.ImageField(upload_to ='photos/products')


class Banner(models.Model):
    image           = models.ImageField(upload_to ='photos/banners')
    product         = models.ForeignKey(Products, on_delete = models.CASCADE, blank=True)
    description     = models.TextField(blank = True)

class Coupon(models.Model):
    coupon_id       = models.CharField(max_length=50,unique=True)
    coupon_name     = models.CharField(max_length=50,unique=True)
    coupon_percent  = models.IntegerField()
    expiry_date     = models.DateField(null=True)
    coupon_status   = models.BooleanField(default = False)
    expiry_time     = models.TimeField(null=True)


class ExpiredCoupon(models.Model):
    coupon = models.ForeignKey(Coupon,on_delete=CASCADE, blank=True)
    user   = models.ForeignKey(Accounts, on_delete=CASCADE, blank=True)


