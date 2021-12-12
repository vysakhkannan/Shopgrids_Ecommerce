from django.urls import path
from . import views
urlpatterns = [
    path('', views.order_management, name='order_management'),
    path('view_order/<int:id>', views.view_order, name="view_order" ),
    path('change_status', views.change_status, name="change_status" ),
    path('daily_sales_report/', views.daily_sales_report, name='daily_sales_report'),
    path('weekly_sales_report/', views.weekly_sales_report, name='weekly_sales_report'),
    path('yearly_sales_report/', views.yearly_sales_report, name='yearly_sales_report')




]