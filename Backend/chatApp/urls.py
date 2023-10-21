from django.urls import path
from .views import reply_to_message

urlpatterns = [
    path('reply/', reply_to_message, name='reply_to_message'),
    # Add other URL patterns as needed
]