/*
integer osIsUUID(string thing)
    The state_entry event is triggered when the script starts.
    It defines two strings: good_key, which contains a valid UUID, and bad_key, which contains an invalid UUID.
    The osIsUUID function is used to check whether each string represents a valid UUID.
    The result of the osIsUUID function for each string is converted to a string using (string) and then outputted using llOwnerSay.

The output will be "1" if the string represents a valid UUID and "0" if it does not. Therefore, the script will output "1" for good_key (indicating it's a valid UUID) and "0" for bad_key (indicating it's not a valid UUID).
*/

// Example of osIsUUID

// Default event handler
default
{
    state_entry()
    {
        // Define two strings, one with a valid UUID and the other with an invalid UUID
        string good_key = "09090909-1111-2222-3213-874598734592";
        string bad_key =  "8e9a6ed1-e2f4-4735-8132-e027bbcd27g1";
        
        // Check if the first string represents a valid UUID and output the result
        llOwnerSay((string)osIsUUID(good_key));
        
        // Check if the second string represents a valid UUID and output the result
        llOwnerSay((string)osIsUUID(bad_key));
    }
}
