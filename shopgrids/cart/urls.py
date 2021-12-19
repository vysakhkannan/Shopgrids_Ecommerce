from django.contrib import admin
from django.urls import path
from django.urls.conf import include

from cart import context_processor
from . import views

urlpatterns = [
    path('view_cart/', views.view_cart, name='view_cart'),
    path('add_cart/', views.add_cart, name='add_cart'),
    path('product_increment/', views.product_increment, name='product_increment'),
    path('product_decrement/', views.product_decrement, name='product_decrement'),
    path('checkout/<id>/<int:prd_id>', views.checkout, name='checkout'),
    path('add_address/', views.add_address, name='add_address'),
    path('place_order/<id>/<int:prd_id>', views.place_order, name='place_order'),
    path('delete_product/', views.delete_product, name = 'delete_product'),
    path('paypal_payment/', views.paypal_payment, name='paypal_payment'),
    path('paypal_payment_success/', views.paypal_payment_success, name='paypal_payment_success'),
    path('razor_pay_details/', views.razor_pay_details, name='razor_pay_details'),
    path('payment_error/', views.payment_error, name='payment_error'),
    path('coupon_apply/',views.coupon_apply, name='coupon_apply'),
    path('wallet_amount_check/', views.wallet_amount_check, name='wallet_amount_check'),
    path('wishlist/', views.wishlist, name='wishlist'),
    path('add_to_wishlist/', views.add_to_wishlist, name='add_to_wishlist'),
    path('delete_wishlist_item/', views.delete_wishlist_item, name='delete_wishlist_item'),
    path('buy_now/<int:prd_id>', views.buy_now, name='buy_now'),

    



]
