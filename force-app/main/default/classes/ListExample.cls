public class ListExample {
    public  static void ListMethods(){
        List<Integer> li = new List<Integer>();
        li.add(10);
        li.add(20);
        li.add(30);
        li.add(40);
        System.debug('the list elements'+li);
        System.debug('first element'+li[0]);
        integer listsize=li.size();
        System.debug('the size'+listsize);
        for(integer x=1;x<=100;x++){
            li.add(x);
        } 
        for(integer x=1;x<100;x++){
            System.debug(li.get(x));
        }
        
    }
    public static void DoWhileLoop(){
        integer x=1;
        do{
            System.debug(x);
            x++;
        }while(x<=100);
    }
        public static void Mapmethods(){
            Map<String,String> mapsets = new Map<String,String>();
            mapsets.put('sudhi','india');
            mapsets.put('Akki','USA');
            System.debug('the map size'+mapsets.size());
            System.debug(mapsets.get('Akki'));
            System.debug('the map is'+mapsets);
            Set<String> key = mapsets.keySet();
            List<String> values = mapsets.Values();
        }
}