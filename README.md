
Task manager application which uses Flutter and Node.js.<br><br>
**If interested, you should check the notes below the images**

![all_tasks](https://user-images.githubusercontent.com/34074484/127744892-8482ef38-d876-47dc-b5d1-5e9784aba0e1.png)
![completed_tasks](https://user-images.githubusercontent.com/34074484/127744893-fbe3edfb-a379-41d8-b648-a7b94ca14b12.png)
![add_new_task](https://user-images.githubusercontent.com/34074484/127744888-60400a18-5d99-43a0-8605-df2e489ecb1b.png)
![update_the_task](https://user-images.githubusercontent.com/34074484/127744894-0104ef47-55ef-4c50-ba0b-007d74b22bda.png) <br><br>

Back-end: <br>
  - Express.js, Mongoose, Joi

Front-end:
   - get, get_it, vexana

Flavor environment set up. To use flavors: <br><br>
   **cd android/app/build.gradle**, 
      - uncomment lines between 52-64.<br><br>
   **cd android/app/src/main/AndroidManifest.xml**,
      - change line 4 to android:label="@string/app_name"<br><br> then you can use flutter run --flavor dev or flutter run --flavor prod

 To set up development environments:
 **Download** : <br><br>
 MongoDb :  https://www.mongodb.com/try/download/community<br>
 Node.js : https://nodejs.org/en/<br>
 Flutter : https://flutter.dev/docs/get-started/install
      
 **To run the project** : <br>
 
 git clone https://github.com/kadirbekar/flutter-task-manager.git<br>
 cd flutter-task-manager<br>
 cd back_end<br>
 npm i - to install node modules
 nodemon start<br> - to start server
      
Sources : 

https://medium.com/flutter-t%C3%BCrkiye/flutterda-flavor-kullan%C4%B1m%C4%B1-be108bbd3e38<br>
https://mongoosejs.com/<br>
https://pub.dev/packages/vexana<br>
https://pub.dev/packages/get





