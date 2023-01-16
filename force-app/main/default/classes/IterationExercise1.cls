public with sharing class IterationExercise1 {
    public static void Iteration1(integer num) {
        integer i = 1;
        integer output;
        while ( i <=10){
            output = i * num ;
            system.debug(i + 'x' +num + '=' + output );
            i++ ;
        }

    }
}
