/*
You can use this script in an object in your OpenSimulator region, 
touch it to execute, and it will display the encrypted and decrypted text in the chat. 
Note that the secret key is hardcoded in the script for demonstration purposes. 
In a real scenario, 
it should be securely stored and retrieved using more secure methods such as an external database.
*/
 
string Secret = "MySecretKey";
 
// Plain text to be encrypted
string plainText = "Hello, World!";
 
// Event handler for script start
default
{
    state_entry()
    {
        // Encrypt the plain text
        string encryptedText = osAESEncrypt(Secret, plainText);
 
        // Display the encrypted text
        llOwnerSay("Encrypted Text: " + encryptedText);
 
        // Decrypt the encrypted text
        string decryptedText = osAESDecrypt(Secret, encryptedText);
 
        // Display the decrypted text
        llOwnerSay("Decrypted Text: " + decryptedText);
    }
}