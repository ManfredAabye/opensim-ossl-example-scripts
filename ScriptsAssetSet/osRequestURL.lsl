/*
osRequestURL(list options)
    The script defines a function RequestReceived that takes two parameters: id, a key representing the HTTP request ID, and query, a string representing the query or body of the request. Inside this function:
        It responds to the HTTP request with a status code 200 and the original query appended with " OK" using llHTTPResponse.
        It unescapes the URL-encoded query string using llUnescapeURL.
        It then says the unescaped query string in chat using llSay.

    In the default state's state_entry event handler:
        It requests a URL, enabling cross-site scripting (XSS) support, using osRequestURL.

    The http_request event handler is triggered when an HTTP request is received. It takes three parameters: id (the request ID), method (the HTTP method used, e.g., GET, POST), and body (the body of the request for POST requests).
        If the method is URL_REQUEST_GRANTED, it informs the owner that the URL request has been granted.
        If the method is URL_REQUEST_DENIED, it informs the owner that the URL request has been denied.
        If the method is "GET", it calls RequestReceived with the request ID id and retrieves the query string from the HTTP header using llGetHTTPHeader.
        If the method is "POST", it calls RequestReceived with the request ID id and the body of the request.

Overall, this script handles HTTP requests and responses, allowing communication between an external source (e.g., a web server) and the OpenSim environment. It includes support for both GET and POST methods and handles URL requests being granted or denied. The RequestReceived function processes the received requests and responds accordingly.
*/

//
//osRequestURL example
//
 
RequestReceived(key id, string query) {
    llHTTPResponse(id, 200, query + " OK");
    query = llUnescapeURL(query);
    llSay(0, query);
}

default {
    state_entry() {
        osRequestURL(["allowXss"]);
    }

    http_request(key id, string method, string body) {
        if (method == URL_REQUEST_GRANTED)
            llOwnerSay("URL_REQUEST_GRANTED" + "\n" + body);

        if (method == URL_REQUEST_DENIED)
            llOwnerSay("URL_REQUEST_DENIED");

        if (method == "GET")
            RequestReceived(id, llGetHTTPHeader(id, "x-query-string"));

        if (method == "POST")
            RequestReceived(id, body);
    }
}
