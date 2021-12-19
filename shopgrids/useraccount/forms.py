from django import forms
from django.forms import fields
from .models import Accounts



class Registrationform(forms.ModelForm):
    password = forms.CharField(required = False,widget=forms.PasswordInput(attrs={

        'placeholder': 'Enter password',
        'class': 'form-control',
    }))
    confirm_password = forms.CharField(required = False, widget=forms.PasswordInput(attrs={
                

        'placeholder': 'Confirm password',
        'class': 'form-control',
    }))
    phone_number = forms.CharField(required = False, widget=forms.NumberInput(attrs={
                

        'type': 'number',
        'oninput':'javascript: if(this.value > this.maxLength) this.value = this.value.slice(0, this.maxLength)',
        'maxlength' : '10',
        'onkeypress':'return isNumber(event)'

    }))
    email = forms.CharField(required = False, widget=forms.EmailInput(attrs={
                
        'placeholder': 'Enter Email',


    }))

    class Meta:
        model = Accounts
        fields = ['first_name' ,'last_name' ,'phone_number', 'username', 'password', 'referral_code']

    
    def __init__(self, *args, **kwargs):
        super(Registrationform, self).__init__(*args, **kwargs)
        self.fields['first_name'].widget.attrs['placeholder'] = 'Enter First Name'
        self.fields['last_name'].widget.attrs['placeholder'] = 'Enter Last Name'
        self.fields['phone_number'].widget.attrs['placeholder'] = 'Enter Phone Number'
        self.fields['username'].widget.attrs['placeholder'] = 'Enter Username'
        self.fields['referral_code'].widget.attrs['placeholder'] = 'Enter Referral Code'
        self.fields['referral_code'].widget.attrs['oninput'] = 'javascript: if(this.value > this.maxLength) this.value = this.value.slice(0, this.maxLength)'
        self.fields['referral_code'].widget.attrs['maxlength'] = '8'



        for field in self.fields:
            self.fields[field].widget.attrs['class'] = 'form-control'

    
    def clean(self):
        cleaned_data = super(Registrationform, self).clean()
        password = cleaned_data.get('password')
        confirm_password = cleaned_data.get('confirm_password')

        if password != confirm_password:
            raise forms.ValidationError(
                "Password does not match"
            )


