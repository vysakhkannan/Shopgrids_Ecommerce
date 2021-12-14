from django.contrib.auth.models import AnonymousUser, User
from django.db.models.fields import PositiveIntegerRelDbTypeMixin, json
from django.http.response import JsonResponse
from django.shortcuts import render,redirect
from django.contrib import messages
from productmanagement.models import Coupon, Products, ExpiredCoupon
from useraccount.models import Accounts
from categorymanagement.models import Category, SubCategory
from .models import CartItems, Order, OrderItems, Payment, Wishlist
from django.views.decorators.csrf import csrf_exempt
from .models import UserAddress
import uuid
from django.views.decorators.cache import never_cache
import json
import razorpay
from django.conf import settings
from django.http import HttpResponseBadRequest
from django.contrib.auth.decorators import login_required




# authorize razorpay client with API Keys.
razorpay_client = razorpay.Client(
    auth=(settings.RAZOR_KEY_ID, settings.RAZOR_KEY_SECRET))



# Create your views here.



def _session_id(request):

    session_id = request.session.session_key
    if not session_id:

        session_id = str(uuid.uuid4())
        
    return session_id

        

def view_cart(request):
    if request.session.has_key('userlogin'):
        id = request.user.id
        cart_item = CartItems.objects.filter(user = id,buy_now = False).order_by('id')
        categories = Category.objects.all()
        subcategories = SubCategory.objects.all()
        product = Products.objects.all()
        items = CartItems.objects.filter(user = id, buy_now = False)
        cart_sub_total = 0
        for item in items:
            cart_sub_total = (cart_sub_total + item.sub_total)


        context = {
            'cart_items': cart_item,
            'categories' : categories,
            'subcategories' : subcategories,
            'products' : product,
            'cart_sub_total': cart_sub_total,
        }
        return render(request, 'user/cart.html', context)

    else:

        try:
            
            id = request.session['guest_user']

        except:

            request.session['guest_user'] = _session_id(request)

            id = request.session['guest_user']


        cart_item = CartItems.objects.filter(anonymous_user = id, buy_now = False).order_by('id')
        categories = Category.objects.all()
        subcategories = SubCategory.objects.all()
        product = Products.objects.all()
        items = CartItems.objects.filter(anonymous_user = id, buy_now = False)
        cart_sub_total = 0
        for item in items:
            cart_sub_total = cart_sub_total + item.sub_total
        context = {
            'cart_items': cart_item,
            'categories' : categories,
            'subcategories' : subcategories,
            'products' : product,
            'cart_sub_total': cart_sub_total
        }
        return render(request, 'user/cart.html', context)



@csrf_exempt
def add_cart(request):

    if request.user.is_authenticated:
        product_id = request.POST['product_id']
        user_id = request.user.id

        if request.method == 'POST':

            single_product  = Products.objects.get(id = product_id) 
            user            = Accounts.objects.get(id = user_id)

            if CartItems.objects.filter(products_id = single_product, user = request.user, buy_now = False).first():
                status = 1

                context = {

                    'status' : status
                }
                return JsonResponse(context,safe=False)

            else:
                product_sub_total = single_product.sale_price * 1
                cart    = CartItems(user = user, products_id = single_product, quantity = 1, sub_total = product_sub_total)
                cart.save()
                status = 2

                context = {

                    'status' : status
                }
                return JsonResponse(context,safe=False)

    else:


        product_id = request.POST['product_id']

        try:
            
            guest_user = request.session['guest_user']

        except:

            request.session['guest_user'] = _session_id(request)

            guest_user = request.session['guest_user']


        print(guest_user)
        # print("session add to cart :",s)

        if request.method == 'POST':
            single_product  = Products.objects.get(id = product_id) 
            if CartItems.objects.filter(products_id = single_product, anonymous_user = guest_user, buy_now = False).first():

                return JsonResponse('',safe=False)

            else:
                product_sub_total = single_product.sale_price * 1
                cart    = CartItems(anonymous_user = guest_user, products_id = single_product, quantity = 1, sub_total = product_sub_total)
                cart.save()
                return JsonResponse('',safe=False)


