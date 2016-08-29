# collborative-editing
Real time collaborative document editing for office documents. Check the demo at http://www.breadsoftware.com/

Bread Docs is an online collaborative word editor that allows several users to work on the same document in real time. Users work is saved back to server and more than one person can edit the same document at the same time. Everybody's changes are instantly reflected on all screens. Users can be logged in from any device and can be anywhere in the world.

No more sending documents back and forth via email, Bread is a real time collaborative editor in browser.

A great Google docs alternative, Bread Docs offers you the flexibility to install the in-house platform on your own servers and offer all the functionality to your end users. You can install the product on a Windows or Linux machine and there are no additional requirements. Documents never leave your data center or organisation and you can install the platform behind a firewall, on an applications server and behind a SSL web server.

Bread offers true collaborative editing and comes built on an intelligent operational transform-based merging and conflict resolution system. Bread allows users to collaborate with other users quickly and all the users can see the changes in real time. The cursors across the users are synchronized and users can see the changes as other users are typing them. A built-in conflict resolution system takes care of intelligently merging the changes and ensures all user changes are added to the document. Users changes are highlighted in different selected colors and built-in chat allows real time interaction with others.

To get started -
1) Install Bread software
2) Check that BreadDocs is running successfully by going to http://localhost:<breaddocsport>

Bread can be run with or without Session Management. It is recommended to run Session Management in production mode. 
Note- By default Bread is installed with Sessons turned off. You can check the settings – requireSession in Configuration Manager for Bread Docs & Bread Sheets.
These samples in this repository are for Non Session usecase.


To get started, there are 2 files included in the installation - embeddocs.html and embedsheets.html, located at C:\Program Files\Bread\Samples\GettingStarted or /usr/local/Bread/Samples/GettingStarted

Bread internally uses Node as a web server. It is not recommended to put Node in front as production webserver. Hence you should always run Bread on your server behind a firewall and behind your production webserver. 

Deploy embeddocs.html and embedsheets.html into a webserver such as IIS, Apache etc. The webserver for this example, should be on same machine where Bread is installed.

Now simply browse your website url and you should see the Bread editor show up. 
Your website url can be http://localhost:yourport/embeddocs.html and http://localhost:yourport/embedsheets.html
Note- The username in this example is hardcoded as John and also this sample is running in basic non session mode, which means no security is enabled.

