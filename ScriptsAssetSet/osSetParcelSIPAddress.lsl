/*
osSetParcelSIPAddress(string SIPAddress)
    In the state_entry() event, a message is displayed indicating to touch the object to see how osSetParcelSIPAddress works.
    In the touch_start event, the script displays the SIP address being set to the parcel.
    It then calls the osSetParcelSIPAddress function with the specified SIP address to set it for the parcel. This SIP address is typically used for communication protocols like VoIP (Voice over Internet Protocol).
*/

//
// osSetParcelSIPAddress Script Example
//

string sSIPAddress = "ip.address.of.freeswitch.server:5060"; // The SIP address we are setting

default
{
    state_entry()
    {
        // Display a message indicating to touch the object to see how osSetParcelSIPAddress works
        llSay(0, "Touch to see how osSetParcelSIPAddress works");
    }

    touch_start(integer num)
    {
        // Display the SIP address being set to the parcel
        llSay(0, "SIP Address being set: " + sSIPAddress);
        
        // Set the SIP address for the parcel using osSetParcelSIPAddress
        osSetParcelSIPAddress(sSIPAddress);
    }
}
