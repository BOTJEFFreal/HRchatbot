# Generated by Django 3.2.22 on 2023-10-21 20:48

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('chatApp', '0002_numberoutput'),
    ]

    operations = [
        migrations.AddField(
            model_name='numberoutput',
            name='sentiment_output',
            field=models.TextField(default='Neutral'),
        ),
    ]
