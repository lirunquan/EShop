from django.shortcuts import render
import json
from django.views.decorators.csrf import csrf_exempt
from .models import Clerk, Customer
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
				if customer[0].password==pwd :
					customer[0].isOnline = True
					customer[0].lastLogin = timezone.localtime(timezone.now())
					customer[0].save()
					request.session['user_id'] = customer[0].username
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
				if clerk[0].password==pwd :
					clerk[0].isOnline = True
					clerk[0].lastLogin = timezone.localtime(timezone.now())
					clerk[0].save()
					request.session['user_id'] = clerk[0].username
					ret['result'] = 1
					ret['msg'] = 'clerk login successfully.'
				else:
					ret['result'] = -1
					ret['msg'] = 'incorrect password.'
	else:
		ret['result'] = -3
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
				ret['result'] = -1
				ret['msg'] = 'customer already exist.'
	else :
		ret['result'] = -3
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
@csrf_exempt
def changepwd(request):
	ret = {'result': 0}
	if request.method=='POST':
		data = json.loads(request.body)
		uname = data['username']
		oldpwd = data['old_password']

	return JsonResponse(ret)
@csrf_exempt
def checkinfo(request):
	ret = {'result': 0}

	return JsonResponse(ret)
@csrf_exempt
def logout(request):
	ret = {'result': 0}
	if request.method=='POST' :
		data = json.loads(request.body)
		uname = data['username']
		group = data['group']
		if group=='Customer' :
			customer = Customer.objects.filter(username=uname)
			if len(customer)==1 :
				if customer[0].isOnline :
					customer[0].isOnline = True
					customer[0].save()
					request.session.flush()
					ret['result'] = 1
					ret['msg'] = 'customer logout successfully.'
		elif group=='Clerk' :
			clerk = Clerk.objects.filter(username=uname)
			if len(clerk)==1 :
				if clerk[0].isOnline :
					clerk[0].isOnline = True
					clerk[0].save()
					request.session.flush()
					ret['result'] = 1
					ret['msg'] = 'clerk logout successfully.'
	else :
		ret['result'] = -3
		ret['msg'] = 'need POST request.'
	return JsonResponse(ret)
