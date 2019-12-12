from django.shortcuts import render, get_object_or_404
from decimal import Decimal
from django.conf import settings
from django.urls import reverse
from paypal.standard.forms import PayPalPaymentsForm
from django.views.decorators.csrf import csrf_exempt
import pymysql
connection = pymysql.connect(host='localhost',user='root',password='Enter Your DB Password',db='busroad')
a =connection.cursor()

@csrf_exempt
def payment_done(request):
    return render(request, 'main/done.html')


@csrf_exempt
def payment_canceled(request):
    return render(request, 'main/canceled.html')


def payment_process(request):
    cursor = connection.cursor()
    cursor.execute("select * from buses_routes where source= %s AND destination = %s  AND date = %s",(fromStation, toStation, dte))
    bus = cursor.fetchall()
    host = request.get_host()
    print("Total number of rows in Laptop is: ", cursor.rowcount)
    paypal_dict = {
        'business' : settings.PAYPAL_RECEIVER_EMAIL,
        'amount' : '120',
        'currency_code': 'USD',
        'notify_url': 'http://{}{}'.format(host,reverse('paypal-ipn')),
        'return_url': 'http://{}{}'.format(host, reverse('payment:done')),
        'cancel_return': 'http://{}{}'.format(host, reverse('payment:canceled')),
    }
    form = PayPalPaymentsForm(initial=paypal_dict)
    return render(request, 'main/process.html', {'bus':bus,'form':form})


