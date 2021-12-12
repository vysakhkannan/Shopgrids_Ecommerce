from categorymanagement.models import Category, Offer
from productmanagement.models import Coupon, Products
import datetime
# import time
import pytz

from categorymanagement.models import Category    


def offer_expiry(request):

    # Changing the timezone to IST

    tz_NY = pytz.timezone('Asia/Kolkata')   
    datetime_NY = datetime.datetime.now(tz_NY) 


    today_date = datetime.date.today()


    current_time = datetime_NY.strftime("%H:%M:%S")

    print(current_time)

    offers = Offer.objects.filter(expiry_date__lte = today_date, expiry_time__lte = current_time)

    for offer in offers:
        
        try:

            products = Products.objects.all()
            category_items = Category.objects.filter(offer_name = offer.offer_name)

            for product in products:

                for category_item in category_items:

                    if product.sub_category.catergory_id.offer_name == category_item.offer_name:

                        if product.offer_applied == 'category_offer':

                            if product.offer_status == 'true':

                                if product.old_sale_price is not None:

                                    sale_price = product.old_sale_price
                                    print("1 st sale", sale_price)


                                else:

                                    sale_price = product.sale_price
                                    product.old_sale_price = sale_price
                                    print("2 st sale", sale_price)

                                product_offer_percent = product.offer_percent
                                product_offer_price = sale_price - (sale_price * (product_offer_percent / 100))
                                product.sale_price = int(product_offer_price)
                                product.offer_applied = 'product_offer'
                                product.save()

                            else:


                
                                #bringing the old sales price after deleting category offer
                                old_sale_price = product.old_sale_price
                                product.sale_price = old_sale_price
                                product.old_sale_price = None
                                product.offer_applied = None
                                product.save()

            
            categories = Category.objects.filter(offer_name = offer.offer_name)
            for category in categories:
                category.offer_name = None
                category.offer_percent = None
                category.expiry_date = None
                category.offer_name = None
                category.offer_status = 'False'
                category.save()

        except Category.DoesNotExist:

            pass

        try:
            product_list = Products.objects.filter(offer_name = offer.offer_name)
            for product in product_list:

                #bringing the old sales price after deleting category offer
                if product.sub_category.catergory_id.offer_status == 'True':

                    if product.old_sale_price is not None:

                        sale_price = product.old_sale_price
                        print('first',sale_price)

                    else:

                        sale_price = product.sale_price
                        print('second',sale_price)


                    print(sale_price)
                    category_offer_percent = product.sub_category.catergory_id.offer_percent 
                    print('category_offer_percent', category_offer_percent)
                    category_offer_price = sale_price - (sale_price) * (category_offer_percent / 100)
                    product.sale_price  = int(category_offer_price)
                    product.offer_applied = 'category_offer'
                    product.save()

                else:

                    old_sale_price = product.old_sale_price
                    product.sale_price = old_sale_price
                    product.old_sale_price = None
                    product.offer_applied = None

                product.offer_name = None
                product.offer_percent = None
                product.expiry_date = None
                product.offer_name = None
                product.offer_status = 'False'
                product.save()


        except Products.DoesNotExist:

            pass
    
    offers.delete()



    return {}



def coupon_expiry(request):

    # Changing the timezone to IST

    tz_NY = pytz.timezone('Asia/Kolkata')   
    datetime_NY = datetime.datetime.now(tz_NY) 


    today_date = datetime.date.today()


    current_time = datetime_NY.strftime("%H:%M:%S")

    print(current_time)

    coupon = Coupon.objects.filter(expiry_date__lte = today_date, expiry_time__lte = current_time)

    coupon.delete()
    
    return {}
