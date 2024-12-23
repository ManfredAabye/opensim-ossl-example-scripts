/*
This script decrypts the encrypted text using the provided secret key and initialization vector (IV), 
and then displays the decrypted text in the chat. 
You can replace "EncryptedTextHere" with the actual encrypted text you want to decrypt, 
and "MyIVString" with the actual IV string you want to use. 
As before, note that the secret key and IV are hardcoded in the script for demonstration purposes 
and should be securely stored in a real scenario.
*/

// Secret key
string Secret = "MySecretKey";

// Encrypted text to be decrypted
string encryptedText = "8012BDD1AA6B988CD125570B3C98DE05:49d75c2a039cb01b55a3e5aa45e134dd"; // Hello, World!

// Initialization Vector (IV)
string ivString = "MyIVString";

// Event handler for script start
default
{
    state_entry()
    {
        // Decrypt the encrypted text
        string decryptedText = osAESDecryptFrom(Secret, encryptedText, ivString);
        
        // Display the decrypted text
        llOwnerSay("Decrypted Text: " + decryptedText);
    }
}
