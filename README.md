# MagicBBS
 Standard Bulletin Board System Construction By J2EE

Target / Requirement:

Build a bulletin board system, which supports the standard functions like:
Register (Support standard form validation)
Login (Support password verification)
Logout
Filter (The user would not permitted to write a post, check/manage account info or manage posts before they login)
Check all the posts / posts by 12 categories - (Support fuzzy query by title/author keywords)
Write posts
Manage your posts (delete/batch delete/revise/take a glance)
Account information management (check user information/modify user information)
Administrator management（have the authority to change/delete/revise posts from all ordinary users)

Develop Environment and Techniques

Front-end: JSP, CSS, JavaScript, jQuery, Bootstrap...
Back-end：Java EE (Jdk 1.8, Eclipse Jee Photon), Servlet, JDBC, DBUtils...
Database: Mysql 5.7.17
Server: Tomcat 7.0 + nat123(used for releasing websites to outside network)
Dependent Jar Library:
c3p0-0.9.5.2
commons-dbutils-1.6
commons-io-2.4
jQuery-1.11.1
jstl-1.1.2
junit-4.12
mchange-commons-java-0.2.11
mysql-connector-java-5.1.40
standard-1.1.2  

Basic Structure and Realization:
 
Structure: User Interface <—> Service <—> DAO <—> Database 

1. Register Realization:
Function 1: Check if the account has already existed in the database
    i. After clicking the “Register” button on navigation bar, the website would be redirected to register page with the cursor focused on “UserName” automatically. when the cursor is not focused on “Username” (onblur), the “checkAccount()” function would be triggered. 
    ii. Parameter - “UserName” would be sent to “userServlet” and trigger the “checkAccount(request, response)” function. The parameter would be sent to mysql to get the user object. If the object exist, return false to PrintWriter, else, return true. 

    iii. Based on the result, the register page would prompt warning information if neccessary
 
Function 2: Check if the account is null
When clicking the submit button, the function checkForm() would be trigger to check if the account is null

Function 3: Submit the form and create new user object
After the user pass the form validation (js) and clicking the submit button, the information inserted by user would be sent to “userServlet” and trigger register(request, response) function. In this function, the user information would be tranferred into mysql and create a new entry. And we will check the number of influnced entry, if this number is not equal to 1, an error massage would be sent to the register.jsp to ask user to register again.

2. Login Realization:
Function 4: Check if the account and password match with each other
i. After user clicking “login” button, three parameters: “account”, “pwd” and “md" would be sent to “userServlet”. “md” is used to trigger login(request, response) method. “account” and “pwd” parameters would be sent to mysql to check if they match with each other. If not, a parameter called “message” would be sent back to “login.jsp” to send a warning massage to user. If they match, the webpage would be redirected to “index.jsp” automatically. A parameter called “un”, which represents the current user’s username would be put into the “HttpSession” pool. So that after the user logged in, the filter will get this parameter to give the user the authority to write posts, manage posts or check / manage account info. As this “un” parameter is set in the HttpSession, we can always transfer this parameter to all servlets in 15 minutes before it expired. 
ii. Also, after logged in, the “login” button on the navigation bar would disappear as it is not essential right now. Instead, “Logout” and “My Account” buttons would appear on the navigation bar since the user get these authorities. 

3. Logout Realization:
Function 5: Log out
As the parameter “un” is still in HttpSession, after the user clicking the “logout” button on the navigation bar, “un” and “md” would be sent to “userServlet”. “md” is used to trigger logout(request, response) function. In this function, we simply remove this atrribute in the HttpSession and redirect to the “index.jsp”. 

4. Filter Realization:
Function 6: Limit visitors’ authority before they logged in
i. As we metioned before, if the visitor has already logged in, the parameter “un” which represents his/her username will be stay in the HttpSession. So first we try to get the parameter “un” in the HttpSession. If the “un” indeed exists, the filter would set it free and not block his/her operations (​chain.doFilter(request, response)) ​ If we cannot get any value from parameter “un”, a parameter called “postRefuse” which carrys the warning massage would be sent to login.jsp. The webpage would be redirected to “login.jsp” with warning massage to ask visitor to log in first.
ii. Filter would block all the servlet with the postfix “.do"

