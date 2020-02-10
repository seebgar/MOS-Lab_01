
$onText
 LABORATORIO 1 - EJERCICIO 4                             
Estación de bomberos cada 15 minutos entre prueblos

SEBASTIAN GARCIA   -   201630047
NICOLAS SOLETO         -    201623026      
$offText

Variables
P1      'pueblo x'
P2      
P3
P4
P5
P6
z        'Objective Function';

Binary variable P1, P2, P3, P4, P5, P6;

Equations
objectiveFunction        'Objective Function'
limiteTiempoP1             'restriccion en limite de tiempo para conducir entre estacion y pueblo'
limiteTiempoP2
limiteTiempoP3
limiteTiempoP4
limiteTiempoP5;

objectiveFunction           .. z =e= P1 + P2 + P3 + P4 + P5 + P6;
limiteTiempoP1                ..  P1 + P2 =e= 1;
limiteTiempoP2                  .. P2 + P6 =e=1;
limiteTiempoP3              .. P3 + P4 =e= 1;
limiteTiempoP4              .. P4 + P5 =e= 1;
limiteTiempoP5          ..  P5 + P6 =l=1;



Model mod1 /all/;
Option mip=CPLEX
solve mod1 using MIP minimizing z;

display P1.l;
display P2.l;      
display P3.l;
display P4.l;
display P5.l;
display P6.l;

display z.l;




