from django.shortcuts import redirect, render
from categorymanagement.models import Offer, SubCategory, Category
from .models import Products, ImageGallery, Coupon, Banner
from django.views.decorators.cache import never_cache
from django.contrib import messages
from django.http.response import JsonResponse
from django.views.decorators.csrf import csrf_exempt
import uuid
from django.core.files.base import ContentFile
import base64





# Create your views here.

# PRODUCTS MANAGEMENT

def product_management(request):
    products = Products.objects.all().order_by('id')
    category = Category.objects.all()
    images = ImageGallery.objects.all()
    offers = Offer.objects.all()
    context = {
        'products': products,
        'category': category,
        'images':images,
        'offers' : offers
    }
    return render(request, 'admin/product_management.html', context)

# ADD PRODUCTS
@never_cache
def add_products(request):
    if request.method == 'POST':
        product_name = request.POST['product_name']
        slug = product_name.replace(" ", "-")
        mrp = request.POST['mrp']
        sales_price = request.POST['sales_price']
        stock = request.POST['stock']
        sub_category_id = request.POST['sub_category']

        sub_category = SubCategory.objects.get(id = sub_category_id)
        category_id = sub_category.catergory_id.id
        category = Category.objects.get(id = category_id)
        description = request.POST['product_description']

        cover = request.POST.get('pro_img1')
        image1 = request.POST.get('pro_img2')
        image2 = request.POST.get('pro_img3')
        image3 = request.POST.get('pro_img4')
        image4 = request.POST.get('pro_img5')

        format, img = cover.split(';base64,')
        ext = format.split('/')[-1]
        product_cover = ContentFile(base64.b64decode(img), name= product_name + '1.' + ext)

        format, img1 = image1.split(';base64,')
        ext = format.split('/')[-1]
        product_image1 = ContentFile(base64.b64decode(img1), name= product_name + '2.' + ext)
        
        format, img2 = image2.split(';base64,')
        ext = format.split('/')[-1]
        product_image2 = ContentFile(base64.b64decode(img2), name= product_name + '3.' + ext)
        
        format, img3 = image3.split(';base64,')
        ext = format.split('/')[-1]
        product_image3 = ContentFile(base64.b64decode(img3), name= product_name + '4.' + ext)
        
        format, img4 = image4.split(';base64,')
        ext = format.split('/')[-1]
        product_image4 = ContentFile(base64.b64decode(img4), name= product_name + '5.' + ext)
        


        if Products.objects.filter(product_name = product_name).exists():
            messages.info(request, 'Product exists')
            return redirect('add_products')

        else:

            # OBEJECT OF THE PARENT TABLE (FOREIGN KEY)

            sub = SubCategory.objects.get(id = sub_category_id)

            product = Products(product_name = product_name, slug = slug,mrp = mrp, sale_price = sales_price, stocks = stock, product_cover = product_cover,category = category, sub_category = sub, description = description  )
            product.save()


            product_id = Products.objects.get(product_name = product_name)

            if product_image1 != None:
                new_image = ImageGallery(product_id = product_id, image = product_image1 )
                new_image.save()

            if product_image2 != None:
                new_image = ImageGallery(product_id = product_id, image = product_image2)
                new_image.save()

            if product_image3 != None:
                new_image = ImageGallery(product_id = product_id, image = product_image3)
                new_image.save()

            if product_image4 != None:
                new_image = ImageGallery(product_id = product_id, image = product_image4)
                new_image.save()


            # Checking the offer availability


            return redirect('product_management')

                

    else:
        category = Category.objects.all()
        subcategory = SubCategory.objects.all()
        offers = Offer.objects.all()
        context = {
            'categories' : category,
            'subcategories': subcategory,
            'offers' : offers
        }
        return render(request,'admin/add_product.html', context)

# DELETE PRODUCT

@csrf_exempt
def delete_product_product(request):
    id = request.POST['product_id_id']
    print(id)
    product = Products.objects.get(id = id)
    product.delete()
    return JsonResponse('',safe=False)


