from django.shortcuts import render, redirect
from django.contrib.auth.models import auth, User
from django.contrib import messages
from django.views.decorators.cache import never_cache
from productmanagement.models import Products
from categorymanagement.models import Category

from cart.models import Order, OrderItems, Payment


# Create your views here.
@never_cache
def adminlogin(request):
    if request.session.has_key('admin'):

        orders = Order.objects.exclude(delivery_status = 'cancelled')

        total_sales = 0
        count = 0
        for order in orders:
            total_sales += order.grand_total
            count +=1

        # Order items

        ordered_items = OrderItems.objects.all()
        order_item_count = 0

        for ordered_item in ordered_items:
            order_item_count +=1

        # Average 
        try :

            sales = total_sales / order_item_count

        except:

            pass

        average_sales = round(sales, 2)

        # Delivered order

        orders_delivered = Order.objects.filter(delivery_status = 'delivered')
        delivered_item = 0
        for delivered in orders_delivered:
            delivered_item += 1

        

        orders = Order.objects.distinct('payment_method')

        cash_on_delivery = Order.objects.filter(payment_method = 'cash_on_delivery')
        cod_total = 0
        for cod in cash_on_delivery:
            cod_total += cod.grand_total

        razor_pay = Order.objects.filter(payment_method = 'razor_pay')
        razor_total = 0
        for razor in razor_pay:
            razor_total += razor.grand_total


        PayPal = Order.objects.filter(payment_method = 'PayPal')
        paypal_total = 0
        for paypal in PayPal:
            paypal_total += paypal.grand_total

        wallet_pay = Order.objects.filter(payment_method = 'wallet_pay')
        wallet_total = 0
        for wallet in wallet_pay:
            wallet_total += wallet.grand_total

        
        # Finding the sale graph based on category

        order_items = OrderItems.objects.all()
        categories = Category.objects.all()


        mobile_phones_count = 0
        laptop_count = 0
        for items in order_items:

            for category in categories:

                if items.products_id.category.category_name == 'mobile phones' :

                    mobile_phones_count += items.sub_total
                    

                else:

                    laptop_count += items.sub_total


        categories = Category.objects.all()
        items_ordered = OrderItems.objects.all()

        category_dict = {}
        category_price = {}
        sale_price = 0
        for category in categories:

            # category = Category.objects.get(id = category_id)

            category_id = category.id
            category_name = category.category_name

            for items in items_ordered:

                if items.products_id.category.id == category_id:

                    sale_price += items.sub_total


            category_dict[category_name] = sale_price
            category_price[sale_price] = category_name
    
        
        context = {
            'total_sales' : total_sales,
            'order_item_count' : order_item_count,
            'average_sales' : average_sales,
            'delivered_item' : delivered_item,
            'orders' : orders,
            'cod_total' : cod_total,
            'razor_total' : razor_total,
            'paypal_total' : paypal_total,
            'wallet_total' : wallet_total,
            'mobile_phones_count' : mobile_phones_count,
            'laptop_count' : laptop_count,
            'category_dict': category_dict,
            'category_price' : category_price


        }



        return render(request, 'admin/adminhome.html', context)

    elif request.method == 'POST':

        username = request.POST['username']
        password = request.POST['password']


        admin = auth.authenticate(username = username, password = password)

        if admin is not None and admin.is_superadmin:
     
            request.session['admin'] = True
            auth.login(request,admin)
            return redirect('adminlogin')

        else:
            messages.info(request, 'Invalid credential')
            return redirect('adminlogin')

    else:
        
        return render(request, 'admin/adminlogin.html')

        
@never_cache
def adminlogout(request):
    if request.session.has_key('admin'):
        del request.session['admin']
        auth.logout(request)
        return redirect('adminlogin')


