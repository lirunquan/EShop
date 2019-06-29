from django.shortcuts import render
from .models import Goods
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from apps.cart.models import Cart
from apps.user.models import Customer
from django_mysql.models.functions import *
# Create your views here.
@csrf_exempt
def goods_look(request):
	ret = {'result':0}
	if request.method=='POST':
		data = json.loads(request.body)
		num = data['num']
		goods_list = []
		goods = Goods.objects.all()[num:num+10]
		if len(goods)>0:
			for g in goods :
				goods_list.append({
					'isbncode': g.isbnCode,
					'name': g.name,
					'price': g.price,
					'picture': g.picture.url
					})
			ret['result'] = 1
			ret['msg'] = 'show goods'
			ret['goods_list'] = goods_list
		else :
			ret['result'] = -2
			ret['msg'] = 'no more goods.'
	else:
		ret['result'] = -5
		ret['msg'] = 'needs POST request.'
	return JsonResponse(ret)
@csrf_exempt
def addtocart(request):
	ret = {'result':0}
	if request.method=='POST':
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			data = json.loads(request.body)
			customer = Customer.objects.get(username=uname)
			cart = Cart.objects.get(owner=customer)
			i_code = data['isbncode']
			name = data['name']
			price = data['price']
			number = data['number']
			l = cart.goodsList['list']
			if len(l)>0:
				a = 0
				for i in l:
					if i['isbncode']==i_code:
						i['number'] += 1
						break
					a += 1
				if a==len(l):
					cart.goodsList['list'].append(data)
			else:
				cart.goodsList['list'].append(data)

	else:
		ret['result'] = -5
		ret['msg'] = 'needs POST request.'
	return JsonResponse(ret)
@csrf_exempt
def goods_detail(request):
	ret = {'result':0}
	if request.method=='POST':
		data = json.loads(request.body)
		i_code = data['isbncode']
		g = Goods.objects.filter(isbnCode=i_code)
		if len(g)==0:
			ret['result'] = -2
			ret['msg'] = 'the goods does not exist.'
		elif len(g)==1 :
			ret['result'] = 1
			ret['msg'] = 'show goods detail.'
			ret['goods'] = {
				'name': g[0].name,
				'isbncode': g[0].isbnCode,
				'price': g[0].price,
				'params': g[0].params,
				'picture': g[0].picture,
				'detail': g[0].detail,
				'isselling': g[0].isSelling,
				'tags': g[0].tags
			}
	else:
		ret['result'] = -5
		ret['msg'] = 'needs POST request.'
	return JsonResponse(ret)
