from django.urls import path
from . import views
urlpatterns = [
    path('single_product_view/<int:id>', views.single_product_view, name='single_product_view'),
    path('product_grid_view/<int:id>', views.product_grid_view, name='product_grid_view'),
    path('view_all_products/', views.view_all_products, name='view_all_products'),






]
