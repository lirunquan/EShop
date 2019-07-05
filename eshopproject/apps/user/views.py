import uuid
import hashlib
from django.shortcuts import render
import json
from django.views.decorators.csrf import csrf_exempt
from .models import Clerk, Customer, RecieveInfo
from django.http import JsonResponse
from django.utils import timezone
import datetime
from apps.cart.models import Cart
from apps.goods.models import Goods
from apps.order.models import Order
from apps.record.models import Purchase, Deliver
from alipay import AliPay
# Create your views here.

@csrf_exempt
def login(request):
	ret = {
			'result': 0,
			'msg': ''
		}
	if request.method=='POST':
		data = json.loads(request.body)
		uname = data['username']
		pwd = data['password']
		group = data['group']
		if group=='Customer':
			customer = Customer.objects.filter(username=uname)
			if len(customer)==0:
				ret['result'] = -2
				ret['msg'] = 'the customer does not exists.'
			elif len(customer)==1 :
				if customer[0].isOnline :
					request.session['user_id'] = customer[0].username
					request.session['user_group'] = customer[0].group
					ret['result'] = 2
					ret['msg'] = 'customer has logged in.'
				else :	
					if customer[0].password==pwd :
						customer[0].isOnline = True
						customer[0].lastLogin = timezone.localtime(timezone.now())
						customer[0].save()
						request.session['user_id'] = customer[0].username
						request.session['user_group'] = customer[0].group
						ret['result'] = 1
						ret['msg'] = 'customer login successfully.'
					else:
						ret['result'] = -1
						ret['msg'] = 'incorrect password.'
		elif group=='Clerk':
			clerk = Clerk.objects.filter(username=uname)
			if len(clerk)==0:
				ret['result'] = -2
				ret['msg'] = 'the clerk does not exists.'
			elif len(clerk)==1 :
				if clerk[0].isOnline :
					request.session['user_id'] = clerk[0].username
					request.session['user_group'] = clerk[0].group
					ret['result'] = 2
					ret['msg'] = 'clerk has logged in.'
				else :
					if clerk[0].password==pwd :
						clerk[0].isOnline = True
						clerk[0].lastLogin = timezone.localtime(timezone.now())
						clerk[0].save()
						request.session['user_id'] = clerk[0].username
						request.session['user_group'] = clerk[0].group
						ret['result'] = 1
						ret['msg'] = 'clerk login successfully.'
					else:
						ret['result'] = -1
						ret['msg'] = 'incorrect password.'
	else:
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def register(request):
	ret = {
		'result': 0,
		'msg': ''
	}
	if request.method=='POST':
		data = json.loads(request.body)
		uname = data['username']
		pwd = data['password']
		group = data['group']
		rname = data['realname']
		if group=='Clerk':
			jnum = data['jobnumber']
			clerk = Clerk.objects.get_or_create(username=uname, password=pwd, group=group, realName=rname, jobnumber=jnum, lastLogin=datetime.datetime.fromtimestamp(0))
			if clerk[1]:
				ret['result'] = 1
				ret['msg'] = 'clerk register successfully.'
			else:
				ret['result'] = -1
				ret['msg'] = 'clerk already exist.'
		elif group=='Customer':
			phone = data['phone']
			email = data['email']
			customer = Customer.objects.get_or_create(username=uname, password=pwd, group=group, realName=rname, phone=phone, email=email, lastLogin=datetime.datetime.fromtimestamp(0))
			if customer[1]:
				cart = Cart.objects.get_or_create(customer=customer[0])
				ret['result'] = 1
				ret['msg'] = 'customer register successfully.'
			else:
				ret['result'] = -3
				ret['msg'] = 'customer already exist.'
	else :
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def changepwd(request):
	ret = {'result': 0}
	if request.method=='POST':
		data = json.loads(request.body)
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			oldpwd = data['old_password']
			newpwd = data['new_password']
			if group=='1' :
				customer = Customer.objects.filter(username=uname)
				if len(customer)==0 :
					ret['result'] = -2
					ret['msg'] = 'the customer does not exist.'
				elif len(customer)==1 :
					if customer[0].isOnline :
						if customer[0].password==oldpwd :
							customer[0].password = newpwd
							customer[0].save()
							ret['result'] = 1
							ret['msg'] = 'change password successfully.'
						else :
							ret['result'] = -1
							ret['msg'] = 'incorrect password.'
					else :
						ret['result'] = -4
						ret['msg'] = 'the customer needs login.'
			elif group=='0' :
				clerk = Clerk.objects.filter(username=uname)
				if len(clerk)==0 :
					ret['result'] = -1
					ret['msg'] = 'the clerk does not exist.'
				elif len(clerk)==1 :
					if clerk[0].isOnline :
						if clerk[0]==oldpwd :
							clerk[0].password = newpwd
							clerk[0].save()
							ret['result'] = 1
							ret['msg'] = 'change password successfully.'
						else :
							ret['result'] = -2
							ret['msg'] = 'incorrect password.'
					else :
						ret['result'] = -4
						ret['msg'] = 'the clerk needs login.'
	else:
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def checkinfo(request):
	ret = {'result': 0}
	if request.method=='POST' :
		data = json.loads(request.body)
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			if group=='1' :
				customer = Customer.objects.filter(username=uname)
				if len(customer)==0 :
					ret['result'] = -2
					ret['msg'] = 'the customer does not exist.'
				elif len(customer)==1 :
					if customer[0].isOnline :
						ret['result'] = 1
						ret['msg'] = 'show customer info.'
						ret['info'] = {
							'phone': customer[0].phone,
							'email': customer[0].email,
							'realname': customer[0].realName,
							'account': customer[0].account
						}
					else :
						ret['result'] = -4
						ret['msg'] = 'the customer needs login.'
			elif group=='0' :
				clerk = Clerk.objects.filter(username=uname)
				if len(clerk)==0 :
					ret['result'] = -2
					ret['msg'] = 'the clerk does not exist.'
				elif len(clerk)==1 :
					if clerk[0].isOnline :
						ret['result'] = 1
						ret['msg'] = 'show clerk info.'
						ret['info'] = {
							'jobnumber': clerk[0].jobnumber
						}
					else :
						ret['result'] = -4
						ret['msg'] = 'the clerk needs login.'
	else:
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def changeinfo(request):
	ret = {'result': 0}
	if request.method=='POST' :
		data = json.loads(request.body)
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			if group=='1' :
				customer = Customer.objects.filter(username=uname)
				if len(customer)==0 :
					ret['result'] = -2
					ret['msg'] = 'the customer does not exist.'
				elif len(customer)==1 :
					if customer[0].isOnline :
						if 'phone' in data :
							customer[0].phone = data['phone']
						if 'email' in data :
							customer[0].email = data['email']
						if 'realname' in data :
							customer[0].realName = data['realname']
						customer[0].save()
						ret['result'] = 1
						ret['msg'] = 'change customer info successfully.'
					else :
						ret['result'] = -4
						ret['msg'] = 'the customer needs login.'
			elif group=='0' :
				clerk = Clerk.objects.filter(username=uname)
				if len(clerk)==0 :
					ret['result'] = -2
					ret['msg'] = 'the clerk does not exist.'
				elif len(clerk)==1 :
					if clerk[0].isOnline :
						if 'jobnumber' in data :
							clerk[0].realName = data['jobnumber']
						clerk[0].save()
						ret['result'] = 1
						ret['msg'] = 'show clerk info.'
					else :
						ret['result'] = -4
						ret['msg'] = 'the clerk needs login.'
	else:
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def charge(request):
	ret = {'result': 0}
	if request.method=='POST' :
		data = json.loads(request.body)
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			#need to add alipay here.
			if group=='1' :
				customer = Customer.objects.filter(username=uname)
				if len(customer)==0 :
					ret['result'] = -2
					ret['msg'] = 'the customer does not exist.'
				elif len(customer)==1 :
					if customer[0].isOnline :
						customer[0].account += data['amount']
						customer[0].save()
						ret['result'] = 1
						ret['msg'] = 'charge successfully.'
					else :
						ret['result'] = -4
						ret['msg'] = 'the customer needs login.'
	else:
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret);
@csrf_exempt
def logout(request):
	ret = {'result': 0}
	if request.method=='POST' :
	#	data = json.loads(request.body)
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
			#print("%s"%(group))
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			print(group)
			if group=='1' :
				customer = Customer.objects.filter(username=uname)
				if len(customer)==0 :
					ret['result'] = -2
					ret['msg'] = 'the customer does not exist.'
				if len(customer)==1 :
					if customer[0].isOnline :
						customer[0].isOnline = False
						customer[0].save()
						request.session.flush()
						ret['result'] = 1
						ret['msg'] = 'customer logout successfully.'
					else :
						ret['result'] = -4
						ret['msg'] = 'the customer needs login.'
			elif group=='0' :
			#	print(group)
				clerk = Clerk.objects.filter(username=uname)
			#	print(len(clerk))
				if len(clerk)==0 :
					ret['result'] = -2
					ret['msg'] = 'the clerk does not exist.'
				if len(clerk)==1 :
					if clerk[0].isOnline :
						clerk[0].isOnline = False
						clerk[0].save()
						request.session.flush()
						ret['result'] = 1
						ret['msg'] = 'clerk logout successfully.'
					else :
						ret['result'] = -4
						ret['msg'] = 'the clerk needs login.'
	else :
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def recieveinfo(request):
	ret = {'result': 0}
	if request.method=='GET':
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:	
			return JsonResponse({'result': -4, 'msg': 'needs login.'})
		else:
			rcvlist = []
			for rcv in RecieveInfo.objects.all():
				if rcv.owner.username==uname :
					rcvlist.append({'reciever': rcv.reciever, 'address': rcv.address, 'phone': rcv.phone, 'postcode': rcv.postcode})
			ret['result'] = 1
			ret['msg'] = 'show recieve info'
			ret['recieveinfo'] = rcvlist
	else :
		ret['result'] = -5
		ret['msg'] = 'need GET request.'	
	return JsonResponse(ret)
