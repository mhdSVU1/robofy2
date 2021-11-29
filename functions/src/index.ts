import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
admin.initializeApp(functions.config().firebase);

exports.sendHelloNotification = functions.region("europe-central2")

.https.onCall((data:any, context:any) => {
    const payload = {
        notification: {
        title: "Hello for all users!",
        body: "body data", 
        
        //Or you can set a server value here.
        },
        //If you want to send additional data with the message,
        //which you dont want to show in the notification itself.
        data: {
            
        }
        };

    admin.messaging().sendToTopic("all_users", payload)
    .then((value:any) => {
    console.info("function: sendHelloNotification executed succesfully");
    return { msg: "function sendHelloNotification executed succesfully" };
    })
    .catch((error:any) => {
    console.info("error in sendHelloNotification execution");
    console.log(error);
    return { msg: "error in sendHelloNotification execution" };
    });
    });
