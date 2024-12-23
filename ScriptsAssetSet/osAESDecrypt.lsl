/*
This script decrypts the encrypted text using the provided secret key and displays the decrypted text in the chat. 
You can replace "EncryptedTextHere" with the actual encrypted text you want to decrypt. 
As before, note that the secret key is hardcoded in the script for demonstration purposes and should be securely stored in a real scenario.
*/

string Secret = "MySecretKey";

// Encrypted text to be decrypted
string encryptedText = "19655484356E7241D4FED3E3446932D8:fe43377edfeecb104dea2059c1d68724"; // Hello, World!

// Event handler for script start
default
{
    state_entry()
    {
        // Decrypt the encrypted text
        string decryptedText = osAESDecrypt(Secret, encryptedText);
        
        // Display the decrypted text
        llOwnerSay("Decrypted Text: " + decryptedText);
    }
}