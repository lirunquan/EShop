from django.urls import path
from . import views
urlpatterns = [
	path('list', views.goods_look, name='list'),
	path('detail', views.goods_detail, name='detail')
]