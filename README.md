# scan_score_TFLite

Creating a solution to grade writeups using Deep Learning. This app is aimed to provide virtual assistance to students in evaluating their write-ups. The user/student needs to upload their piece of writing and by using the power of Machine Learning, the write-up will be graded.

Support: Currently Android only
Created using Flutter

Input Methods:
The text can be given as an input in three different forms:
  1. Image: Any form of printed text can be given as an input and by using the OCR feature of ML Kit, it converts into editable texts.
        Package Used: https://pub.dev/packages/firebase_ml_vision
  2. Audio: The Audio is converted into editable texts in real time.
        Package Used: https://pub.dev/packages/speech_to_text
  3. Text: The Text input

Using the Firebase ML-Kit's Vision plugin, the OCR has being implemented.

Grading:

  1. On-Device using TensorFlow Lite: After multiple attempts the model has been successfully converted into TFLite Format, here's the script along with the results.
  Script for converting the Model to TFLite :
    https://colab.research.google.com/drive/1BXHwQAxLqmjlEob4uw1fLCYFDEHuXVwg?usp=sharing
    
    [ NOTE: Currently I am unable to integrate this TFLite Model with Flutter. ]

  2. Using a REST API: The scanned/typed text is sent to an API hosted on Heroku. The detailed implementation is shown in the following repository.
  Creating an API for the ML Model using Flask + Heroku:
    https://github.com/TravellerOnCode/Deploy-Deep-Learning-Model-to-Flask-TensorFlow-2.2


Check the working of the Beta version here:
https://drive.google.com/open?id=1QLNEj1_BdWv6T4Luf3qfk3ZZE8ooYXKp



..... still improving


