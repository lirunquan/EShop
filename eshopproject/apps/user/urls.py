from django.urls import path
from . import views
urlpatterns = [
    #path('admin/', admin.site.urls),
    #path('user/', include('apps.user.urls')),
    #path(''),
    path('login', views.login, name='login'),
    path('register', views.register, name='register'),
    path('changepwd', views.changepwd, name='changepwd'),
    path('checkinfo', views.checkinfo, name='checkinfo'),
    path('changeinfo', views.changeinfo, name='changeinfo'),
    path('charge', views.charge, name='charge'),
    path('logout', views.logout, name='logout'),
    path('checkrecieve', views.recieveinfo, name='checkrecive'),
    path('changerecieve', views.changercvinfo, name='changerecieve'),
    path('deleterecieve', views.delrcvinfo, name='deleterecieve'),
    path('addrecieve', views.addrcvinfo, name='addrecieve'),
]