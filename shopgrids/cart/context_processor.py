from .models import CartItems, Wishlist
from useraccount.models import Accounts
from productmanagement.models import Products

def counter(request):
    cart_counter = 0
    try:
        if 'adminlogin' in request.path:
            return {}


        else:
            
            try:
                
                user_id = request.user.id
                current_user = Accounts.objects.get(id = user_id)
                cart_items = CartItems.objects.filter(user = current_user, buy_now = False)
                for items in cart_items:
                    cart_counter += items.quantity
            except CartItems.DoesNotExist:
                cart_counter = 0
            return dict(cart_count = cart_counter)


    except:
        
        return dict(cart_count = '0')


def wishlist_counter(request):
    wishlist_count = 0
    try:
        if 'adminlogin' in request.path:
            return {}

        else:
            
            try:
                user_id = request.user.id
                current_user = Accounts.objects.get(id = user_id)
                wishlist_items = Wishlist.objects.filter(user = current_user)
                wishlist_count = 0
                for items in wishlist_items:
                    wishlist_count+=1
            except Wishlist.DoesNotExist:
                wishlist_count = 0
            return dict(wishlist_count = wishlist_count)

    except:
        
        return dict(wishlist_count = '0')


def saved_amount(request):
    try:
        if 'adminlogin' in request.path:
            return {}

        else:
            
            try:

                user_id = request.user.id
                current_user = Accounts.objects.get(id = user_id)
                product = Products.objects.all()
                items = CartItems.objects.filter(user = current_user)
                quantity = 0

                saved_price = 0

                real_saved_price = 0

                for item in items:

                    for pro in product:

                        if item.products_id.id == pro.id:

                            quantity = item.quantity

                            if pro.old_sale_price is not None:
                                old_sub_total = pro.old_sale_price

                            else:

                                old_sub_total = pro.sale_price


                            real_subtotal = quantity * old_sub_total
                            offered_subbtotal = quantity * pro.sale_price

                
                            saved_price = real_subtotal - offered_subbtotal

                            real_saved_price +=saved_price

            except CartItems.DoesNotExist:
                real_saved_price = 0
            return dict(real_saved_price = real_saved_price)

    except:
        
        return dict(real_saved_price = '0')


def guest_counter(request):
    cart_counter = 0
    try:
        if 'adminlogin' in request.path:
            return {}


        else:
            
            try:
                if request.session['guest_user']:
                    guest_id = request.session['guest_user']
                    cart_items = CartItems.objects.filter(anonymous_user = guest_id, buy_now = False)
                    for items in cart_items:
                        cart_counter += items.quantity
            except CartItems.DoesNotExist:
                cart_counter = 0
            return dict(guest_cart_count = cart_counter)


    except:
        
        return dict(guest_cart_count = '0')