5. Check all the posts / posts by 12 categories Realization:
Function 7: Check all the posts
i. All the visitors, no matter they logged in or not, have the authority to check all the posts. So a new servlet with a different postfix was created in order to not be blocked by filter.
ii. After visitor clicking the button “All the posts”, a parameter called “m” would be sent to a servlet called “IndexSelect” to trigger allPost(request, response) method. In this method, a connection between mysql and servlet would be built and a query command would be executed to get all the information in the “post” form. A BeanListHandler would be created to generate a list of “Post” objects. 
iii. This list of “Post” obejcts would be sent to “allPost.jsp”. And JSTL/EL would be used to get the value of the parameters of each “Post” object. After traversing all the “Post” objects, these values could be shown on the website. 

Function 8: Check posts by 12 categories
i. A parameter of the “Post” obejct called “postType” is used for posts classification. 12 categories including general, programmer zone, gamer, delicacy, music, pets, books, movies, fashion, jokes, sports and friends are shown on the “index.jsp”. After the visitor clicking one of the categories, the name of this categories would be sent to “IndexSelect” servlet as a parameter called “category”, with “m” = “index” to trigger indexSelect(request, response) function. As the servlet got the category parameter, the parameter would be sent to the mysql to query the posts in this category. A BeanListHandler would be used to generate a list of “Post” object meet the condition. 
ii. This list of “Post” obejcts would be sent to “category.jsp”. And JSTL/EL would be used to get the value of the parameters of each “Post” object. After traversing all the “Post” objects in the list, these values could be shown on the website. 

Function 9: Fuzzy query by title/author keywords
i. Two text boxes are shown above the posts to enable users to do fuzzy query by title/author keywords. One is used to insert title keyword, the other is for author keywords. After the user clicking the “Query” button, the inputs and a parameter called “m” would be sent to “IndexSelect.jsp” to trigger “doSearch(request, response)” function. In this method, a connection between mysql and servlet would be built and a fuzzy query command would be executed to get all the confirming objects. A BeanListHandler would be used to generate a list of “Post” object meet the condition. 
ii. This list of “Post” obejcts would be sent to “category.jsp”. And JSTL/EL would be used to get the value of the parameters of each “Post” object. After traversing all the “Post” objects in the list, these values could be shown on the website. 

6. Write posts Realization:
Function 10: Write a post
i. After the user logged in, the filter would give the user the authority to visit “post.jsp”. The parameter “un” representing user’s username is also transmitted to “post.jsp”. jQuery would be used to get the value of the “un” and automatically set this value to “author”. So when a user is writing a post, he/she does not need to write their username as author again. It is automatically set.
ii. There are three inputs that need user to select/write - category, postTitle and postContent. After user clicking the “Post” button, these three parameter with “m” = add would be sent to “PostMag_Servlet” to trigger addPost(request,response) function. In this function, first it will determine if the id parameter is null or existed first. Because there is another function - “revise the post” would also trigger addPost(request,response)​ function with an additional parameter called “id” represents the id of this post stored in the mysql. If user want to add a new post, the id would definitely be null since this post haven’t been stored in mysql yet. So if the id is null, a insert command would be executed to store all the new post information into mysql.
iii. After that, a method in “PostMag_Servlet” called initSearch(request, response) would be executed to redirected to user's “manage your post” page which shown all the posts that this user has published.

7. Manage your posts Realization: (delete/batch delete/revise/take a glance)
Function 12: Show all your post/Administrator management
i. After user logged in, “un” will stay in the HttpSession for 15min. So when user click “manage your posts” on the navigation bar, “un” and “m” = “init” would be sent to “PostMag_Servlet” to trigger the initSearch(request,response) method. In this method, as the “un” is got, first the function would determine if “un” = “admin” since “admin” means administrator, who has the highest authority. If the “un” = “admin”, then show all the posts in mysql on this page so that the administrator can opreate all the posts by execute the query command "select * from post". if the “un” != “admin”, then only show the posts which were published by this user by execute the query command "select * from post where postAuthor = '"+user+”’”​ “.  A BeanListHandler would be created to generate a list of “Post” objects.
ii. Then the list would be sent to “postMag.jsp”, JSTL/EL would be used to get the value of the parameters of each “Post” object. After traversing all the “Post” objects in the list, these values could be shown on the website. 