# EDIT PRODUCT
@never_cache
def edit_product(request, id):
    if request.method == 'POST':
        product_name = request.POST['product_name']
        slug = product_name.replace(" ", "-")
        mrp = request.POST['mrp']
        sales_price = request.POST['sales_price']
        stock = request.POST['stock']
        sub_category_id = request.POST['sub_category']

        sub_category = SubCategory.objects.get(id = sub_category_id)
        category_id = sub_category.catergory_id.id
        category = Category.objects.get(id = category_id)

        product = Products.objects.get(id = id)
        sub = SubCategory.objects.get(id = sub_category_id)

        description = request.POST['product_description']

        # id of single images

        pro_image_id1 = request.POST['single_image_id1']
        pro_image_id2 = request.POST['single_image_id2']
        pro_image_id3 = request.POST['single_image_id3']
        pro_image_id4 = request.POST['single_image_id4']

        if request.POST.get('pro_img'):

            
            cover = request.POST.get('pro_img')

            format, img = cover.split(';base64,')
            ext = format.split('/')[-1]
            product_cover = ContentFile(base64.b64decode(img), name= product_name + '1.' + ext)
            product.product_cover = product_cover
            product.save()

        # updating first image

        if request.POST.get('pro_img1'):

            new_pro_image1 = request.POST.get('pro_img1')

            format, img1 = new_pro_image1.split(';base64,')
            ext = format.split('/')[-1]
            pro_image1 = ContentFile(base64.b64decode(img1), name= product_name + '2.' + ext)

            single_image1 = ImageGallery.objects.get(id = pro_image_id1)
            single_image1.image = pro_image1
            single_image1.save()

        # updating second image


        if request.POST.get('pro_img2'):

            new_pro_image2 = request.POST.get('pro_img2')


            format, img2 = new_pro_image2.split(';base64,')
            ext = format.split('/')[-1]
            pro_image2 = ContentFile(base64.b64decode(img2), name= product_name + '3.' + ext)

            single_image2 = ImageGallery.objects.get(id = pro_image_id2)
            single_image2.image = pro_image2
            single_image2.save()

        # updating third image


        if request.POST.get('pro_img3'):

            new_pro_image3 = request.POST.get('pro_img3')


            format, img3 = new_pro_image3.split(';base64,')
            ext = format.split('/')[-1]
            pro_image3 = ContentFile(base64.b64decode(img3), name= product_name + '4.' + ext)

            single_image3 = ImageGallery.objects.get(id = pro_image_id3)
            single_image3.image = pro_image3
            single_image3.save()

        # updating fourth image


        if request.POST.get('pro_img4'):

            new_pro_image4 = request.POST.get('pro_img4')


            format, img4 = new_pro_image4.split(';base64,')
            ext = format.split('/')[-1]
            pro_image4 = ContentFile(base64.b64decode(img4), name= product_name + '5.' + ext)

            single_image4 = ImageGallery.objects.get(id = pro_image_id4)
            single_image4.image = pro_image4
            single_image4.save()

        


        if  product_name != None:
            product.product_name = product_name

        if slug != None:
            product.slug = slug

        if mrp != None:
            product.mrp = mrp

        if sales_price != None:
            product.sale_price = sales_price

        if stock != None:
            product.stocks = stock




        if sub_category_id != None:
            product.sub_category = sub
            product.category = category

        if description != None:
            product.description = description

        product.save()

            # Checking the offer availability
      

        return redirect('product_management')

    else:
        product = Products.objects.get(id = id)
        category = Category.objects.all()
        sub_category  = SubCategory.objects.all()
        image = ImageGallery.objects.filter(product_id = id)
        offers = Offer.objects.all()
        context = {
            'product': product,
            'categories': category,
            'sub_categories': sub_category,
            'images' : image,
            'offers' : offers
        }
        return render(request,'admin/edit_product.html',context)


# banner management

def banner_management(request):


    banners = Banner.objects.all()
    context = {

        'banners' : banners

    }
    return render(request,'admin/banner_management.html', context)

