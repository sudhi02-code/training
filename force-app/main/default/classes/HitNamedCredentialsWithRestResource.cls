public class HitNamedCredentialsWithRestResource {
 public static  void hitNamedCredentials(){
        List<Map<String,String>> accounts = new List<Map<String,String>>();
        accounts.add(new Map<String, String>{'name' => 'Sudhee Rupam 14', 'phone' => '9949533091'});
        accounts.add(new Map<String, String>{'name' => 'Sudhee Rupam 15', 'phone' => '7842244091'});
        
        String requestBody = JSON.serialize(accounts);
        HttpRequest req = new HttpRequest();
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');
        req.setEndpoint('callout:SudhiSalesforce/services/apexrest/AccountCRUD');
        req.setBody(requestBody);
        Http http2 = new Http();
        HttpResponse endRes = http2.send(req);
        
        System.debug('Status Code: ' + endRes.getStatusCode());
        System.debug('Body: ' + endRes.getBody());
//Target code
//@RestResource(urlMapping='/AccountCRUD')
/*
global with sharing class AccountCRUD {

    // Inner class to represent incoming JSON for account creation

    global class AccountRequest {

        public String name;

        public String phone;

    }

    // Inner class for response

    global class AccountResponse {

        public String status;

        public String accountId;

        public String error;

    }

    @HttpPost

    global static AccountResponse createAccounts() {

        RestRequest req = RestContext.request;

        RestResponse res = RestContext.response;

        AccountResponse resp = new AccountResponse();

        // Parse the request body JSON into a List<AccountRequest>

        List<AccountRequest> acctReqList;

        try {

            acctReqList = (List<AccountRequest>) JSON.deserialize(req.requestBody.toString(), List<AccountRequest>.class);

        } catch (Exception ex) {

            resp.status = 'error';

            resp.error = 'Invalid JSON: ' + ex.getMessage();

            res.statusCode = 400;

            return resp;

        }

        // Create and insert accounts

        List<Account> newAccounts = new List<Account>();

        for (AccountRequest acctReq : acctReqList) {

            if (acctReq.name == null || acctReq.name.trim().length() == 0) {

                resp.status = 'error';

                resp.error = 'Name is required';

                res.statusCode = 400;

                return resp;

            }

            Account newAcc = new Account();

            newAcc.Name = acctReq.name;

            newAcc.Phone = acctReq.phone;

            newAccounts.add(newAcc);

        }

        try {

            insert newAccounts;

            resp.status = 'success';

            res.statusCode = 201; // Created

        } catch (Exception ex) {

            resp.status = 'error';

            resp.error = 'Insert failed: ' + ex.getMessage();

            res.statusCode = 500;

        }

        return resp;

    }

}
 
        
    }*/
 }
}