# product increment
@csrf_exempt
def product_increment(request):
    

    if request.user.is_authenticated:  
        user_id = request.user.id
        prd_id = request.POST['prd_id']    
        cart_item = CartItems.objects.get(user = user_id , products_id = prd_id)
        product_id = cart_item.products_id.id
        product = Products.objects.get(id = product_id)

        if cart_item.quantity < product.stocks:
            cart_item.quantity +=1
            cart_item.save()

            cart_item = CartItems.objects.filter(user = user_id, products_id = prd_id, buy_now = False)

        else:
            status = 1
            context = {

                'status' : status

            }
            return JsonResponse(context, safe=False)

        try:
            for i in cart_item:
                price = i.products_id.sale_price
                qnty = i.quantity
                sub_total = (price * qnty)
                i.sub_total = sub_total
                i.save()

        except:
            pass

        user_cart = CartItems.objects.filter(user = user_id, buy_now = False)

        cart_sub_total = 0

        for item in user_cart:
            cart_sub_total = cart_sub_total + item.sub_total

        status = 2

        context = {
            'cart_sub_total':cart_sub_total,
            'status' : status
        }
        return JsonResponse(context, safe=False)

    else:

        guest_user_id = request.session['guest_user']
        prd_id = request.POST['prd_id']    
        cart_item = CartItems.objects.get(anonymous_user = guest_user_id , products_id = prd_id)
        product_id = cart_item.products_id.id
        product = Products.objects.get(id = product_id)
        

        if cart_item.quantity < product.stocks:
            cart_item.quantity +=1
            cart_item.save()

            cart_item = CartItems.objects.filter(anonymous_user = guest_user_id, products_id = prd_id, buy_now = False)
        try:
            for i in cart_item:
                price = i.products_id.sale_price
                qnty = i.quantity
                sub_total = (price * qnty)
                i.sub_total = sub_total
                i.save()

        except:
            pass

        user_cart = CartItems.objects.filter(anonymous_user = guest_user_id, buy_now = False)

        cart_sub_total = 0

        for item in user_cart:
            cart_sub_total = cart_sub_total + item.sub_total

        status = 1
        context = {
            'cart_sub_total':cart_sub_total
        }
        return JsonResponse(context, safe=False)





@csrf_exempt
def product_decrement(request):
    if request.user.is_authenticated:
        user_id = request.POST['user_id']
        prd_id = request.POST['prd_id']

        cart_item = CartItems.objects.get(user = user_id, products_id = prd_id)
        if cart_item.quantity > 1:
            cart_item.quantity -=1
            print(cart_item.quantity)
            cart_item.save()
            cart_item = CartItems.objects.filter(user = user_id, products_id = prd_id, buy_now =  False)
            for i in cart_item:
                price = i.products_id.sale_price 
                qnty = i.quantity
                sub_total = (price * qnty)
                i.sub_total = sub_total
                i.save()

            user_cart = CartItems.objects.filter(user = user_id, buy_now = False)
            cart_sub_total = 0
            for item in user_cart:
                cart_sub_total = cart_sub_total + item.sub_total

            status = 1
            context = {

                'status':status,
                'cart_sub_total' : cart_sub_total


            }


            return JsonResponse(context, safe=False)

        else:
            status = 2

            context = {
            'status':status
                    }
            return JsonResponse(context, safe=False)


    else:
        guest_user = request.session['guest_user']
        prd_id = request.POST['prd_id']
    
        cart_item = CartItems.objects.get(anonymous_user = guest_user, products_id = prd_id)
        if cart_item.quantity > 1:
            cart_item.quantity -=1
            print(cart_item.quantity)
            cart_item.save()
            cart_item = CartItems.objects.filter(anonymous_user = guest_user, products_id = prd_id, buy_now = False)
            for i in cart_item:
                price = i.products_id.sale_price 
                qnty = i.quantity
                sub_total = (price * qnty)
                i.sub_total = sub_total
                i.save()
    
            user_cart = CartItems.objects.filter(anonymous_user = guest_user, buy_now = False)
            cart_sub_total = 0
            for item in user_cart:
                cart_sub_total = cart_sub_total + item.sub_total
    
    
            return JsonResponse({'cart_sub_total':cart_sub_total }, safe=False)

# Checkout

