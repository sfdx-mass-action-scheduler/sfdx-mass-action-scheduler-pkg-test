/**
 * Example iterable class for Apex source type configurations.
 * Makes an http callout to a web service and deserializes the JSON response
 * into a list of maps that conform to the Apex source type specification.
 */
global with sharing class MyIterable implements Iterable<Map<String, Object>> {

    /**
     * The iterable interface requires one method, iterator(),
     * that returns a class that implements the Iterator interface.
     * What iterator implementation you provide is completely up to you.
     */ 
    public Iterator<Map<String, Object>> iterator() {
        return (Iterator<Map<String, Object>>) new MyIterator();
    }

    /**
     * Here's an example iterator that makes an http callout and
     * returns the JSON results. Your iterator might make multiple SOQL
     * queries to define a complex data structure, or require custom filtering
     * logic too advanced for list views or reports, or perhaps combines
     * external data and Salesforce data. You're only limited by your imagination!
     */
    public class MyIterator implements Iterator<Map<String, Object>> {

        private List<Map<String, Object>> data { get; set; }

        private Integer currentIndex { get; set; }

        public MyIterator() {

            // In Setup | Security Settings | Remote Site Settings, add a new entry
            // with name "th_superbadge_apex" and URL "https://th-superbadge-apex.herokuapp.com".
            HttpRequest req = new HttpRequest();
            req.setEndpoint( 'https://th-superbadge-apex.herokuapp.com/equipment' );
            req.setMethod( 'GET' );

            HttpResponse res = new Http().send( req );

            List<Object> results = (List<Object>) JSON.deserializeUntyped( res.getBody() );

            this.data = new List<Map<String, Object>>();
            this.currentIndex = 0;

            for ( Object result : results ) {
                Map<String, Object> item = (Map<String, Object>) result;
                data.add( item );
            }

        }

        public Boolean hasNext() {
            return ( this.data != null && this.currentIndex < this.data.size() - 1 );
        }

        public Map<String, Object> next() {
            return this.data[this.currentIndex++];
        }

    }

}