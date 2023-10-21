import pandas as pd
import numpy as np
import pandas as pd
import joblib

def get_Sentiment(n1,n2,n3,n4,n5):

    # trained model being loaded
    regressor = joblib.load('Backend/chatApp/ML_model/regressor_model.pkl')

    # Features for prediction
    new_data = [[1, 1, 1, 1, 1]]
    new_data[0][0] = n1
    new_data[0][1] = n2
    new_data[0][2] = n3
    new_data[0][3] = n4
    new_data[0][4] = n5

    # Predict the score using the trained regression model
    predicted_score = regressor.predict(new_data)

    # print("Predicted Score:", predicted_score[0])
    # Find the index of the highest probability
    predicted_sentiment_index = np.argmax(predicted_score)

    # List of sentiment categories
    sentiment_categories = [
        'Engaged', 'Exhausted', 'Focused',
        'Frustrated', 'Inspired', 'Neutral',
        'Overwhelmed', 'Resentful', 'Stressed',
        'Unhappy'
    ]

    # Print the sentiment with the highest probability
    predicted_sentiment = sentiment_categories[predicted_sentiment_index]
    # print("Predicted Sentiment:", predicted_sentiment)
    return predicted_sentiment