
$onText
 LABORATORIO 1 - EJERCICIO 4                             
Estación de bomberos cada 15 minutos entre prueblos

SEBASTIAN GARCIA   -   201630047
NICOLAS SOLETO         -    2016      
$offText

sets
         i 'pueblos' /p1*p6/
alias(j,i);

Scalar MAX_TIME  / 15 /;

Table c(i,j) 'link cost'
         p1      p2      p3      p4      p5      p6
p1       0       10      20      30      30      20
p2       10      0       25      35      20      10
p3       20      25      0       15      30      20
p4       30      35      15      0       15      25
p5       30      20      30      15      0       14
p6       20      10      20      25      14      0;

Variables
x(i)     'Indica si se selecciona el camino entre los nodos i, j'
z        'Objective Function';

Binary variable x;

Equations
objectiveFunction      'Objective Function'
limiteTiempo(j)             'restriccion en limite de tiempo para conducir entre estacion y pueblo';

objectiveFunction           .. z =e= sum((i), x(i));
limiteTiempo(j)                .. sum((i),x(i)$(c(i,j)<= MAX_TIME)) =e= 1;


Model mod1 /all/;
Option mip=CPLEX
solve mod1 using MIP minimizing z;
display x.l;
display z.l;



