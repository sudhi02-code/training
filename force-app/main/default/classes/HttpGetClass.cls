public with sharing class HttpGetClass {  
    public void getHttp(){
    Http h= new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('http://universities.hipolabs.com/search?country=United+States');
request.setMethod('GET');
HttpResponse response = h.send(request);
if(response.getStatusCode()==200){
    //System.debug('Response Body:'+response.getBody());
    List<Map<String,Object>> res = (List<Map<String,Object>>) JSON.deserializeUntyped();
    System.debug(res);
   
}


else{
    System.debug('calloutfailed:'+response.getStatus());
}
    }



























    /*public void postHttp(){
        Http h= new Http();
        Httprequest request = new HttpRequest();
        request.setEndpoint('http://universities.hipolabs.com/search?country=United+States');
        request.setMethod('POST');
        request.setBody('{"name":"Sudeeshna","alpha_two_code":"us","Country":"United States","web_pages":["https://salesforce.com"],"state-province":"india","Domains":["salesforce.com"]}');
        HttpResponse response = h.send(request);
        if(response.getStatusCode()==200){
            System.debug('response body:'+response.getBody());
        }
        else{
            System.debug('callout failed:'+response.getStatus());
        }
    }*/

}