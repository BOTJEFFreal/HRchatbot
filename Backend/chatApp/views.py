from .sentiment_model import generate_random_sentiment, get_Sentiment
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.contrib.auth.models import User
from rest_framework.views import APIView


from .serializers import NumberOutputSerializer

from .functions import get_completion, get_completion_from_messages,collect_messages
from .models import *

# storing Apple company HR docs
company_docs="""
The way we do business worldwide
Apple conducts business ethically, honestly, and in full compliance with applicable laws and regulations. This applies to every business decision in every area of the company worldwide.
The following principles guide Apple’s business practices:
• Honesty—Demonstrate honesty and high ethical standards in all business dealings.
• Respect—Treat customers, partners, suppliers, employees, and others with respect and courtesy.
• Confidentiality—Protect Apple’s confidential information and the information of our customers, partners, suppliers, and
employees.
• Compliance—Ensure that business decisions comply with applicable laws and regulations.

Your Responsibilities and Obligation to Take Action Everything we do is a reflection of Apple. We expect you to: • Follow the Policy. Comply with the letter and spirit of Apple’s Business Conduct Policy and all applicable legal requirements. • Speak up. If you see or hear of any violation of Apple’s Business Conduct Policy, other Apple policies, or legal or regulatory requirements, you must notify either your manager, People Team, Legal, or Business Conduct. • Use good judgment and ask questions. Apply Apple’s principles of business conduct, and review our policies and legal requirements. When in doubt about how to proceed, discuss it with your manager, your People Business Partner, Legal, The way we do business worldwide Apple conducts business ethically, honestly, and in full compliance with applicable laws and regulations. This applies to every business decision in every area of the company worldwide. Business Conduct August 2022 4 Introduction Behaviors Protecting Apple Accountability Integrity Resources or Business Conduct. Any failure to comply with Apple’s Business Conduct Policy—or failure to report a violation—may result in disciplinary action, up to and including termination of employment.

Reporting a Concern
To report a concern or ask a question about Apple’s Business Conduct Policy, you can contact Business Conduct by phone, email, or web form. For contact details, visit the Business Conduct website or the Resources section at the end of this policy. Apple’s external helpline (apple.ethicspoint.com) also allows employees and external parties to report concerns with the option of remaining anonymous, where permissible under applicable laws. The external helpline provides local, toll-free phone numbers that connect employees and external parties to a multilingual reporting service.
Your information will be shared only with those who have a need to know to help answer your questions or investigate concerns, ensure the prompt enforcement of this Policy, and, if appropriate, determine disciplinary action. If your information involves accounting, finance, or auditing, the law may require that necessary information be shared with the Audit and Finance Committee of the Board of Directors. Apple’s Business Conduct Policy is administered by the Business Conduct organization, under the oversight of Apple’s Chief Compliance Officer, who provides regular updates to the Audit and Finance Committee of the Board of Directors. The Business Conduct team is available to support all employees and answer questions on business conduct issues, policies, regulations, and compliance with legal requirements.

Your Rights as an Employee
You are permitted to speak freely about your wages, hours, and working conditions, including information about harassment, discrimination, or any other conduct you have reason to believe is unlawful, and nothing in this Policy, or any Apple policy, should be interpreted as being restrictive of your right to do so.

Drugs and Alcohol
Apple cares about the health and safety of our employees. You are expected to comply with Apple’s guidelines regarding alcohol, drugs, and smoking, whether it is in the workplace, at Apple-sponsored events, or while conducting Apple business. You are not permitted to be under the influence of any legal or illegal drug that impairs your ability to perform your job, and employees are prohibited from manufacturing, soliciting, distributing, possessing, or using any illegal drugs or substances in the workplace, or while working. Use good judgment and keep in mind that you are expected to perform to your full ability at work. For more information, see the Alcohol, Drugs and Smoke-Free Environment Policy.

Environment, Health, and Safety (EH&S)
Apple is committed to protecting the environment, health, and safety of our employees, customers, and the global communities where we operate.
Apple’s EH&S team provides guidance on how to conduct your job while meeting or exceeding all applicable environmental, health, and safety requirements. Use good judgment and always put the environment, health, and safety first. Work proactively with the EH&S team to anticipate and manage EH&S risks in a timely manner.

Non-Disclosure/Confidentiality Agreements
Never share confidential information about Apple’s products or services without your manager’s approval. When there is a business need to share confidential information with a supplier, vendor, or other third party, never volunteer more than what is necessary to address the business at hand. Any confidential information shared outside Apple should be covered by a non-disclosure/confidentiality agreement (NDA). Contact Legal in your region to obtain an NDA. In the United States, you can find NDA information and support on the Legal website.
"""
context = [
      {'role':'system', 'content':f"""
      You are a HR bot, a bot that answers questions from the company documents that you receive of the video.\
      You will get questions and you need to answer them according to the\
      the company documents. If not present in it, then get then answer- 'Not found in company documents'\
      You respond in a short, very conversational friendly style.\
      This is the company docs: <{company_docs}>
      """}]
question=""

@api_view(['POST'])
def reply_to_message(request):
    sender_id = request.data.get('sender_id')
    content = request.data.get('content')
    
    if sender_id and content:
        sender = User.objects.get(pk=sender_id)
        message = Message.objects.create(sender=sender, content=content)
        question=content
        # getting response from GPT on the basis of previous messages
        reply_text = '''As an employee of Apple, based on the provided HR documents, your rights include the following:

Freedom of Speech: You are permitted to speak freely about your wages, hours, and working conditions, including information about harassment, discrimination, or any other conduct you have reason to believe is unlawful. Nothing in the Policy or any Apple policy should restrict your right to do so.

'''#collect_messages(question,context)
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
            sentiment_output = generate_random_sentiment(answers[0], answers[1], answers[2], answers[3], answers[4])

            output = NumberOutput(
                user_id=sender_id,
                answer1=answers[0],
                answer2=answers[1],
                answer3=answers[2],
                answer4=answers[3],
                answer5=answers[4],
                total=total,
                sentiment_output=sentiment_output
            )

            output.save()  # Save the instance to the database

            serializer = NumberOutputSerializer(output)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response({'error': 'Invalid input. Please provide 5 answers.'}, status=status.HTTP_400_BAD_REQUEST)


class NumberOutputListView(APIView):
    def get(self, request, format=None):
        outputs = NumberOutput.objects.all()
        serializer = NumberOutputSerializer(outputs, many=True)
        return Response(serializer.data)