def checkout(request):

    if request.user.is_authenticated:

        user_cart = request.user.id

        try:

            cart_items = CartItems.objects.get(user = user_cart,buy_now = True)
            sum = cart_items.sub_total

        except:
            
            cart_items = CartItems.objects.filter(user = user_cart, buy_now = False)
            sub_total_total = CartItems.objects.filter(user = user_cart, buy_now = False)
            sum = 0
            for sub in sub_total_total:
                sum += sub.sub_total

            print('second')

        products = Products.objects.all()
        address = UserAddress.objects.filter(user = user_cart)

        # taking the full total of subtotal


        context = {

            'cart_items'    : cart_items,
            'products'      : products,
            'grandtotal'    : sum,
            'address'       : address
        }
        return render(request, 'user/checkout.html',context)

    else:
        messages.info(request, 'You must login to proceed')
        return redirect('login')


# add user address

@never_cache
def add_address(request):
    first_name  = request.POST['first_name']
    last_name   = request.POST['last_name']
    email       = request.POST['email']
    phone_number= request.POST['phone_number']
    address     = request.POST['address']
    city        = request.POST['city']
    post_code   = request.POST['post_code']
    country     = request.POST['country']
    state       = request.POST['state']

    user_id = request.user.id

    cart_user = Accounts.objects.get(id = user_id)

    new_address = UserAddress.objects.create(first_name = first_name, last_name = last_name, email = email, phone_number = phone_number, address = address, city = city, post_code = post_code, country = country, state = state, user = cart_user)
    return redirect('checkout')



# placing order
@never_cache
def place_order(request):
    if request.method == 'POST':
        address_id  = request.POST['mailing_address']

        if request.POST.get('payment_method') == 'cash_on_delivery':

            payment_method  = request.POST['payment_method'] 
            payment_status = "pending"



        elif request.POST.get('payment_method') == 'razor_pay':
            
            payment_method  = request.POST['payment_method'] 
            payment_status = "COMPLETED"

        else:

            payment_method  = request.POST['payment_method'] 
            payment_status = "pending"




        #taking payment id generated by razor pay

        if request.POST['payment_id']:

            payment_id = request.POST['payment_id']
        
        else:
            payment_id = 0

        # creating order number using uuid

        order_id = str(uuid.uuid4())

        #taking the address using address id

        user_address = UserAddress.objects.get(id = address_id) 

        order_status = "ordered"




        if request.POST['grand_total']:

                total = request.POST['grand_total']

                grand_total = int(total)

        else:


            cart_item = CartItems.objects.filter(user = request.user.id, buy_now = False)
            grand_total = 0
            for item in cart_item:
                grand_total += item.sub_total


        user = request.user.id
        ordered_user = Accounts.objects.get(id = user)

        # taking the address
        
        ordered_address = user_address.first_name + ", \n" + \
            user_address.address + "\n" + \
            user_address.state + ", " + str(user_address.post_code) + "\n" + \
            user_address.country + " ,\n" + \
            user_address.phone_number 


        # order is instance of particular order
        
        order = Order.objects.create(order_id = order_id, payment_method = payment_method, user =  ordered_user, delivered_address = ordered_address, delivery_status = order_status, grand_total = grand_total,payment_status = payment_status )



        cart_items = CartItems.objects.filter(user = ordered_user, buy_now = False)

        for items in cart_items:
            single_order = order
            user = ordered_user
            product_id = items.products_id
            quantity = items.quantity 
            sub_total = items.sub_total
            is_active = items.is_active

            OrderItems.objects.create(order = single_order, user = user, products_id = product_id, quantity = quantity, sub_total = sub_total, is_active = is_active)
            product = Products.objects.get(id = items.products_id.id)
            product.stocks -= items.quantity
            product.save()

            


        #Tranfering data into payment table

        Payment.objects.create(user = ordered_user, payment_method =  payment_method, payment_id = payment_id, amount_paid = grand_total, status = order_status, order = order)

        #deleting items from CartItem table

        CartItems.objects.filter(user = ordered_user, buy_now = False).delete()

        context = {
                'order_id': order_id,
                'order_address': ordered_address,
                'payment_method': payment_method,
                'order_status': order_status,
                'grand_total':grand_total
        }
        return render(request, 'user/order_details.html', context)



# deleting cart item

