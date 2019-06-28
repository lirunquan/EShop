from django.shortcuts import render
from .models import Goods
import json
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
# Create your views here.
@csrf_exempt
def goods_look(request):
	ret = {'result':0}
	if request.method=='POST':
		data = json.loads(request.body)
		num = data['num']
		goods_list = []
		goods = Goods.objects.all()[n:n+10]
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