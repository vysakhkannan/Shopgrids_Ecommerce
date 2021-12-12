from django.contrib.auth.models import User
from django.db import models
from django.db.models.base import Model
from django.db.models.deletion import CASCADE
from productmanagement.models import Products
from useraccount.models import Accounts

# Create your models here.


class CartItems(models.Model):
    user            = models.ForeignKey(Accounts,on_delete=models.CASCADE, blank=True, null= True)
    products_id     = models.ForeignKey(Products,on_delete=models.CASCADE)
    anonymous_user  = models.CharField(max_length=50, blank=True)
    quantity        = models.IntegerField(null=True)
    sub_total       = models.IntegerField(null=True)
    is_active       = models.BooleanField(default = True)
    buy_now         = models.BooleanField(default = False)


class UserAddress(models.Model):
    first_name      = models.CharField(max_length = 50, blank = True)
    last_name       = models.CharField(max_length=50, blank= True)
    email           = models.EmailField(max_length=50, unique=True, blank=True)
    phone_number    = models.CharField(max_length=50, blank= True)
    address         = models.CharField(max_length = 100, blank=True)
    city            = models.CharField(max_length = 50, blank = True)
    post_code       = models.IntegerField(null=True)
    country         = models.CharField(max_length = 50, blank = True)
    state           = models.CharField(max_length= 50, blank=True)
    user            = models.ForeignKey(Accounts,on_delete = models.CASCADE)


class Order(models.Model):
    order_id            = models.CharField(max_length = 50, blank = True)
    payment_method      = models.CharField(max_length = 50, blank = True)
    user                = models.ForeignKey(Accounts,on_delete=models.CASCADE)
    delivered_address   = models.CharField(max_length=200, blank= True)
    grand_total         = models.IntegerField(null=True)
    delivery_status     = models.CharField(max_length = 50, blank = True)
    payment_status      = models.CharField(max_length = 50, blank = True)
    ordered_date        = models.DateField(auto_now=True, null=True)

class OrderItems(models.Model):
    order           = models.ForeignKey(Order,on_delete=models.CASCADE)
    user            = models.ForeignKey(Accounts,on_delete=models.CASCADE)
    products_id     = models.ForeignKey(Products,on_delete=models.CASCADE)
    anonymous_user  = models.CharField(max_length=50, blank=True)
    quantity        = models.IntegerField(null=True)
    sub_total       = models.IntegerField(null=True)
    is_active       = models.BooleanField(default = True)


# payment models

class Payment(models.Model):
    user            = models.ForeignKey(Accounts, on_delete = models.CASCADE, blank= True)
    payment_id      = models.CharField(max_length=100, blank=True)
    payment_method  = models.CharField(max_length=50, blank=True)
    order           = models.ForeignKey(Order,on_delete=models.CASCADE, blank=True, null= True)
    amount_paid     = models.IntegerField(null=True)
    status          = models.CharField(max_length=100, blank=True)



class Wishlist(models.Model):
    user            = models.ForeignKey(Accounts,on_delete=models.CASCADE, blank=True, null= True)
    products_id     = models.ForeignKey(Products,on_delete=models.CASCADE)
    is_active       = models.BooleanField(default = True)
