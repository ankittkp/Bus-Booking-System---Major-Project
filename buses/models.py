from django.db import models


# Create your models here.
class Routes(models.Model):
    source = models.CharField(max_length=25)
    destination = models.CharField(max_length=25)
    date = models.DateField(default='1950-01-01')
    time = models.TimeField(default='00:00:00')
    fare = models.IntegerField(default=0)
    def __str__(self):
        return self.source

class SendMessage(models.Model):
    Message = models.CharField(max_length = 140,blank=False,null=True)
    Email = models.CharField(max_length = 140,blank=False,null=True)