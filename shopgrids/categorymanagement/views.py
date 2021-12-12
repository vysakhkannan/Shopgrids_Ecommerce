from django.shortcuts import render,redirect
from productmanagement.models import Products
from cart.models import Order
from useraccount.models import Accounts
from .models import Category, Offer,SubCategory
from django.views.decorators.cache import never_cache
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
from django.http.response import JsonResponse



# Create your views here.

def category(request):
    if request.method == 'POST':
        pass
    else:
        category = Category.objects.all().order_by('id')
        offers = Offer.objects.all()
        context = {
            'categories' :category,
            'offers' : offers
        }
        return render(request, 'admin/category_management.html',context)

# ADD CATEGORY

@never_cache
def add_category(request):
    if request.method == 'POST':
        category_name = request.POST['category_name'].lower()
        slug = category_name.replace(" ", "-").lower()
        description = request.POST['description'].lower()

        if Category.objects.filter(category_name = category_name).exists():
            messages.info(request, 'Category Already Exist')
            return redirect('add_category')
        else:
            Category.objects.create(category_name = category_name, 
                    slug = slug,
                    description = description,  )

            return redirect('category')


    else:
        offers = Offer.objects.all()
        context = {
            'offers' : offers
        }
        return render(request,'admin/add_category.html', context)


# EDIT CATEGORY

@never_cache
def edit_category(request, id):
    if request.method == 'POST':
        category = Category.objects.get(id = id)
        category_name = request.POST['category_name'].lower()
        slug = category_name.replace(" ", "-").lower()
        description = request.POST['description'].lower()

        if request.POST.get('offer_id') == 'none':
            offer_name = None
            offer_percent = None
            expiry_date = None
            offer_status = 'False'

        else:
            offer_id = request.POST['offer_id']
            offer  = Offer.objects.get(id = offer_id)
            offer_name = offer.offer_name
            offer_percent = offer.offer_percent
            expiry_date = offer.expiry_date
            offer_status = 'True'


        if Category.objects.filter(category_name = category_name).exists():
            messages.info(request, 'Category Already Exist')
            return redirect('edit_category',id)
            # return redirect(request.META.get('HTTP_REFERER'))
            
        else:
            if category_name != None:
                category.category_name = category_name

            if slug != None:
                category.slug = slug
            if description != None:
                category.description = description

            category.offer_name = offer_name
            category.offer_percent = offer_percent
            category.expiry_date = expiry_date
            category.offer_status = offer_status

            category.save()
            

            

            return redirect('category')

    else:
        cate = Category.objects.get(id = id)
        offers = Offer.objects.all()

        context = {
            'category': cate,
            'offers' : offers
            
        }
        return render(request,'admin/edit_category.html',context)


# DELETE CATEGORY

@csrf_exempt
def delete_category(request):
    id = request.POST['category_id']
    print(id)
    category = Category.objects.get(id = id)
    category.delete()
    return JsonResponse('',safe=False)


# SUB CATEGORY

def sub_category(request):
    subcategory = SubCategory.objects.all().order_by('id')
    cate = Category.objects.all()
    context = {
        'subcategory': subcategory,
        'categories' : cate
    }
    return render(request, 'admin/sub-category-management.html', context)


# ADD SUBCATEGORY

@never_cache
def add_sub_category(request):
    if request.method == 'POST':
        sub_category_name   = request.POST['sub_category_name'].lower()
        slug                = sub_category_name.replace(" ", "-").lower()
        category_id         = request.POST['category']

        # cat is instances of class Category (foreign key)

        cat = Category.objects.get(id = category_id)    
        description =      request.POST['description'].lower()
        if SubCategory.objects.filter(sub_category_name = sub_category_name).exists():
            messages.info(request, 'Sub Category Already Exist')
            return redirect('add_sub_category')


        else:

            SubCategory.objects.create(sub_category_name = sub_category_name, slug = slug, catergory_id = cat, description = description)
            return redirect('sub_category')
    else:
        cat = Category.objects.all()
        return render(request,'admin/add_sub_category.html',{'categories': cat})


# EDIT SUB CATEGORY

@never_cache
def edit_sub_category(request, id):
    if request.method == 'POST':
        sub_category_name = request.POST['sub_category_name'].lower()
        slug              = sub_category_name.replace(" ","-")
        description       = request.POST['description'].lower()
        category_id       = request.POST['category_id']

        # GETTING THE OBJECT OF CATEGORY FOR UPDATION (FOREIGN KEY)

        cat = Category.objects.get(id = category_id)
        sub_cat = SubCategory.objects.get(id = id)
        if SubCategory.objects.filter(sub_category_name = sub_category_name).exists():
            messages.info(request, 'Sub Category Already Exist')
            return redirect('edit_sub_category',id)
        else:

            if sub_category_name != None :

                sub_cat.sub_category_name = sub_category_name
                sub_cat.slug = slug


            if description != None:

                sub_cat.description = description

            if category_id != None:

                sub_cat.catergory_id = cat

            sub_cat.save()
            return redirect('sub_category',)

    else:
        subcategory = SubCategory.objects.get(id = id)
        cat = Category.objects.all()
        context = {
            'subcategory': subcategory,
            'categories' : cat
        }
        return render(request, 'admin/edit_sub_category.html',context)



