# Generated by Django 4.2.6 on 2023-10-21 18:50

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('chatApp', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='NumberOutput',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('answer1', models.TextField()),
                ('answer2', models.TextField()),
                ('answer3', models.TextField()),
                ('answer4', models.TextField()),
                ('answer5', models.TextField()),
                ('total', models.IntegerField()),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
