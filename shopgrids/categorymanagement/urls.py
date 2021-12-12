from django.urls import path
from . import views
urlpatterns = [
    path('', views.category, name='category'),
    path('add_category', views.add_category, name='add_category'),
    path('edit/<int:id>', views.edit_category, name = 'edit_category'),
    path('delete_category',views.delete_category, name = 'delete_category'),
    path('sub_category', views.sub_category, name="sub_category"),
    path('add_sub_category', views.add_sub_category,name="add_sub_category"),
    path('delete_sub_category/', views.delete_sub_category, name = "delete_sub_category"),
    path('edit_sub_category/<int:id>', views.edit_sub_category, name='edit_sub_category'),
    path('offer_management/', views.offer_management, name='offer_management'),
    path('add_offer/', views.add_offer, name='add_offer'),
    path('delete_offer/', views.delete_offer, name='delete_offer'),
    path('category_offer_update/', views.category_offer_update, name='category_offer_update'),
    path('category_offer_delete/', views.category_offer_delete, name='category_offer_delete'),


    




]