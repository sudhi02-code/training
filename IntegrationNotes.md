A request header is a part of an HTTP request that provides extra information about the request or the client to the server.

It’s like the "metadata" of a request — it tells the server how to process the request, who is making it, what format the data is in, etc.

why rest api is a stateless?
Stateless means that each API request is independent —
the server does not remember anything about previous requests made by the same client.

Each request from the client must contain all the information needed for the server to understand and process it.

number    |   Error            |message

100        	Continue	                  Request received, continue with next step
101	     Switching Protocols	        Server switching to a different protocol
102	       Processing                 	Request is still being processed


400	Bad Request	Invalid syntax, missing field, or bad data
401	Unauthorized	Invalid credentials or token expired
403	Forbidden	You don’t have permission to access this resource
404	Not Found	Endpoint URL or resource not found
405	Method Not Allowed	Using wrong HTTP method (GET instead of POST, etc.)
406	Not Acceptable	Server can’t return response in requested format
408	Request Timeout	Server took too long to receive the request
409	Conflict	Duplicate or conflicting data (e.g., same record)
410	Gone	Resource was deleted or removed permanently
415	Unsupported Media Type	Missing or wrong Content-Type header
422	Unprocessable Entity	Request well-formed but invalid data




@RestResource(urlMapping ='/accountmgmt/')
global  class AccountMgmt {
@httpGet
    global static List<Account> getTOPAccounts(){
        List<Account> accList =[select id,industry,rating,Annualrevenue from Account where Annualrevenue!=null order by Annualrevenue limit 10];
        return accList;
    }
}
