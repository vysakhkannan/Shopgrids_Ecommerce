from django.shortcuts import render,redirect
from django.views.decorators.csrf import csrf_exempt
from cart.models import Order, OrderItems
from productmanagement.models import Products
import datetime
from django.contrib import messages
from django.http.response import JsonResponse



# Create your views here.


def order_management(request):
    orders = Order.objects.all().order_by('id')

    context = {
        'orders' : orders
    }
    return render(request, 'admin/order_management.html', context)


def view_order(request,id):
    order_id = Order.objects.get(id = id)
    order_items = OrderItems.objects.filter(order = order_id)
    products = Products.objects.all()

    grand_total = 0
    for item in order_items:
        grand_total += item.sub_total

    context = {
        'order_items' : order_items,
        'grand_total' : grand_total,
        'products' : products
    }
    return render(request, 'admin/view_order.html', context)


@csrf_exempt
def change_status(request):
    if request.method == 'POST':
        status = request.POST['status']
        order_id = request.POST['order_id']
        order = Order.objects.get(id = order_id)
        order.delivery_status = status
        order.save()
        return JsonResponse('', safe=False)


# daily sales report

def daily_sales_report(request):

    if request.method == 'POST':

        date1 = request.POST['date1']
        date2 = request.POST['date2']
        print(date1)
        print(date2)
        orders = Order.objects.filter(ordered_date__range = [date1, date2])
        context={
            'orders' : orders
        }
        return render(request, 'admin/daily_sales_report.html', context)


    else:


        orders = Order.objects.all()

        context = {
            'orders' : orders
        }

        return render(request, 'admin/daily_sales_report.html', context)

    
# weekly sales report

def weekly_sales_report(request):

    if request.method == 'POST':

        if request.POST['week1'] and request.POST['week2']:
            week1 = request.POST['week1']
            week2 = request.POST['week2']


            date_object1 = datetime.datetime.strptime(week1 + '-1', "%Y-W%W-%w")
            date_object2 = datetime.datetime.strptime(week2 + '-6', "%Y-W%W-%w")

            first_day_of_week1 = date_object1.date()
            last_day_of_week2 = date_object2.date()

            print(first_day_of_week1)
            print(last_day_of_week2)
            orders = Order.objects.filter(ordered_date__range = [first_day_of_week1, last_day_of_week2])
            context={
                'orders' : orders
            }
            return render(request, 'admin/weekly_sales_report.html', context)

        elif request.POST['week1']:
            week1 = request.POST['week1']
            date_object1 = datetime.datetime.strptime(week1 + '-1', "%Y-W%W-%w")
            date_object2 = datetime.datetime.strptime(week1 + '-6', "%Y-W%W-%w")

            first_day_of_week1 = date_object1.date()
            last_day_of_week1 = date_object2.date()

            orders = Order.objects.filter(ordered_date__range = [first_day_of_week1, last_day_of_week1])

            context={
                'orders' : orders
            }

            return render(request, 'admin/weekly_sales_report.html', context)

        elif request.POST['week2']:
            week2 = request.POST['week2']
            date_object1 = datetime.datetime.strptime(week2 + '-1', "%Y-W%W-%w")
            date_object2 = datetime.datetime.strptime(week2 + '-6', "%Y-W%W-%w")

            first_day_of_week2 = date_object1.date()
            last_day_of_week2 = date_object2.date()

            orders = Order.objects.filter(ordered_date__range = [first_day_of_week2, last_day_of_week2])

            context={
                'orders' : orders
            }

            return render(request, 'admin/weekly_sales_report.html', context)


        else:
        
            orders = Order.objects.all()


            context = {
                'orders' : orders
            }

            return render(request, 'admin/weekly_sales_report.html', context)




    else:


        orders = Order.objects.all()

        context = {
            'orders' : orders
        }

        return render(request, 'admin/weekly_sales_report.html', context)

# Yearly report

def yearly_sales_report(request):

    if request.method == 'POST':

        if request.POST['year1'] and request.POST['year2']:

            current_year = int(datetime.date.today().year)



            year1 = request.POST.get('year1')+"-01-01"

            year2 = request.POST.get('year2')+"-01-01"

            int_year1 = int(request.POST['year1'])
            int_year2 = int(request.POST['year2'])

            if int_year1 <= current_year and int_year2 <= current_year and int_year1 >= 999 and int_year2 >= 999:


                orders = Order.objects.filter(ordered_date__range = [year1, year2])

                context = {
                'orders' : orders,
                }

                return render(request, 'admin/yearly_sales_report.html', context)

            else:

                messages.info(request, "The list of years were Invalid")
                return redirect('yearly_sales_report')

        elif request.POST['year1']:
            current_year = int(datetime.date.today().year)

            year = int(request.POST['year1'])

            year1 = request.POST.get('year1')+"-01-01"
            dummy_year = request.POST.get('year1')+"-12-31"

            if year <= current_year and year >= 999:

                orders = Order.objects.filter(ordered_date__range = [year1, dummy_year])

                context = {

                    'orders' : orders,

                }

                return render(request, 'admin/yearly_sales_report.html', context)

            else:

                messages.info(request, "Year Doesn't Exist")
                return redirect('yearly_sales_report')


        elif request.POST['year2']:

            current_year = int(datetime.date.today().year)

            year = int(request.POST['year1'])

            year2 = request.POST.get('year2')+"-01-01"
            dummy_year = request.POST.get('year2')+"-12-31"

            orders = Order.objects.filter(ordered_date__range = [year2, dummy_year])

            if year <= current_year and year >= 999:

                orders = Order.objects.filter(ordered_date__range = [year2, dummy_year])

                context = {

                    'orders' : orders,

                }

                return render(request, 'admin/yearly_sales_report.html', context)

            else:

                messages.info(request, "Year Doesn't Exist")
                return redirect('yearly_sales_report')




    else:


        orders = Order.objects.all()


        years = datetime.date.today().year


        context = {
            'orders' : orders,
            'years' : years
        }

        return render(request, 'admin/yearly_sales_report.html', context)

