from django.db import models
from django.contrib.auth.models import User

class Message(models.Model):
    sender = models.ForeignKey(User, on_delete=models.CASCADE, related_name='sent_messages')
    content = models.TextField()
    timestamp = models.DateTimeField(auto_now_add=True)

class NumberOutput(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    answer1 = models.TextField()
    answer2 = models.TextField()
    answer3 = models.TextField()
    answer4 = models.TextField()
    answer5 = models.TextField()
    total = models.IntegerField()

    def __str__(self):
        return f'Total: {self.total}'
