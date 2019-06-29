from django.shortcuts import render
from apps.user.models import Customer
from .models import Cart
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
# Create your views here.
@csrf_exempt
def show(request):
	ret = {'result':0}
	if request.method=='GET':
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			customer = Customer.objects.get(username=uname)
			cart = Cart.objects.get(owner=customer)
			ret['result'] = 1
			ret['msg'] = 'show cart'
			ret['cart'] = {
				'goodslist':cart.goodsList
			}
	else:
		ret['result'] = -5
		ret['msg'] = 'needs POST request.'
	return JsonResponse(ret)