@csrf_exempt
def delete_product(request):
    item_id = request.POST['item_id']
    CartItems.objects.get(id = item_id).delete()
    return JsonResponse('',safe=False)


# paypal payment


@csrf_exempt
def paypal_payment(request):
    body = json.loads(request.body)

    transaction_id = body['transID']

    id = request.user.id

    current_user = Accounts.objects.get(id = id)

    address_id = body['address_id']
    current_user_address = UserAddress.objects.get(id = address_id) 

    delivery_status = 'ordered'

    ordered_address = current_user_address.first_name + ", \n" + \
    current_user_address.address + "\n" + \
    current_user_address.state + ", " + str(current_user_address.post_code) + "\n" + \
    current_user_address.country + " ,\n" + \
    current_user_address.phone_number 

    new_order = Order.objects.create(user = current_user,order_id  = body['orderID'], payment_method = body['payment_methods'], delivered_address = ordered_address, delivery_status = delivery_status, payment_status = body['status'], grand_total = body['grand_total'] )

    Payment.objects.create(user = current_user, payment_id = body['transID'], payment_method = body['payment_methods'], amount_paid = body['grand_total'], status = body['status'], order = new_order  )

    #moving the cart products to order items 

    cart_items = CartItems.objects.filter(user = current_user, buy_now = False)

    for item in cart_items:
        OrderItems.objects.create(quantity = item.quantity, products_id = item.products_id, sub_total = item.sub_total, user = current_user, order = new_order)

        #reducing the product stock

        product = Products.objects.get(id = item.products_id.id)
        product.stocks -= item.quantity
        product.save()

    cart_items.delete()

    # Taking new order id
    new_order_id = new_order.id


    data = {
        
        'new_order_id' :new_order_id ,
        'transID' : transaction_id,
    }

    return JsonResponse(data, safe=False)
    
# paypal success
    
@csrf_exempt
@never_cache
def paypal_payment_success(request):
    order_id = request.GET.get('order_id')
    trans_id = request.GET.get('trans_id')

    current_order = Order.objects.get(id = order_id)
    order_id= current_order.order_id,
    order_address= current_order.delivered_address,
    payment_method= current_order.payment_method,
    order_status= current_order.delivery_status,
    grand_total=current_order.grand_total

    context = {
        'order_id': order_id,
        'order_address': order_address,
        'payment_method': payment_method,
        'order_status': order_status,
        'grand_total':grand_total


    }
    return render(request, 'user/order_details.html', context)


# razor pay function
@csrf_exempt
@never_cache
def razor_pay_details(request):
    grand_total = int(request.POST.get('total_amount'))
    amount = grand_total*100

    currency = "INR"


    data = { 
        "amount": amount, 
        "currency": currency, 
        "receipt": "order_rcptid_11" 
        }

    razor_pay_order = razorpay_client.order.create(data=data)

    razor_pay_order_id = razor_pay_order['id']

    context = {
        'grand_total' : amount,
        'razor_pay_order_id' : razor_pay_order_id,
        'currency' : currency,

    }
    return JsonResponse(context, safe=False)
    

# PAYMENT ERROR EXCEPTION


def payment_error(request):
    return render(request, 'user/payment_error.html')


# Apply coupon
@csrf_exempt
def coupon_apply(request):

    coupon_id = request.POST.get('coupon_id')

    print(coupon_id)

    user = Accounts.objects.get(id = request.user.id)

    if Coupon.objects.get(coupon_id = coupon_id) is None:

        coupon_status = 1
        context = {
            'coupon_status' : coupon_status
        }
        return JsonResponse(context, safe=False)

    else:

        coupon = Coupon.objects.get(coupon_id = coupon_id)

    if ExpiredCoupon.objects.filter(coupon = coupon, user = user).exists():

        coupon_status = 2

        context = {
            'coupon_status' : coupon_status
        }
        return JsonResponse(context, safe=False)

    else:


        coupon_name = coupon.coupon_name

        cart_items = CartItems.objects.filter(user = request.user.id, buy_now = False)

        grand_total = 0

        for items in cart_items:

            grand_total += items.sub_total

    
        coupon_percent = coupon.coupon_percent

        print('percent:',coupon_percent)
        print('grand total:',grand_total)



        applied_coupon_total = int(grand_total - ( grand_total * (coupon_percent / 100) ))

        # Saving the details of user who user a  particular coupon
        ExpiredCoupon.objects.create(coupon = coupon, user = user)
        coupon_status = 3


        context = {

            'coupon_name' : coupon_name,
            'applied_coupon_total' : applied_coupon_total,
            'coupon_percent' : coupon_percent,
            'coupon_status' : coupon_status,
            'grand_total' : applied_coupon_total

        }

        return JsonResponse(context, safe=False)


    