# add banner

def add_banner(request):

    if request.method == 'POST':
        image = request.FILES.get('banner_image')
        description = request.POST['product_description']
        product_id = request.POST['product_selected']
        product = Products.objects.get(id = product_id)
        Banner.objects.create(image = image, description = description, product = product)

        return redirect('banner_management')

    else:

        products = Products.objects.all()

        context = {
            'products' : products
        }
        return render(request,'admin/add_banner.html', context)


# Delete banner

@csrf_exempt
def delete_banner(request):

    banner_id = request.POST['banner_id']
    banner = Banner.objects.get(id = banner_id)
    banner.delete()

    return JsonResponse('',safe=False)



# Product Offer apply

@csrf_exempt
def product_offer_update(request):

    offer_id = request.POST.get('offer_id')
    product_id = request.POST.get('product_id')

    offer = Offer.objects.get(id = offer_id)
    product = Products.objects.get(id = product_id)

    product.offer_name = offer.offer_name
    product.offer_percent = offer.offer_percent
    product.expiry_date = offer.expiry_date
    product.offer_status = 'True'
    product.save()

    if product.offer_status == 'True':

        if product.sub_category.catergory_id.offer_status == 'True':

            if product.old_sale_price is not None:

                sale_price = product.old_sale_price
                print("1 st sale", sale_price)


            else:

                sale_price = product.sale_price
                product.old_sale_price = sale_price
                print("2 st sale", sale_price)   

            # Calculating the category offer price if exist
            category_offer_percent =  product.sub_category.catergory_id.offer_percent
            category_offer_price = sale_price - (sale_price * (category_offer_percent / 100))
            print('category offer prize' , category_offer_price)

            #Calculating the product offer price 
            product_offer_percent = product.offer_percent
            print(product_offer_percent)
            product_offer_price = sale_price - (sale_price * (product_offer_percent / 100))
            print('product offer prize' , product_offer_price)


            # Smallest offer prize is applied

            if product_offer_price <= category_offer_price:

                product.sale_price = int(product_offer_price)
                product.offer_applied = 'product_offer'
                print("product offer")


            else:
                
                product.sale_price = int(category_offer_price)
                product.offer_applied = 'category_offer'
                print("category offer")


            product.save()

        else:

            # Checking if any value in old_sale_price

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


    return JsonResponse('',safe=False)

# Delete product offer 

@csrf_exempt     
def product_offer_delete(request):

    product_id = request.POST.get('product_id')

    product = Products.objects.get(id = product_id)
    product.offer_name = None
    product.offer_percent = None
    product.offer_status = None
    product.expiry_date = None
    product.offer_applied = None
    product.save()

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
        product.save()


    return JsonResponse('',safe=False)


# Coupon section

def coupon_management(request):

    coupons = Coupon.objects.all()

    context = {

        'coupons' : coupons

    }

    return render(request, 'admin/coupon_management.html', context)

# Add coupon

def add_coupon(request):

    if request.method == 'POST':
        coupon_name = request.POST['coupon_name']
        coupon_percent = request.POST['coupon_percent']
        expiry_date = request.POST['expiry_date']
        expiry_time = request.POST['expiry_time']

        coupon_id = str(uuid.uuid4())[0:8]

        if Coupon.objects.filter(coupon_name = coupon_name).exists():  

            messages.info(request, 'Coupon exists')
            return redirect('add_coupon')   

        else:

            messages.info(request, 'Coupon Added Sussessfully')

            Coupon.objects.create(coupon_id = coupon_id, coupon_name = coupon_name, coupon_percent = coupon_percent, expiry_date = expiry_date, expiry_time = expiry_time)
            return redirect('coupon_management')   



        
    return render(request, 'admin/add_coupon.html')

# Delete coupon
@csrf_exempt
def delete_coupon(request):

    coupon_id = request.POST['coupon_id']
    coupon = Coupon.objects.get(id = coupon_id)
    coupon.delete()

    return JsonResponse('',safe=False)