Function 13: Delete your post (one at one time)
i. There is a “Delete” button behind each post that user has already published which is used to delete the corresponding post. When user clicking the delete button, the “un” and “id” parameter would be sent to “PostDelete” servlet. As in the “postMag.jsp”, the posts values has already got from mysql to show them on the webpage, for each delete button, there is a post coresspond to it. So the specific post’s id information can be got and sent to “PostDelete” servlet. The servlet would connect to mysql and a delete command would be executed to delete this entry in the mysql. 
ii. After deleting the post, “un” is used to redirected to this user’s “manage your posts” page. 
iii. A function called “deleteWarning()” in “postMag.jsp” is used to send warning massage when user want to delete post. The user can click “yes” to confirm the operation and “no” to cancel the operation.

Function 14: Batch delete your post 
i. There is a batch of checkbox behind the posts for user to select mutiple posts. A parameter called “pId” is used to record the ids of the posts that users seleted. A function called “getCheckboxVal()” which used JSTL/EL to assign the value to “pId”.
ii. After the user clicking “Batch delete” button, a function called “deleteWarning()” in “postMag.jsp” is used to send warning massage when user want to delete post. The user can click “yes” to confirm the operation and “no” to cancel the operation. After user confirm the operation, the parameter “pId” and “m” = “batchDelete” would be sent to “PostMag_Servlet” to trigger batchDelete(request,response) function. The servlet would connect to mysql and a delete command would be executed to delete the confirming entry set in the mysql. 
iii. After deleting the post, “un” is used to redirected to this user’s “manage your posts” page. 

Function 15: Revise your post
i. Same as “function 10: write a post”. The difference is that, when user clicking revise button, the website would redirect to “PostMag_Servlet” with the “m” = “edit” and the id of the post to trigger the method “editPost(request, response)”  In this method, the mysql is connected and a query command would be executed to find the exact post by “id”. After find this post, a “Post” object would be  created by BeanHandler and sent to “post.jsp”.
ii. Now, “post.jsp” has the original values of “category”, “postTitle” and “postContent”. So that user can modify the content based on the original one.
iii. After clicking post button, “id”, “category”, “postTitle”, “postContent”, and “m” = “add” would be sent to “PostMag_Servlet” to trigger addPost(request,response) method.
As mentioned before, “revise the post” method would also trigger addPost(request,response)​ function with an additional parameter called “id” represents the id of this post stored in the mysql. At this time, the id is not null, so a update command would be executed to update the information in the mysql.
iv. After that, a method in “PostMag_Servlet” called initSearch(request, response) would be executed to redirected to user's “manage your post” page which shown all the posts that this user has published.

Function 16: Take a glance
As on the “postMag.jsp” page, it have already got each post’s information (category, postTitle, postContent, author, publishTime), but shown in a concise way. After clicking the revise button, the information of this post with specific id would be sent to “checkPost.jsp” to show the information in a more comprehensive way. 

8. Account information management Realization:
Function 17: Check user information
After user logged in, the “un” which represents username would stay in the HttpSession for 15min. So after the user clicking “My Account” button on the navigation bar, the parameter “un” and “md” = “myAccount” would be sent to “UserServlet” to trigger the function myAccount(request, response). In this function, the mysql would be connected and a query command would be executed to find the specific entry based on username. Then a “Users” object would be created by the entry information and a BeanHandler. This object would be then transmitted to “myAccount.jsp”. JSTL/EL would be used to get the value of the parameters of this User. So that these values could be shown on the website. 

Function 18: Change user information
i. After user logged in, the “un” which represents username would stay in the HttpSession for 15min. So after the user clicking “Change Personal Info” button on the “myAccount.jsp", the parameter “un” and “md” = “changeInfo” would be sent to “UserServlet” to trigger the function changeInfo(request, response). In this function, the mysql would be connected and a query command would be executed to find the specific entry based on username. Then a “Users” object would be created by the entry information and a BeanHandler. This object would be then transmitted to “changeInfo.jsp”. 
ii. “changeInfo.jsp” looks the same as the “register.jsp” on the webpage but with the original values of the user in each corresponding input box. After user inserted new information and clicking the “change” button, the parameters like “account”, “nickName”, “pwd” … and “md” = “changed” would be sent to “UserServlet” to trigger changed(request, response) function. In this function, all these parameters would be sent to mysql to execuate an update command to update the user information in the database. 
iii. After that, the function myAccount(request, response) in the “UserServlet” would be trigger again in order to show changed information to user.

Final Result: (Check Here!)
http://MagicBBS.nat123.cc
