from django.urls import path
from .views import *

urlpatterns = [
    path('reply/', reply_to_message, name='reply_to_message'),
    path('number-output/', NumberOutputView.as_view(), name='number-output'),

    # Add other URL patterns as needed
]