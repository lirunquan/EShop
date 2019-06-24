from django.contrib import admin

# Register your models here.
from .models import Customer, Clerk
admin.site.register(Customer)
admin.site.register(Clerk)
