from .sentiment_model import get_Sentiment
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth.models import User
from rest_framework.views import APIView


from .serializers import NumberOutputSerializer

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


class NumberOutputView(APIView):
    def post(self, request, format=None):
        sender_id = request.data.get('sender_id')
        answers = [
            request.data.get('answer1'),
            request.data.get('answer2'),
            request.data.get('answer3'),
            request.data.get('answer4'),
            request.data.get('answer5')
        ]

        if all(answers) and len(answers) == 5:
            total = sum(map(int, answers))
            sentiment_output=get_Sentiment(answers[0],answers[1],answers[2],answers[3],answers[4])

            output = NumberOutput.objects.create(
                user_id=sender_id,
                answer1=answers[0],
                answer2=answers[1],
                answer3=answers[2],
                answer4=answers[3],
                answer5=answers[4],
                total=total,
                sentiment_output=sentiment_output
            )

            serializer = NumberOutputSerializer(output)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response({'error': 'Invalid input. Please provide 5 answers.'}, status=status.HTTP_400_BAD_REQUEST)