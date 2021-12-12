from django.shortcuts import redirect, render
from useraccount.models import Accounts
from django.views.decorators.cache import never_cache



# Create your views here.

def getuser(request):

    user = Accounts.objects.filter(is_superadmin = False).order_by('id')
    
    return render(request, 'admin/usermanagement.html',{'users':user})


@never_cache
def user_status(request,id):
    user = Accounts.objects.get(id = id)
    if user.is_active == True:
        user.is_active = False
        user.save()
        return redirect('getuser')

    else:
        user.is_active = True
        user.save()
        return redirect('getuser')


