from django import forms
from buses.models import SendMessage

class sendMessageForm(forms.ModelForm):
	class Meta:
		model = SendMessage
		fields = ('Message','Email',)