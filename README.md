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

  1. On-Device using TensorFlow Lite: After multiple attempts the model has been successfully converted into TFLite Format, here's the script along with the results. (WORKS WITHOUT INTERNET)
  Script for converting the Model to TFLite :
    https://colab.research.google.com/drive/1BXHwQAxLqmjlEob4uw1fLCYFDEHuXVwg?usp=sharing
    
    [ NOTE: The prediction time on the TFLite Model is slower as compared to the API. ]

  2. Using a REST API: The scanned/typed text is sent to an API hosted on Heroku. The detailed implementation is shown in the following repository. (NEED INTERNET)
  Creating an API for the ML Model using Flask + Heroku:
    https://github.com/TravellerOnCode/Deploy-Deep-Learning-Model-to-Flask-TensorFlow-2.2


Further work:
  1. Currently the TFLite Model size is ~35Mb, need to decrease the size.
  2. Shorten the time required for prediction.
  3. Improve the UI of the Application

Check the working of the Beta version here:
https://drive.google.com/open?id=13mSx12jvngfj-tTqulQc_r5BwJi8g6hy


..... still improving


