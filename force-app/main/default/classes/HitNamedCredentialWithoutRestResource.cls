public class HitNamedCredentialWithoutRestResource {
public static void hitNamedCredentialsWithoutRestResource() {
    // Standard REST API
    // Prepare data
    List<Map<String, String>> accounts = new List<Map<String, String>>();
    accounts.add(new Map<String, String>{'Name' => 'Sudhee Rupam 14', 'Phone' => '9949533091'});
    accounts.add(new Map<String, String>{'Name' => 'Sudhee Rupam 15', 'Phone' => '7842244091'});

    Http http = new Http();
    HttpRequest req = new HttpRequest();
    
    // Loop through accounts and insert one by one (Salesforce standard REST requires single record insert)
    for (Map<String, String> acc : accounts) {
        String requestBody = JSON.serialize(acc);
        req.setHeader('Content-Type', 'application/json');
        req.setMethod('POST');

        // Endpoint using Named Credentials and Standard REST API for Account
        req.setEndpoint('callout:SudhiSalesforce/services/data/v58.0/sobjects/Account/'); // v58.0 = API version
        req.setBody(requestBody);

        HttpResponse res = http.send(req);
        System.debug('Status Code: ' + res.getStatusCode());
        System.debug('Body: ' + res.getBody());
    }
}

}