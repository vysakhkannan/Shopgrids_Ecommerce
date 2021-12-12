from django.urls import path
from . import views
urlpatterns = [
    path('', views.getuser, name='getuser'),
    path('userstatus/<int:id>', views.user_status, name='user_status')


]