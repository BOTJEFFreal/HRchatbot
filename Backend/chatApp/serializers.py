from rest_framework import serializers
from .models import NumberOutput

class NumberOutputSerializer(serializers.ModelSerializer):
    class Meta:
        model = NumberOutput
        fields = ['user', 'answer1', 'answer2', 'answer3', 'answer4', 'answer5', 'total']
