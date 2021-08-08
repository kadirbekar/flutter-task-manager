
Task manager application which uses Flutter and Node.js.<br><br>
**If interested, you should check the notes below the images**

![all_tasks](https://user-images.githubusercontent.com/34074484/128631599-75035489-5873-4cd7-b4e5-f627c7c7b8e3.png)
![completed_tasks](https://user-images.githubusercontent.com/34074484/128631600-04692840-6aa2-45d9-b91c-e6cd4bf4654a.png)<br>
![add_new_task](https://user-images.githubusercontent.com/34074484/128631596-4ff1ee9c-b2bd-4668-a769-d94b744244c5.png)
![update_task](https://user-images.githubusercontent.com/34074484/128631602-78c34fe0-bb94-4d57-9d65-a27dce8f3f21.png)<br>

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
 npm i<br>
 nodemon start<br>
      
Sources : 

https://medium.com/flutter-t%C3%BCrkiye/flutterda-flavor-kullan%C4%B1m%C4%B1-be108bbd3e38<br>
https://mongoosejs.com/<br>
https://pub.dev/packages/vexana<br>
https://pub.dev/packages/get