@csrf_exempt
def changercvinfo(request):
	ret = {'result': 0}
	if request.method=='POST' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:	
			return JsonResponse({'result': -4, 'msg': 'needs login.'})
		else:
			data = json.loads(request.body)
			customer = Customer.objects.get(username=uname)
			before = data['before']
			b_reciever = before['reciever']
			b_address = before['address']
			b_phone = before['phone']
			b_postcode = before['postcode']
			rcvinfo = RecieveInfo.objects.filter(owner=customer, reciever=b_reciever, phone=b_phone, postcode=b_postcode, address=b_address)
			if len(rcvinfo)==0 :
				ret['result'] = -2
				ret['msg'] = 'the rcv info dose not exist.'
			elif len(order)==1 :
				after = data['after']
				order[0].address = after['address']
				order[0].reciever = after['reciever']
				order[0].phone = after['phone']
				order[0].postcode = after['postcode']
				order[0].save()
				ret['result'] = 1
				ret['msg'] = 'change recieve info successfully.'
	else :
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def delrcvinfo(request):
	ret = {'result': 0}
	if request.method=='POST' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:	
			return JsonResponse({'result': -4, 'msg': 'needs login.'})
		else:
			data = json.loads(request.body)
			customer = Customer.objects.get(username=uname)
			reciever = data['reciever']
			phone = data['phone']
			address = data['address']
			postcode = data['postcode']
			rcvinfo = RecieveInfo.objects.filter(owner=customer,reciever=reciever, phone=phone, address=address, postcode=postcode)
			if len(rcvinfo)==0 :
				ret['result'] = -2
				ret['msg'] = 'the rcv info dose not exist.'
			elif len(order)==1 :
				order.delete()
				ret['result'] = 1
				ret['msg'] = 'delete successfully.'
	else :
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def addrcvinfo(request):
	ret = {'result': 0}
	if request.method=='POST' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:	
			return JsonResponse({'result': -4, 'msg': 'needs login.'})
		else:
			data = json.loads(request.body)
			customer = Customer.objects.get(username=uname)
			reciever = data['reciever']
			phone = data['phone']
			address = data['address']
			postcode = data['postcode']
			rcvinfo = RecieveInfo.objects.get_or_create(owner=customer,reciever=reciever, phone=phone, address=address, postcode=postcode)
			if rcvinfo[1] :
				ret['result'] = 1
				ret['msg'] = 'add recieve info successfully.'
			else :
				ret['result'] = -3
				ret['msg'] = 'already exist.'
	else :
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)

