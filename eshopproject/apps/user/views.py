from django.shortcuts import render
import json
from django.views.decorators.csrf import csrf_exempt
from .models import Clerk, Customer, RecieveInfo
from django.http import JsonResponse
from django.utils import timezone
import datetime
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
			if group=='Customer' :
				customer = Customer.objects.filter(username=uname)
				if len(customer)==0 :
					ret['result'] = -2
					ret['msg'] = 'the customer does not exist.'
				elif len(customer)==1 :
					if customer[0].isOnline :
						if customer[0]==oldpwd :
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
			elif group=='Clerk' :
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
			if group=='Customer' :
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
			elif group=='Clerk' :
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
			if group=='Customer' :
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
			elif group=='Clerk' :
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
			if group=='Customer' :
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
		data = json.loads(request.body)
		try:
			uname = request.session['user_id']
			group = request.session['user_group']
		except Exception as e:
			return JsonResponse({'request': -4, 'msg': 'needs login.'})
		else:
			if group=='Customer' :
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
			elif group=='Clerk' :
				clerk = Clerk.objects.filter(username=uname)
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
		ret['msg'] = 'need POST request.'	
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

	return JsonResponse(ret)
@csrf_exempt
def delrcvinfo(request):
	ret = {'result': 0}
	return JsonResponse(ret)
@csrf_exempt
def addrcvinfo(request):
	ret = {'result': 0}
	return JsonResponse(ret)
