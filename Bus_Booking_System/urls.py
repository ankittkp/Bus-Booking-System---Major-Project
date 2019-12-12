from django.contrib import admin
from django.conf.urls import url, include
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^', include('buses.urls')),
    url(r'^paypal/',include('paypal.standard.ipn.urls')),
    # url(r'^payment/',include('payment.urls'),name='payment')
]