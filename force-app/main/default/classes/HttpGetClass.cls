public with sharing class HttpGetClass {  
    public void getHttp(){
    Http h= new Http();
    HttpRequest request = new HttpRequest();
    request.setEndPoint('http://universities.hipolabs.com/search?country=United+States');
request.setMethod('GET');
HttpResponse response = h.send(request);
if(response.getStatusCode()==200){
    System.debug('Response Body:'+response.getBody());
}
else{
    System.debug('calloutfailed:'+response.getStatus());
}
    }
}