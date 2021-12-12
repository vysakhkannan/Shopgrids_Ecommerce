from django.shortcuts import render
from productmanagement.models import Products, ImageGallery
from categorymanagement.models import Category

# Create your views here.

def single_product_view(request,id):
    single_product = Products.objects.get(id = id)
    product_images = ImageGallery.objects.filter(product_id = id)

    context = {
        'product': single_product,
        'images' : product_images
    }
    return render(request, 'user/single_product_view.html', context)


def product_grid_view(request, id):

    category = Category.objects.get(id = id)

    products = Products.objects.filter(category = category).order_by('id')

    product_count = products.count()

    context = {
        'products' : products,
        'product_count' : product_count
    }

    return render(request, 'user/product_grid_view.html', context)


def view_all_products(request):

    products = Products.objects.all().order_by('id')

    product_count = products.count()

    context = {
        'products' : products,
        'product_count' : product_count
    }

    return render(request, 'user/product_grid_view.html', context)