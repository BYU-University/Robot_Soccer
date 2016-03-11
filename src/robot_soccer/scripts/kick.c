#include <wiringPi.h>
int main (void)
{
  wiringPiSetup () ;
  pinMode (21, OUTPUT) ;
    digitalWrite (21, HIGH) ; 
    delay (250) ;
    digitalWrite (21,  LOW) ; 
  return 0 ;
}
