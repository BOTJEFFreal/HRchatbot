# HRGenius

The project contains two parts: <br />
(i) HR chatbot: This allows an organisation to upload their company documnents and enable employees to ask basic HR questions to the chatbot itself without wasting much working hours over it. <br />
(ii) Sentiment Analyser: This allows HRs to monitor the wellbeing of their employees using short one-minute surveys everyday and getting analysis of sentiments based on them. A machine learning algorithm has been trained over a dataset to identify 9 types of employee sentiments and proper questions have been taken from thi kaggle dataset:[https://www.kaggle.com/datasets/harriken/myhappyforce-survey-employee-stress?select=scoreMetadata.csv] <br />

## Modules

To run this project: 

1. Setting up the virtual env
    i. MacOS: python3 -m venv venv
    ii. Activate it: source venv/bin/activate
2. Install Django
    i. Install necessary packages: pip install -r requirements.txt
    ii. Check version: python3 -m django --version
3. Run the application

The project has also been hosted on render and can be accessed via these API links:
(i) HR Chatbot: [https://hr-chatbot-3sh8.onrender.com]
(ii) Sentiment Analyser: [https://hrfrontend-two.vercel.app/]

This project was created as a part of EightFold AI Hackathon at BITS Pilani, Pilani!
