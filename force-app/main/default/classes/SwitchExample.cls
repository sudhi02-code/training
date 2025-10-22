public class SwitchExample {
    public Integer dayvalue;
    public static  void displayDay(Integer dayvalue){
    switch on dayvalue{
        when 1 {
            System.debug('sunday');
        }
        when 2 {
            System.debug('Monday');
        }
        when 3{
            System.debug('tuesday');
        }
        when 4{
            System.debug('Wednesday');
        }
        when 5 {
            System.debug('Thursday');
        }
        when 6{
            System.debug('friday');
        }
        when 7{
            System.debug('Saturday');
        }
        when else{
            System.debug('Invalid number');
        }
    }
}
}