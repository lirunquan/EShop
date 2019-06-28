from django.urls import path
from . import views

urlpatterns = [
	path('checkbyuser', views.checkorderbyuser, name='checkbyuser'),
	path('checkbycode', views.checkorderbycode, name='checkbycode'),
	path('create', views.createorder, name='create'),
	path('getpaid', views.getpaid, name='getpaid'),
]
