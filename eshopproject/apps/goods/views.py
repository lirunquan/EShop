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
			try:
				uname = request.session['user_id']
				group = request.session['user_group']
			except Exception as e:
				for g in goods :
					if g.isSelling :
						goods_list.append({
							'isbncode': g.isbnCode,
							'name': g.name,
							'price': g.price,
							'picture': g.picture.url,
							'repertory': g.repertory,
							'isselling': g.isSelling
						})
				#return JsonResponse({'result':1, 'msg': 'show goods', 'goods_list': goods_list})
			else:
				if group=='Customer':
					for g in goods :
						if g.isSelling :
							goods_list.append({
								'isbncode': g.isbnCode,
								'name': g.name,
								'price': g.price,
								'picture': g.picture.url,
								'repertory': g.repertory,
								'isselling': g.isSelling
							})
				elif group=='Clerk' :
					for g in goods :
						goods_list.append({
							'isbncode': g.isbnCode,
							'name': g.name,
							'price': g.price,
							'picture': g.picture.url,
							'repertory': g.repertory,
							'isselling': g.isSelling
						})
				ret['result'] = 1
				ret['msg'] = 'show goods'
				ret['goods_list'] = goods_list
		else :
			ret['result'] = -2
			ret['msg'] = 'no more goods.'
	else:
		ret['result'] = -5
		ret['msg'] = 'needs GET request.'
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
			cart = Cart.objects.get(customer=customer)
			i_code = data['isbncode']
			if len(Goods.objects.filter(isbnCode=i_code))>0:
				name = data['name']
				price = data['price']
				number = data['number']
				l = cart.goodsList['list']
				if len(l)>0:
					a = 0
					for i in l:
						if i['isbncode']==i_code:
							i['number'] += number
							break
						a += 1
					if a==len(l):
						l.append(data)
				else:
					l.append(data)
				cart.goodsList = JSONSet('goodsList', {'$.list':l})
				cart.save()
				ret['result'] = 1
				ret['msg'] = 'add goods to cart succeffully.'
			else :
				ret['result'] = -2
				ret['msg'] = 'goods does not exist.'
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
				'picture': g[0].picture.url,
				'detail': g[0].detail,
				'isselling': g[0].isSelling,
				'repertory': g[0].repertory,
				'tags': g[0].tags
			}
	else:
		ret['result'] = -5
		ret['msg'] = 'needs POST request.'
	return JsonResponse(ret)