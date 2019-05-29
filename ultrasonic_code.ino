#define echoPin 7
#define trigPin 8

long duration; 
long distance;
int idle;
int trigger;


void setup() {
  Serial.begin(9600);
  pinMode(echoPin,INPUT);
  pinMode(trigPin,OUTPUT);
  idle = 0;
  trigger = 1;
}

void loop () {
  digitalWrite(trigPin,LOW);
  delayMicroseconds(2);


  digitalWrite(trigPin,HIGH);
  delayMicroseconds(10);

  digitalWrite(trigPin,LOW);
  duration = pulseIn(echoPin,HIGH);

  distance = duration/58.2;

if (distance >50){
Serial.println(idle);

}

else if (distance <50){
  Serial.println(trigger);
}
  

  delay(50);
}
