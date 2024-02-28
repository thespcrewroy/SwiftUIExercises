Homework 8: Lists (AKA tableviews) with SwiftUI
===============================================

Lists are the Swiftui equivalent of Uikit's tableviews. This lesson focuses on how to build the simplest possible list that includes text and images, and leads to a new view with additional information when a row is clicked.

1.  Create a new swiftui project named candidates.
2.  Click on ContentView.swift and activate Live Preview. You should see "Hello World" appear.
3.  Download [this list of presidential candidates](http://nmi.cool/appdev/wp-content/uploads/sites/10/2022/08/candidates.zip) from the 2016 election, unzip the file, and open the candidates folder that appears.
4.  Open the pix folder so that you can see the images.
5.  Return to Xcode and drag all of the images from the pix folder into assets.xcassets.
6.  Return to ContentView.swift.
7.  Open candidates.js and copy the candidateNames, candidatePix, and candidateInfo arrays. Paste the arrays into ContentView, just underneath struct ContentView : View { .
8.  Command click on the text field and select embed in list as shown below.\
    (BTW, at first attempt I couldn't get the Embed in List option to appear. Once I opened canvas it showed up for some reason)

    ![](https://tylermazurek.com/appdev/wp-content/uploads/2019/10/img_5d9ddf83bf0f9.png)

9.  If you are successful, your code should look like this:

    ![](https://tylermazurek.com/appdev/wp-content/uploads/2019/10/img_5d9de05e04a5d.png)\
    and Hello World should appear 5 times in a tableview. Take note of "item in" on the first line of the list. Soon we will use "item" to pull and display sequential data from those three arrays.

10. Set the length of your list to the number of items in an arraty. Your next job is to replace the 5 in List(0 ..<5) with List(0 ..< candidateNames.count). Now you should see many more Hello World statements in the preview.  List(0 ..< candidateNames.count). creates the list and sets its length based on the count of the candidateNames array.
11. Change Text("Hello World") to Text(candidateNames[item]) .\
    Item in Text(candidateNames[item]) targets the array of candidate names that provides content to the list. As you are about to see, item in can be applied to multiple arrays at once. 
12. Click preview to test your work. If a table full of names appear, congratulations!  Now click on the![](https://tylermazurek.com/appdev/wp-content/uploads/2019/06/img_5d151ec4a701c.png) button to activate scrolling. Pretty soon, you should be able to scroll through all of those long forgotten names from the chaotic 2016 presidential campaign.
13. Command click on Text and embed in Hstack.
14. Add the images from candidatePix to the list as shown below. At this point the candidate pictures should appear beside their name

    ![](http://nmi.cool/appdev/wp-content/uploads/sites/10/2023/02/ad-1024x266.jpg)

15. Congratulations. You just created a tableView with images. Now click on Text next to (self.candidateNames[item]) and use the Attributes inspector to choose the Large Title font (or just type it in).
16. Add a spacer ( Spacer() ) between the text and image items to make everything line up better.

    ![](http://nmi.cool/appdev/wp-content/uploads/sites/10/2023/02/bb-300x91.jpg)

### Add Navigation

Now that we have created a simple listview, the next step is to make those table cells clickable and generate new data when someone clicks them.  The first step is to embed our list in a navigation view.

1.  The navigation view begins just before the list as shown here. Unless you know a trick that I don't (please tell me if you do :), you will have to type this one in.

    ![](https://tylermazurek.com/appdev/wp-content/uploads/2019/10/img_5da383435e88e.png)and, of course, requires a closing bracket just after the bracket that ends the list itself.

2.  Now that you have added a navigation view, you should see a space above the list of candidates in the canvas preview pane. That space exists for you to give your navigation a title, so let's give it one. Add the navigation bar title shown below just after the bracket that ends the list and before the bracket that ends the navigation view. Name it anything that you want!

    ![](https://tylermazurek.com/appdev/wp-content/uploads/2019/10/img_5da38493ae362.png)\
    Now you should see your title.

3.  The next step is to add a NavigationLink as shown below. In this case our destination is simply a text field which will appear as a separate view once the button is clicked.  Be sure and add a closing bracket in the right location (figure it out 🙂 ).  You may also need to restart the preview.\
    ![](http://nmi.cool/appdev/wp-content/uploads/sites/10/2023/02/cc-1024x590.jpg)
4.  Get it to work? Great, now modify things to include a large title font when you click on one of those names.
5.  Embed the text field inside of NavigationLink in a VStack and add
    1.  an image field and
    2.  an additional text field that displays information about each candidate from the candidateInfo array. You may need to add additional lines using .lineLimit in order to display all of the information.
    3.  Once you get everything working, make sure the text is formatted nicely.
    4.  GIVE THIS ONE A GOOD SOLID TRY ON YOUR OWN.
    5.  If you get stuck, [here's yet another screen capture that shows my work. ](http://nmi.cool/appdev/wp-content/uploads/sites/10/2023/02/whole-1024x918.jpg)