@csrf_exempt
def wallet_amount_check(request):

    grand_total = int(request.POST.get('grand_total'))
    current_user = Accounts.objects.get(id = request.user.id)
    wallet_amount = current_user.wallet_amount


    new_grand_total = 0

    if wallet_amount == 0 :

        status = 0
        context = {

            'status' : 'status'

        }
                
        return JsonResponse(context, safe=False)

    elif grand_total <= wallet_amount:

        new_grand_total = grand_total - wallet_amount
        new_wallet_amount = wallet_amount - grand_total
        print(new_wallet_amount)
        status = 1
        current_user.wallet_amount = new_wallet_amount
        current_user.save()


        context = {

            'new_grand_total' : new_grand_total,
            'status' : 'status'

        }

        return JsonResponse(context, safe=False)

    elif grand_total >= wallet_amount:

        new_grand_total = grand_total - wallet_amount

        new_wallet_amount = wallet_amount - grand_total

        status = 3

        if new_wallet_amount <= 0:
            new_wallet_amount = 0
            current_user.wallet_amount = new_wallet_amount
            current_user.save()

        saved_money = grand_total - new_grand_total

        context = {

            'new_grand_total' : new_grand_total,
            'status' : status,
            'saved_money' : saved_money

        }
        return JsonResponse(context, safe=False)


    return JsonResponse('', safe=False)




    
# wishlist started

@login_required(login_url='login')
def wishlist(request):
    if request.session.has_key('userlogin'):
        id = request.user.id
        wishlist_item = Wishlist.objects.filter(user = id).order_by('id')
        categories = Category.objects.all()
        subcategories = SubCategory.objects.all()
        product = Products.objects.all()
        
        context = {
            'wishlist_items': wishlist_item,
            'categories' : categories,
            'subcategories' : subcategories,
            'products' : product,
        }
        return render(request, 'user/wishlist.html', context)

            
@csrf_exempt            
def add_to_wishlist(request):

    if request.user.is_authenticated:
            product_id = request.POST['product_id']
            user_id = request.user.id

            if request.method == 'POST':

                single_product  = Products.objects.get(id = product_id) 
                user            = Accounts.objects.get(id = user_id)

                if Wishlist.objects.filter(products_id = single_product, user = request.user).first():
                    status = 1

                    context = {

                        'status' : status
                    }
                    return JsonResponse(context,safe=False)

                else:
                    cart    = Wishlist(user = user, products_id = single_product)
                    cart.save()
                    status = 2

                    context = {

                        'status' : status
                    }
                    return JsonResponse(context,safe=False)

    else:
        product_id = request.POST['product_id']
        guest_user = _session_id(request)
        print("session add to cart :",guest_user)

        if request.method == 'POST':
            single_product  = Products.objects.get(id = product_id) 
            if Wishlist.objects.filter(products_id = single_product, anonymous_user = guest_user).first():
                return JsonResponse('',safe=False)

            else:
                product_sub_total = single_product.sale_price * 1
                cart    = CartItems(anonymous_user = guest_user, products_id = single_product, quantity = 1, sub_total = product_sub_total)
                cart.save()
                return JsonResponse('',safe=False)
        
# Delete wishlist        

@csrf_exempt
def delete_wishlist_item(request):

    item_id = request.POST['item_id']
    Wishlist.objects.get(id = item_id).delete()
    return JsonResponse('',safe=False)




@csrf_exempt
@login_required(login_url='login')
def buy_now(request,id):

    product = Products.objects.get(id = id)
    current_user = Accounts.objects.get( id = request.user.id )

    product_sub_total = product.sale_price * 1
    cart    = CartItems(user = current_user, products_id = product, quantity = 1, sub_total = product_sub_total, buy_now = True)
    cart.save()

    return redirect('checkout')






