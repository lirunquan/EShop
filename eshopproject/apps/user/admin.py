from django.contrib import admin

# Register your models here.
from .models import Customer, Clerk, RecieveInfo
admin.site.register(Customer)
admin.site.register(Clerk)
admin.site.register(RecieveInfo)