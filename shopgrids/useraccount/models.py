import builtins
from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.contrib.auth.models import User
from django.db.models.fields.related import ForeignKey

# Create your models here.
class MyAccountManager(BaseUserManager):
    def create_user(self,first_name,last_name, username, email,password=None):
        if not email:
            raise ValueError('User must have an email address')

        if not username:
            raise ValueError('User must have an username')

        user = self.model(
            email = self.normalize_email(email),
            username = username,
            first_name = first_name,
            last_name = last_name,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self,first_name,last_name, email, username, password):
        user = self.create_user(
            email = self.normalize_email(email),
            username = username,
            password = password,
            first_name = first_name,
            last_name = last_name,
        )
        user.is_admin = True
        user.is_active = True
        user.is_staff = True
        user.is_superadmin = True
        user.save(using=self._db)
        return user


class Accounts(AbstractBaseUser):
    first_name      =   models.CharField(max_length=50, blank=True)
    last_name       =   models.CharField(max_length=50, blank=True)
    username        =   models.CharField(max_length=50, unique=True, blank=True)
    email           =   models.EmailField(max_length=50, unique=True, blank=True)
    phone_number    =   models.CharField(max_length=50, blank=True)

    #required

    date_joined     =   models.DateTimeField(auto_now_add=True)
    last_joined     =   models.DateTimeField(auto_now_add=True)
    is_admin        =   models.BooleanField(default=False)
    is_staff        =   models.BooleanField(default=False)
    is_active       =   models.BooleanField(default=True)
    is_superadmin   =   models.BooleanField(default=False)
    wallet_amount   =   models.IntegerField(default=0, null=True, blank=True)
    referral_code   =   models.CharField(max_length=50, blank=True, null=True)



    objects = MyAccountManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['email','first_name', 'last_name']

    def has_perm(self, perm, obj=None):
        return self.is_admin

    def has_module_perms(self, add_label):
        return True



