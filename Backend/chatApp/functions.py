# pip install openai
# create key.txt and paste your secret api key in it
import openai
import os
OPENAI=os.environ.get('OPENAI')
# to generate an answer to a prompt from chatGPT
def get_completion(prompt, model="gpt-3.5-turbo-16k"):
    messages = [{"role": "user", "content": prompt}]
    response = openai.ChatCompletion.create(
        model=model,
        messages=messages,
        temperature=0, # this is the degree of randomness of the model's output
    )
    return response.choices[0].message["content"]

# to store previous messages in chat and generate answer to prompts on the basis of history of conversation
def get_completion_from_messages(messages, model="gpt-3.5-turbo-16k", temperature=0):
     response = openai.ChatCompletion.create(
        model=model,
        messages=messages,
        temperature=temperature, # this is the degree of randomness of the model's output
    )
     return response.choices[0].message["content"]

# to collect all the messages together and generate an array for conversations
def collect_messages(text,context):
    prompt = text
    context.append({'role':'user', 'content':f"{prompt}"})
    response = get_completion_from_messages(context)
    context.append({'role':'assistant', 'content':f"{response}"})
    return response

