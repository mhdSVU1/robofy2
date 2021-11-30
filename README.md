
# Robofy Assignment 

This is a Flutter app that provides the following functions:
- User can signup/signin using email ID and phone number
- A user can edit his/her profile page, such as saving name, phone.
- A user can send “Hello” notifications to all users who has this app running. 


## How Test the App

To test this app, open the project using Android Studio or VS Code.
Then run the project on an Android device.


## 1. Testing of user authentication: Signing up/in using email ID and phone number (which is used here as a password).
- Sign up/in using email ID and phone number (which is used here as a password).
- On the Home page, press the floating button, then in the drawer menu press "Edit My Profile".
- On" "Sign Up" page user is expected to enter a username, email, and phone number.
- In" "Sign in" page user is expected to enter email, and phone number 
(obviously, those must be already gained after a successful signing up operation).

- Click the "Sign In" or "Sign Up" button accordingly.
- If the signing up/in task succeeded, the user will be directed to the home page.

  Alternatively, if the auth task failed for some reason a snakbar message appears with the corresponding error message.



## 2. Testing of editing user profile data, where user can save the name, phone.
- Sign up/in using email ID and phone number (which used here as a password).
- On the Home page, press the floating button, then in the drawer menu press "Edit My Profile".
- In the "Edit My Profile" page the current username and phone number are displayed where you can edit one or both of them.
- Click the "Save" button.
- A snack bar message will appear giving the corresponding feedback of the editing operation:
  if the edit task succeeded it shows a snack bar message that says:
"Successful", "Your account information has been updated!".

  Alternatively, if the edit task failed for some reason another snack bar message appears with the corresponding error message.

## 3. Testing of sending “Hello” notifications to all user who has this app running:

For sending a "Hello Notification" you need to follow the following steps:
- Install the app on two separated Android devices.
- Sign up on both of them using two different accounts, using email ID and phone number (which is used here as a password)
- In one of these two devices go to the drawer menu and press the "Send Hello Notifications" action.
- A new page will appear, click on "Send Hello Notification" button in the center of dispalyed page.
- A "hello" notification will be received on the other device.





## Tech Stack

**Client:** Dart, Flutter 

**Server:** Firebase Auth,Firebase Cloud Functions(Node.js),Firebase Firestore Database


## Installation

You can install this Flutter app on an Android device from this direct link:
https://drive.google.com/file/d/1r4naDXFYRA2ipLqHBVl7c94_MSSUN1Ox/view?usp=sharing


    
## Demo

https://drive.google.com/file/d/1LI6nCAO_cLGeRhpd2rJ0q_xlPLmHe4eK/view?usp=sharing


## Features


- Simple and User-friendly UIs
- Cloud backend
- Cross platform