# DELETE SUB CATEGORY

@csrf_exempt
def delete_sub_category(request):
    sub_category_id = request.POST['sub_category_id']
    sub_category = SubCategory.objects.get(id = sub_category_id)
    sub_category.delete()
    return JsonResponse('',safe=False)



# CATEGORY OFFER STARTS

def offer_management(request):

    offers = Offer.objects.all()

    context = {
        'offers' : offers
    }
    return render(request, 'admin/offer_management.html', context)

# ADD OFFER

@never_cache
def add_offer(request):
    if request.method == 'POST':
        offer_name = request.POST['offer_name']
        offer_percent = request.POST['offer_percent']
        expiry_date = request.POST['offer_expiry_date']
        expiry_time = request.POST['offer_expiry_time']


        if Offer.objects.filter(offer_name = offer_name).exists():
            messages.info(request, 'Offer Already Exist')
            return redirect('add_offer')

        else:

            Offer.objects.create(offer_name = offer_name, offer_percent = offer_percent, expiry_date = expiry_date, expiry_time = expiry_time)
            return redirect('offer_management')
    else:

        return render(request, 'admin/add_offer.html')

#delete offer
@csrf_exempt
def delete_offer(request):
    offer_id = request.POST['offer_id']
    offer = Offer.objects.get(id = offer_id)
    offer_name = offer.offer_name

    #bringing the old sales price after deleting category offer

    try:

        products = Products.objects.all()
        category_items = Category.objects.filter(offer_name = offer_name)

        for product in products:

            for category_item in category_items:

                if product.sub_category.catergory_id.offer_name == category_item.offer_name:
                
                    #bringing the old sales price after deleting category offer
                    old_sale_price = product.old_sale_price
                    product.sale_price = old_sale_price
                    product.old_sale_price = None
                    product.offer_applied = None
                    product.save()

            # Deleting the category offer

            categories = Category.objects.filter(offer_name = offer_name)
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
        # Somehow the category offer applied to product offer

        product_one = Products.objects.filter(offer_name = offer_name)
        for product in product_one:

            #bringing the old sales price after deleting category offer
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


    offer.delete()
    return JsonResponse('',safe=False)



# Add category offer
@csrf_exempt
def category_offer_update(request):
        
    offer_id = request.POST.get('offer_id')
    category_id = request.POST.get('category_id')

    offer = Offer.objects.get(id = offer_id)
    category = Category.objects.get(id = category_id)

    products = Products.objects.all()

    category.offer_name = offer.offer_name
    category.offer_percent = offer.offer_percent
    category.expiry_date = offer.expiry_date
    category.offer_status = 'True'

    category.save()

    if category.offer_status == 'True':


        for product in products:

            print("forloop count")


            if product.sub_category.catergory_id.category_name == category.category_name:


                print(product.sub_category.catergory_id.category_name)

                #checking if product offer is available and calculating the offer price

                if product.offer_status == 'True':

                    # the sales price and assigning it to the column old_sale_price

                    print("product hiiiiiiiiiiiiiii")

                    if product.old_sale_price is not None:

                        sale_price = product.old_sale_price
                        print("1 st sale", sale_price)


                    else:

                        sale_price = product.sale_price
                        product.old_sale_price = sale_price
                        print("2 st sale", sale_price)

                            
                    product_offer_percent = product.offer_percent
                    product_offer_price = sale_price - (sale_price * (product_offer_percent / 100))

                    print('product_offer price' ,product_offer_price)

                    # Calculating the category offer price

                    category_offer_percent = category.offer_percent
                    category_offer_price = sale_price - (sale_price * (category_offer_percent / 100))
                    print('category offer price',category_offer_price )



                    if category_offer_price <= product_offer_price:
                        print('first condition check')

                        product.sale_price = int(category_offer_price)
                        product.offer_applied = 'category_offer'

                    else:
                        print('else part')


                        product.sale_price = int(product_offer_price)
                        product.offer_applied = 'product_offer'


                        
                    product.save()

                else:
                    
                    # the sales price and assigning it to the column old_sale_price

                    if product.old_sale_price is not None:

                        sale_price = product.old_sale_price

                    else:
                        sale_price = product.sale_price
                        product.old_sale_price = sale_price
                    # Calculating the category offer price

                    category_offer_percent = category.offer_percent
                    print(sale_price)
                    category_offer_price = sale_price - (sale_price) * (category_offer_percent / 100)
                    product.sale_price = category_offer_price
                    product.offer_applied = 'category_offer'

                    product.save()



    
    return JsonResponse('',safe=False)



# Category offer delete
@csrf_exempt
def category_offer_delete(request):

    category_id = request.POST.get('category_id')

    category = Category.objects.get(id = category_id)


    category.offer_name = None
    category.offer_percent = None
    category.expiry_date = None
    category.offer_status = 'False'
    category.save()

    products = Products.objects.all()

    for product in products:

        if product.sub_category.catergory_id.category_name == category.category_name:

            # Checking if the product offer applied in category offer

            if product.offer_applied == 'category_offer':

                if product.offer_status == 'True':
                    
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

                    old_sale_price = product.old_sale_price
                    product.sale_price = old_sale_price
                    product.old_sale_price = None
                    product.offer_applied = None
                    product.save()


    return JsonResponse('',safe=False)




