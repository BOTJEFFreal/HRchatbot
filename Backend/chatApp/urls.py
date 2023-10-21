from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('reply/', reply_to_message, name='reply_to_message'),
    path('number-output/', NumberOutputView.as_view(), name='number-output'),
    path('form_outputs/', NumberOutputListView.as_view(), name='number-output-list'),


    # Add other URL patterns as needed
]
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
