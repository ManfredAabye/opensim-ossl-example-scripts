/*
osSetContentType(key id, string type)
This script handles HTTP requests and responses. When the script starts, it requests a URL and stores the request ID. When an HTTP request is received, it checks if the request ID matches the stored URL request ID. 
If they match, it processes the request based on the method (whether the URL request was granted or denied). If they don't match, it responds with the HTML body or "OK" text, depending on whether the owner is in the simulator.
*/

//
// osSetContentType Script Example
//

// OpenSim Script Language: default
default
{
    // Declare a key variable to store the URL request ID
    key url_request;
    
    // Define an HTML body string
    string HTML_BODY = 
    "<!DOCTYPE html>\n"
    "<html>\n"
    "<body>\n"
    "\n"
    "<h1>My First Heading</h1>\n"
    "\n"
    "<p>My first paragraph.</p>\n"
    "\n"
    "</body>\n"
    "</html>";

    // This function is called when the script starts or resets
    state_entry()
    {
        // Request a URL and store the request ID in the 'url_request' variable
        url_request = llRequestURL();
    }

    // This function is called when an HTTP request is received
    http_request(key id, string method, string body)
    {
        // Get the owner's key and size
        key owner = llGetOwner();
        vector ownerSize = llGetAgentSize(owner);

        // Check if the received request ID matches the stored URL request ID
        if (url_request == id)
        {
            // Reset the stored URL request ID
            url_request = "";

            // Check the method of the request
            if (method == URL_REQUEST_GRANTED)
            {
                // Say the received URL in local chat
                llOwnerSay("URL: " + body);

                // Check if the owner is in the simulator
                if (ownerSize != ZERO_VECTOR)
                {
                    // Load the received URL for the owner
                    llLoadURL(owner, "I got a new URL!", body);
                }
            }
            else if (method == URL_REQUEST_DENIED)
            {
                // Say that something went wrong and no URL was received
                llOwnerSay("Something went wrong, no URL:\n" + body);
            }
        }
        else
        {
            // Say the request body in local chat
            llOwnerSay("Request body:\n" + body);

            // Check if the owner is in the simulator
            if (ownerSize != ZERO_VECTOR)
            {
                // Set the content type based on the request
                osSetContentType(id, CONTENT_TYPE_HTML);

                // Respond with the HTML body
                llHTTPResponse(id, 200, HTML_BODY);
            }
            else
            {
                // Set the content type as text
                osSetContentType(id, CONTENT_TYPE_TEXT);

                // Respond with "OK"
                llHTTPResponse(id, 200, "OK");
            }
        }
    }
}
