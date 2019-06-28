from django.shortcuts import render
from django.http import JsonResponse
from .models import Order
import json, random
from apps.user.models import Customer, RecieveInfo
from django.views.decorators.csrf import csrf_exempt
# Create your views here.
@csrf_exempt
def checkorderbyuser(request):
	ret = {'result': 0}
	if request.method=='GET' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			data = json.loads(request.body)
			orderlist = []
			for order in Order.objects.all():
				if order.customer.username==uname :
					orderlist.append(order.code)
			ret['result'] = 1
			ret['msg'] = 'the orders owned by customer'
			ret['orders'] = orderlist
	else :
		ret['result'] = -5
		ret['msg'] = 'needs POST request'
	return JsonResponse(ret)
@csrf_exempt
def checkorderbycode(request):
	ret = {'result': 0}
	if request.method=='POST' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			data = json.loads(request.body)
			code = data['code']
			order = Order.objects.filter(code=code)
			if len(order)==0 :
				ret['result'] = -2
				ret['msg'] = 'order does not exist.'
			elif len(order)==1 :
				ret['result'] = 1
				ret['msg'] = 'show order info'
				ret['order'] = {
					'customer': {
						'id': order[0].customer.id,
						'username': order[0].customer.username
					},
					'code': order[0].code,
					'goodslist': order[0].goodsList,
					'createat': order[0].createAt,
					'rcvinfo': {
						'reciever': order[0].rcvInfo.reciever,
						'address': order[0].rcvInfo.address,
						'phone': order[0].rcvInfo.phone,
						'postcode': order[0].rcvInfo.postcode
					},
					'totalprice': order[0].totalPrice,
					'ispaid': order[0].isPaid,
					'payment': order[0].payment_method,
					'isdelivered': order[0].isDelivered,
					'remarks': order[0].remarks
				}
	else :
		ret['result'] = -5
		ret['msg'] = 'needs POST request'
	return JsonResponse(ret)
@csrf_exempt
def createorder(request):
	ret = {'result': 0}
	if request.method=='POST':
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			data = json.loads(request.body)
			customer = Customer.objects.get(username=uname)
			code = ''.join(random.sample('0123456789', 10))
			while True:
				if len(Order.objects.filter(code=code))==0 :
					break
				else :
					code = ''.join(random.sample('0123456789', 10))
			goodslist = data['goodslist']
			rcv = data['rcvinfo']
			reciever = rcv['reciever']
			phone = rcv['phone']
			address = rcv['address']
			postcode = rcv['postcode']
			rcvinfo = RecieveInfo.objects.get(customer=customer, reciever=reciever, address=address, phone=phone, postcode=postcode)
			t_price = data['totalprice']
			payment = data['payment']
			remarks = data['remarks']
			new_order = Order.objects.get_or_create(
				customer=customer, code=code, goodsList=goodslist, rcvInfo=rcvinfo, 
				totalPrice=t_price, payment_method=payment, remarks=remarks)
			if new_order[1] :
				ret['result'] = 1
				ret['msg'] = 'create order successfully.'
				ret['order'] = {
					'customer': {
						'id': new_order[0].customer.id,
						'username': new_order[0].customer.username
					},
					'code': new_order[0].code,
					'goodslist': new_order[0].goodsList,
					'createat': new_order[0].createAt,
					'rcvinfo': {
						'reciever': new_order[0].rcvInfo.reciever,
						'address': new_order[0].rcvInfo.address,
						'phone': new_order[0].rcvInfo.phone,
						'postcode': new_order[0].rcvInfo.postcode
					},
					'totalprice': new_order[0].totalPrice,
					'ispaid': new_order[0].isPaid,
					'payment': new_order[0].payment_method,
					'isdelivered': new_order[0].isDelivered,
					'remarks': new_order[0].remarks
				}
			else :
				ret['result'] = -3
				ret['msg'] = 'order already exist.'
	else:
		ret['result'] = -5
		ret['msg'] = 'needs POST request'
	return JsonResponse(ret)
@csrf_exempt
def getpaid(request):
	ret = {'result': 0}
	if request.method=='POST' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			data = json.loads(request.body)
			code = data['code']
			customer = Customer.objects.get(username=uname)
			order = Order.objects.filter(customer=customer, code=code)
			if len(order)==0:
				ret['result'] = -2
				ret['msg'] = 'order does not exist.'
			elif len(order)==1:
				if order[0].isPaid :
					ret['result'] = 2
					ret['msg'] = 'order already paid.'
				else :
					if order[0].payment_method==1:
						customer.account -= order[0].totalPrice
						order[0].isPaid = True
						customer.save()
						order[0].save()
						ret['result'] = 1
						ret['msg'] = 'order get paid successfully.'
					else : 
						ret['result'] = 0
						ret['msg'] = 'no need to pay online.'
	else:
		ret['result'] = -5
		ret['msg'] = 'needs POST request'
	return JsonResponse(ret)