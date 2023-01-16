public with sharing class CurrencyExchange {
    public static void CurrencyConversion() {

        map<string,decimal>  currISOCodeAndExchangeRateMap= new map<string,decimal>();
        currISOCodeAndExchangeRateMap.put('AUD', 0.73);
        currISOCodeAndExchangeRateMap.put('CAD', 0.78);
        currISOCodeAndExchangeRateMap.put('EUR', 1.13);
        currISOCodeAndExchangeRateMap.put('NZD', 0.68);
        currISOCodeAndExchangeRateMap.put('INR', 0.013);

        //system.debug('All currencies =' +currISOCodeAndExchangeRateMap);
        //system.debug(currISOCodeAndExchangeRateMap.get('AUD'));
        Boolean isContains = currISOCodeAndExchangeRateMap.containsKey('SAD');
        //system.debug(isContains);

        Set<string> isoCodeSet = currISOCodeAndExchangeRateMap.keySet();
        //system.debug(isoCodeSet);

        Set<string> GraterThan1 = new Set <String>();
        Set<String> LessThan1 = new Set <String>();

        for (String EachIsoCode : isoCodeSet) {
            if  (currISOCodeAndExchangeRateMap.get(EachIsoCode)>= 1) {

                GraterThan1.add(EachIsoCode);
                
            }
        
                else {
                    
                    LessThan1.add(EachIsoCode);
                    
                    
                }
                
        }
        System.debug('Bigger than 1=' +GraterThan1);
        system.debug('Less than 1=' +LessThan1);
            
        }
    }
