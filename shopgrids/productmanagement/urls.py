from django.urls import path
from django.urls.conf import include
from . import views
urlpatterns = [
    path('', views.product_management, name='product_management'),
    path('add_products', views.add_products, name="add_products"),
    path('delete_product_product', views.delete_product_product, name="delete_product_product"),
    path('edit_product/<int:id>', views.edit_product, name='edit_product'),
    path('banner_management/', views.banner_management, name='banner_management'),
    path('add_banner', views.add_banner, name= 'add_banner'),
    path('product_offer_update', views.product_offer_update, name= 'product_offer_update'),
    path('product_offer_delete', views.product_offer_delete, name= 'product_offer_delete'),
    path('coupon_management', views.coupon_management, name= 'coupon_management'),
    path('add_coupon', views.add_coupon, name= 'add_coupon'),
    path('delete_coupon', views.delete_coupon, name= 'delete_coupon'),
    path('delete_banner', views.delete_banner, name= 'delete_banner'),





]
