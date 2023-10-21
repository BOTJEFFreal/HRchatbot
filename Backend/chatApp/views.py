from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth.models import User

from .functions import getReplies, getReply
from .models import *

@api_view(['POST'])
def reply_to_message(request):
    sender_id = request.data.get('sender_id')
    content = request.data.get('content')
    
    if sender_id and content:
        sender = User.objects.get(pk=sender_id)
        message = Message.objects.create(sender=sender, content=content)
        
        reply_text = "Dummy_text"  # Assuming getReply takes the content as argument
        return Response({'message_id': message.id, 'reply_text': reply_text}, status=status.HTTP_201_CREATED)
    else:
        return Response({'error': 'Invalid data'}, status=status.HTTP_400_BAD_REQUEST)

