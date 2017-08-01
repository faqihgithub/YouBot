
************************************************************************

How to get your Whatsapp Chat?

1. Goto the chat/group on WhatsApp
2. Click on the tree dots on top right corner ie the options button
3. Click on More
4. Click on Email chat
5. Select Without Media
6. Enter your Email Id. Let this be one of those rare occasions where you send an email to yourself.
7. Download the chat text file and save it in the folder WhatsAppChat

Note: Incase you have also shared vcards on this chat, they by default will also get attached in the email. You can click on the cross before sending the email. We don't need them.

************************************************************************

How to Clean the Chat?

1. Run the R code in this directory.
2. Change the required directories. (I am leaving them empty)
3. Replace 'member1', 'member2'... with your group member's names.
4. Goto the typo section and make the necessary changes of pattern and replacements.

************************************************************************

How to convert the file to utf8?
(For Windows Users only)

1. Open Windows PowerShell. 
2. Using the cd command, change the directory where the 'mycorpus.txt' file is there. (It will be in the same folder as the R code)
3. Use the following command to convert it now -

	gc -en string in.txt | Out-File -en utf8 out.txt

In our case, 'in.txt' file is 'mycorpus.txt' and 'out.txt' is the name of the output file (Feel free to be as creative with the name as possible. Haha!)

Note: We need to convert the txt file in utf8 format because the markov text generator takes input in that format.

************************************************************************

Now you are ready for training a bot that talks like you or one of your friends or even better talks like all of you combined.
Open Markov Text Generator folder and follow the other set of README instructions.

************************************************************************

Thank you codebox for the inspiration/code.
https://github.com/codebox
