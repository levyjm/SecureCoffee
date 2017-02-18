# SecureCoffee

![alt text](http://i.imgur.com/ZuR7vOq.png?1)

This menu bar app is for those who, like me, are paranoid leaving their laptops alone in coffee shops. I figured that there are three (Thanks for the idea, Paul!) important indicators of theft to watch out for: 1) your macbook has been unplugged and 2) your macbook has been forcibly put to sleep or 3) your macbook is moving. This application will alert you if either of those three things occur. You simply have to enter in a phone number (where the text alerts will be sent) and select the 'Active' menubar item. When you are ready to receive alerts, simply press 'Lock Machine' and your machine will lock and the application will start auditing the system for those critical indicators. 

## Important:
* You should have **Text Forwarding** enabled as this will use SMS to push messages to your own number.
  * I am not yet quite sure how to send an iMessage to yourself, and not sure if it is even possible.
  
  
### Other Licensing
This project also uses the the [SMSLib Objective-C libary](https://github.com/bitcartel/SMSLib), which is used to monitor the Sudden Motion Sensors and watch for changes. The specific files used and the corresponding license details can be found in my SMSLib directory.
