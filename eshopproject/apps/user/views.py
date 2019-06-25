from django.shortcuts import render
import json
from django.views.decorators.csrf import csrf_exempt
from .models import Clerk, Customer
from django.http import JsonResponse
# Create your views here.

@csrf_exempt
def login(request):
	pass
def register(request):
	pass
