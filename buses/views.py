import objects as objects
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect, HttpResponse
from django.core.mail import send_mail
import pymysql
#from .models import Routes
from django.shortcuts import render ,redirect
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from django.conf import settings
from paypal.standard.forms import PayPalPaymentsForm
connection = pymysql.connect(host='localhost',user='root',password='Enter Your DB Password',db='busroad')
a =connection.cursor()

from buses.forms import sendMessageForm
from django.core import mail
from django.template.loader import render_to_string
from django.utils.html import strip_tags



# Create your views here.
def index(request):
    return render(request, 'main/index.html')

def busesroutes(request):
    print("xxx")
    row=""
    print(request.method)
    if request.method == 'POST':
        fromStation = request.POST.get("stationFrom")
        toStation = request.POST.get("stationTo")
        dte = request.POST.get("date")
        print(fromStation)
        print(toStation)
        print(dte)
        print("xxx")
        #sql_select_Query = "select * from buses_routes where source= (%s) ",fromStation
        cursor = connection.cursor()
        cursor.execute( "select * from buses_routes where source= %s AND destination = %s  AND date = %s",(fromStation,toStation,dte))
        row = cursor.fetchall()
        print("Total number of rows in Laptop is: ", cursor.rowcount)
    if(cursor.rowcount == 0) :
        return render(request,'main/nobuses_available.html')
    else:
        print(row)
        data = []
        for e in row:
            print(e)
            temp = {}
            temp['id'] = e[0]
            print(temp['id'])
            temp['bus_name']=e[1]
            temp['source'] = e[2]
            temp['destination'] = e[3]
            temp['date'] = e[4]
            temp['fare'] = e[5]
            temp['time'] = e[6]
            temp['avail_seats'] = e[7]
            data.append(temp)
            print(data)
        #return render(request, 'main/index.html', {"buses_routes":data})
        #l = Routes.objects.get_queryset('select * from buses_routes where id = 2')
        #print(l)
        return render(request, 'main/searchpage.html',{"objects":data})
def form(request):
    print(request.method)
    i = request.GET.get('search')
    print(i)
    routeid = {}
    routeid['id'] = i
    print(routeid)
    i = int(i)
    cursor = connection.cursor()
    cursor.execute("select * from buses_routes where id = %s ", (i))
    row = cursor.fetchall()
    for e in row:
        print(e)
        temp = {}
        temp['id'] = e[0]
        print(temp['id'])
        temp['bus_name'] = e[1]
        temp['source'] = e[2]
        temp['destination'] = e[3]
        temp['date'] = e[4]
        temp['fare'] = e[5]
        temp['time'] = e[6]
        temp['avail_seats'] = e[7]
    cursor = connection.cursor()
    cursor.execute("select * from user_db where bus_id= %s AND user_date=%s" ,(i,temp['date']))
    row = cursor.fetchall()
    print("Total number of rows in Laptop is: ", cursor.rowcount)
    print(row)
    data = []
    for e in row:
        x = int(e[10])
        data.append(x)
    print(data)
    seats_window = []
    seats_aisle = []
    seats_present = {}
    for x in data :
        seats_present[x] = 1
    print(seats_present)
    for i in range(1,41) :
        if i in seats_present.keys():
            print(x)
        else:
            if i % 4 == 0 or i % 4 == 1:
                seats_window.append(i)
            else:
                seats_aisle.append(i)
    print(seats_window)
    print(seats_aisle)
    seatdata = []
    seatdata.append(routeid)
    seatdata.append({"seats_window":seats_window})
    seatdata.append({"seats_aisle": seats_aisle})
    print(seatdata)
    print(seatdata[1]['seats_window'][0])
    # return render(request, 'main/registration.html',{'routeid':routeid})
    return render(request, 'main/registration.html', {"seatdata":seatdata})

@csrf_exempt
def payment_done(request):
    print(request.method)
    i = request.GET.get('custom')
    print(i)
    return render(request, 'done.html')


@csrf_exempt
def payment_canceled(request):
    return render(request, 'main/canceled.html')


