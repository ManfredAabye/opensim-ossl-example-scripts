/*
This script encrypts the plain text using the provided secret key and initialization vector (IV), 
and then displays the encrypted text in the chat. 
You can replace "Hello, World!" with the actual plain text you want to encrypt, 
and "MyIVString" with the actual IV string you want to use. 
As before, note that the secret key and IV are hardcoded in the script 
for demonstration purposes and should be securely stored in a real scenario.
*/
string Secret = "MySecretKey";
 
// Plain text to be encrypted
string plainText = "Hello, World!";
 
// Initialization Vector (IV)
string ivString = "MyIVString";
 
// Event handler for script start
default
{
    state_entry()
    {
        // Encrypt the plain text
        string encryptedText = osAESEncryptTo(Secret, plainText, ivString);
 
        // Display the encrypted text
        llOwnerSay("Encrypted Text: " + encryptedText);
    }
}