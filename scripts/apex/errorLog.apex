try {
    Lead newRecord = new Lead();
    newRecord.FirstName = 'Fatih';
    newRecord.LastName = null ;
    insert newRecord;
}catch(Exception exc){
    System.debug('EXC:' + exc.getMessage());
    ErrorLogHelper.createErrorLog('DailyLeadWebService', 'fetchLeads', exc.getMessage());
}