def payment_process(request):
    print("xxx")
    row = ""
    print(request.method)
    if request.method == 'POST':
        name = request.POST.get("name")
        phone = request.POST.get("phone")
        gender = request.POST.get("gender")
        email = request.POST.get("email")
        window = request.POST.get("window")
        aisle = request.POST.get("aisle")
        routeid = request.POST.get("i")
        print(name)
        print(phone)
        print(gender)
        print(email)
        print(window)
        print(aisle)
        print(routeid)
        print("xxx")
        window = int(window)
        aisle = int(aisle)
        if(window >0 and aisle > 0) :
            return render(request,"main/selectoneseat.html")
        elif(window != 0):
            seatno = int(window)
        else:
            seatno = int(aisle)
        print(seatno)
        if(len(name) == 0 or len(phone) < 10 or len(gender) == 0 or len(email) == 0 ):
            return render(request,'main/enter_complete_details.html')
    cursor = connection.cursor()
    cursor.execute( "select * from buses_routes where id = %s ",(routeid))
    row = cursor.fetchall()
    for e in row:
        print(e)
        temp = {}
        temp['id'] = e[0]
        print(temp['id'])
        temp['bus_name'] = e[1]
        temp['source'] = e[2]
        temp['destination'] = e[3]
        temp['date'] = e[4]
        temp['fare'] = e[5]
        temp['time'] = e[6]
        temp['avail_seats'] = e[7]

    host = request.get_host()
    print("Total number of rows in Laptop is: ", cursor.rowcount)
    current_seat = temp['avail_seats']-1
    cursor.execute("update buses_routes set ava_seats = %s where id = %s ",(current_seat,routeid))
    temp['seatno'] = seatno
    paypal_dict = {
        'business' : settings.PAYPAL_RECEIVER_EMAIL,
        'amount' : temp['fare'],
        "item_name": "Seat_booking",
        'invoice': "11",
        'currency_code': 'INR',
        'notify_url': 'http://{}{}'.format(host,reverse('paypal-ipn')),
        'return_url': 'http://{}{}'.format(host, reverse('done')),
        'cancel_return': 'http://{}{}'.format(host, reverse('canceled')),
        'custom': temp,
    }

    #cursor.execute(
        #"INSERT INTO user_db (user_name, user_phone, user_gender, user_email, user_bus, user_source, user_destination, user_date, user_time, user_seatNo, user_fare) VALUES ('archit', '16789', 'M', 'john@gmail.com', 'Shimla Travels', 'Hamirpur', 'Shimla', '2019-11-22', '12:00:00.000000', '4', '220');")
    cursor.execute("insert into user_db (user_name,user_phone, user_gender, user_email, bus_id,user_bus, user_source, user_destination, user_date, user_time, user_seatNo, user_fare) values(%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)",(name,phone,gender,email,routeid,temp['bus_name'],temp['source'],temp['destination'],temp['date'],temp['time'],seatno,temp['fare']))
    connection.commit()
    row = cursor.fetchall()
    print("Total number of rows in Laptop is: ", cursor.rowcount)
    print(row)
    print('db updated')
    form = PayPalPaymentsForm(initial=paypal_dict)

    subject = 'Ticket Booked'
    message = ' Thank You for booking a ticket from Bus Booking Site. Your Booking Details is: Bus Name:' +temp['bus_name']+ ' From: ' +temp['source']+ ' To: ' +temp['destination']+'. Your Bus is scheduled at: '+str(temp['date']) +' '+str(temp['time'])+'. Bus Fare: Rs. '+str(temp['fare'])+' and Your Seat No. is:'  + str(seatno)
    email_from = settings.EMAIL_HOST_USER
    recipient_list = [email,]
    send_mail(subject, message, email_from, recipient_list)

    # subject = 'This is Demo!'
    # html_message = render_to_string('main/email_template.html')
    # plain_message = strip_tags(html_message)
    # from_email = settings.EMAIL_HOST_USER
    # to = 'architiiitmahajan@gmail.com'
    # mail.send_mail(subject, plain_message, from_email, [to], html_message=html_message
    return render(request, 'process.html', {'form':form})

def sendDemoMail():
	subject = 'This is Demo!'
	html_message = render_to_string('main/email_template.html')
	plain_message = strip_tags(html_message)
	from_email = 'From <localhost@example.com>'
	to = 'test@example.com'
	mail.send_mail(subject,plain_message,from_email,[to],html_message=html_message)

def thankyou(request):
    print("xxx")
    row = ""
    print(request.method)
    if request.method == 'POST':
        name = request.POST.get("name")
        phone = request.POST.get("phone")
        gender = request.POST.get("gender")
        email = request.POST.get("email")
        window = request.POST.get("window")
        aisle = request.POST.get("aisle")
        routeid = request.POST.get("routeid")
        print(name)
        print(phone)
        print(gender)
        print(email)
        print(window)
        print(aisle)
        print(routeid)
        print("xxx")
def make_reservation(request):
    b_id=""
    s_station=""
    e_station=""
    t_date=""
    tod=""
    s_free=""
    cho=""
    if request.method == 'POST':
        b_id = request.POST.get("ti")
        s_station = request.POST.get("ss")
        e_station = request.POST.get("es")
        t_date = request.POST.get("trd")
        tod = request.POST.get("tod")
        s_free = request.POST.get("sf")
        cho = request.POST.get("cho")
    data = {}
    data["bus_id"] = b_id
    data["start_station"] = s_station
    data["end_station"] = e_station
    data["travel_date"] = t_date
    data["time_of_day"] = tod
    data["seats_free"] = s_free
    data["chosen"] = cho
    return render(request, 'main/reservation.html', {"selected":data})

def view_reservation(request):
    return render(request, 'main/view-res.html')



def book_ticket(request):
    last_name=""
    first_name=""
    payment=""
    b_id=""
    s_station=""
    e_station=""
    t_date=""
    tod=""
    s_free=""
    cho=""
    if request.method=="POST":
        last_name = request.POST.get("lname")
        first_name = request.POST.get("fname")
        payment = request.POST.get("pay")
        b_id = request.POST.get("ti")
        s_station = request.POST.get("ss")
        e_station = request.POST.get("es")
        t_date = request.POST.get("trd")
    with connection.cursor() as cursor:
            # get_ticket('Rafael','Li Chen','Free Ticket', @out_value)
            cursor.execute("update avail_buses set chosen=1 where bus_id="+b_id+" and start_station="+s_station+" and end_station="+e_station+" and travel_date='"+str(t_date)+"'")
            ret = cursor.callproc("get_ticket", [first_name, last_name, payment, ""])
            # row = cursor.fetchall()
    return render(request, 'main/reservation.html', {"result":"good to go"})

def my_custom_sql():
    with connection.cursor() as cursor:
        cursor.execute("SELECT station_name from stations")
        row = cursor.fetchall()
    print (row)
    return row
