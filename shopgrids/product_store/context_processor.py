from categorymanagement.models import Category

def category_display(request):
    categories = Category.objects.all()
    context = {
        'categories' : categories
    }
    return (context)

