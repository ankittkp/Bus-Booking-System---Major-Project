from django.conf.urls import url
from . import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'search/$', views.busesroutes, name='search'),
    url(r'register/$', views.form, name='data_form'),
    # url(r'^register/(?P<value>\d+)/$', views.form,name='data_form'),
    url(r'^process/$', views.payment_process, name='thankyou'),
    url(r'^done/$', views.payment_done, name='done'),
    url(r'^canceled/$', views.payment_canceled, name='canceled'),
]
