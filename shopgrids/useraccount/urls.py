from django.urls import path
from . import views
urlpatterns = [
    path('login/', views.login, name='login'),
    path('register/', views.register, name='register'),
    path('logout/', views.logout, name= 'logout'),
    path('otp_login/', views.otp_login, name= 'otp_login'),
    path('verify_otp/', views.verify_otp, name= 'verify_otp'),
    path('my_account', views.my_account, name= 'my_account'),
    path('change_account_details/', views.change_account_details, name='change_account_details'),
    path('change_password/', views.change_password, name='change_password'),
    path('my_orders/',views.my_orders, name='my_orders'),
    path('cancel_order/', views.cancel_order, name="cancel_order"),
    path('my_address/', views.my_address, name='my_address'),
    path('my_account_address_edit/<int:id>', views.my_account_address_edit, name='my_account_address_edit'),
    path('delete_address/', views.delete_address, name='delete_address')



]