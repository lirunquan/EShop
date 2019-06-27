from django.urls import path
from . import views
urlpatterns = [
    #path('admin/', admin.site.urls),
    #path('user/', include('apps.user.urls')),
    #path(''),
    path('login', views.login, name='login'),
    path('register', views.register, name='register'),
    path('logout', views.logout, name='logout'),
]