#add Clerk purchase, putaway, takedown, deliver Goods
@csrf_exempt
def clerk_purchase(request):
	ret = {'result': 0}
	if request.method=='POST' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'result': -4, 'msg': 'needs login.'})
		else:
			if group=='0':
				data = json.loads(request.body)
				clerk = Clerk.objects.get(username=uname)
				goodslist = data['goodslist']
				totalprice = data['totalcost']
				producer = data['producer']
				remarks = data['remarks'] if 'remarks' in data else 'None'
				p_code = get_random_str()
				while(True):
					if(len(Purchase.objects.filter(code=p_code))==0):
						break
					else:
						p_code = get_random_str()
				purchase = Purchase.objects.get_or_create(code=p_code, clerk=clerk, operation='Purchase', goodsList=goodslist, totalPrice=totalprice, producer=producer, remarks=remarks)
				if purchase[1]:
					for g in goodslist:
						i_code = g['isbncode']
						cost = g['cost']
						name = g['name']
						count = g['number']
						g_find = Goods.objects.get_or_create(isbnCode=i_code)
						if g_find[1] :
							g_find[0].name = name
							g_find[0].repertory = count
							g_find[0].cost = cost
							g_find[0].save()
						else:
							g_find[0].repertory += count
							g_find[0].cost = cost
							g_find[0].save()
					ret['result'] = 1
					ret['msg'] = 'purchase successfully.'
				else:
					ret['result'] = -3
					ret['msg'] = 'server error.'
			else:
				ret['result'] = -2
				ret['msg'] = 'you are not a clerk.'
	else :
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def clerk_deliver(request):
	ret = {'result': 0}
	if request.method=='POST' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'result': -4, 'msg': 'needs login.'})
		else:
			if group=='0':
				data = json.loads(request.body)
				clerk = Clerk.objects.get(username=uname)
				order_code = data['code']
				logistics = data['logistics']
				expressnumber = data['expressnumber']
				remarks = data['remarks'] if 'remarks' in data else 'None'
				order = Order.objects.filter(code=order_code)
				if len(order)==0:
					ret['result'] = -1
					ret['msg'] = 'order not exist.'
				elif len(order)==1 :
					if order[0].isDelivered :
						ret['result'] = -3
						ret['msg'] = 'order already delivered.'
					else :
						rcvinfo = order[0].rcvInfo
						can_deliver = True
						for g in order[0].goodsList :
							g_order = Goods.objects.get(isbnCode=g['isbncode'])
							if g_order.repertory<g['number'] :
								can_deliver = False
								break;
						if can_deliver:
							deliver = Deliver.objects.get_or_create(clerk=clerk, logistics=logistics, expressnumber=expressnumber, order=order[0], recieveInfo=rcvinfo, operation='Deliver', remarks=remarks)
							if deliver[1]:
								d_order = deliver[0].order
								for g_deliver in d_order.goodsList :
									goods = Goods.objects.get(isbnCode=g_deliver['isbncode'])
									goods.repertory -= g_deliver['number']
									goods.save()
								d_order.isDelivered = True
								d_order.save()
								ret['result'] = 1
								ret['msg'] = 'add deliver successfully.'
							else :
								ret['result'] = -3
								ret['msg'] = 'deliver record already exist.'
						else :
							ret['result'] = -6
							ret['msg'] = 'lack of repertory, could not deliver.'
			else:
				ret['result'] = -2
				ret['msg'] = 'you are not a clerk.'
	else :
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def clerk_putaway(request):
	ret = {'result': 0}
	if request.method=='POST' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'result': -4, 'msg': 'needs login.'})
		else:
			if group=='0':
				data = json.loads(request.body)
				i_code = data['isbncode']
				price = data['price']
				goods = Goods.objects.filter(isbnCode=i_code)
				if len(goods)==0 :
					ret['result'] = -1
					ret['msg'] = 'goods not exist.'
				elif len(goods)==1 :
					if goods[0].repertory>1 :
						goods[0].price = price
						goods[0].isSelling = True
						goods[0].save()
						ret['result'] = 1
						ret['msg'] = 'putaway goods successfully.'
					else :
						ret['result'] = -3
						ret['msg'] = 'lack of goods repertory, could not putaway.'
			else:
				ret['result'] = -2
				ret['msg'] = 'you are not a clerk.'
	else :
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def clerk_takedown(request):
	ret = {'result': 0}
	if request.method=='POST' :
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'result': -4, 'msg': 'needs login.'})
		else:
			if group=='0':
				data = json.loads(request.body)
				i_code = data['isbncode']
				goods = Goods.objects.filter(isbnCode=i_code)
				if len(goods)==0 :
					ret['result'] = -1
					ret['msg'] = 'goods not exist.'
				elif len(goods)==1 :
					if goods[0].isSelling :
						goods[0].isSelling = False
						goods[0].save()
						ret['result'] = 1
						ret['msg'] = 'takedown goods successfully.'
					else :
						ret['result'] = -3
						ret['msg'] = 'goods is not selling.'
			else:
				ret['result'] = -2
				ret['msg'] = 'you are not a clerk.'
	else :
		ret['result'] = -5
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)

def get_random_str():
	uuid_val = uuid.uuid4()
	uuid_str = str(uuid_val).encode("utf-8")
	md5 = hashlib.md5()
	md5.update(uuid_str)
	return md5.hexdigest()
