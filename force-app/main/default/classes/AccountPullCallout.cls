public class AccountPullCallout {
    public static void sendAccount(list<Account> accountJson){
        String requestBody =Json.serialize(accountJson);        
       String targetEndPoint ='callout:Salesforcenamed/services/apexrest/AcountInt';
        Http h = new Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(targetEndPoint);
        req.setMethod('POST');
        req.setHeader('Authorization','Bearer'+UserInfo.getSessionId());
        req.setHeader('Content-Type','application/json');
        System.debug('Accountsjson'+requestBody);
        req.setBody(requestBody);
        HttpResponse res = h.send(req);
        if(res.getStatusCode()!=200){
            System.debug('Error sending accounts:'+res.getBody());
        }
        else{
            System.debug('accounts sent successfully'+res.getbody());
        }
        }
    }