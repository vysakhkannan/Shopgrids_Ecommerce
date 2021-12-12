from django.urls import path
from django.urls.conf import include
from . import views
urlpatterns = [
    path('', views.adminlogin, name='adminlogin'),
    path('adminlogout', views.adminlogout, name='adminlogout'),


]