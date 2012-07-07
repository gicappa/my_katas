

The user goes to their "update email address page" (request #1)
	They enter a new email address and hit submit (request #2)
	We record that they are in the process of changing their address, somehow (action #1)
	We send a confirmation email to the new address (action #2)
	We tell them to check their email (response to request #2)

The user clicks on the link in their confirmation email (request #3)
	We finalize their address change (action #3)
	We respond to the request by telling them their change has been accepted
	
	
"update user email"
	give a user and a new email input
	the application retrieve the user 
	the application saves the email in a temporary record
	the application sends out a confirmation email to the new address
	the application answer success
	
"confirm user's email should be changed"
	the user input the confirmation token
	the application matches the token with the user	
	if they matches the application will be changed permanently
	the application answer success
	
I should have 
	a UpdateUserEmail object 
	a ConfirmEmailChanged object 
	a User object
	a Mailer object
	a UserRepository object

