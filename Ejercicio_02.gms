
$onText
 LABORATORIO 1 - EJERCICIO 2                           
Minimizar costo de transporte, sistema de multiprocesamiento

SEBASTIAN GARCIA   -   201630047
NICOLAS SOLETO         -    2016      
$offText

Sets
  i   'precesadores origen' / o1*o3 /
  j   'procesadores destino' / d1*d4 /;
  

Parameter
        a(i) 'oferta de procesos de un procesador origen <i> '
        / o1 300, o2 500, o3 200 /
        
        b(j) 'demanda de procesos por parte de un procesador destino <j>'
        / d1 200, d2 300, d3 100, d4 400 /;


Table c(i, j) 'costo de transporte desde un procesador origen <i> hasta uno de destino <j>'
            d1      d2      d3      d4
  o1        8       6       10      9
  o2        9       12      13      7
  o3        14      9       16      5 ;


Variables
  x(i, j)        'Cantidad de procesos a transportar'
  z              'Objective function - costo total de transporte, se busca minimizar'  ;


Positive Variable x(i, j);


Equations
objectiveFunction        'objective function'
oferta(i)                         'observa la cantidad de procesos disponibles en procesador origen'
demanda(j)                   'observa el cumplimiento de la demanda que exige cada procesador destino';

objectiveFunction ..  z =e= sum((i, j), c(i, j) * x(i, j));

oferta(i) ..   sum((j), x(i, j)) =l= a(i);
demanda(j) .. sum( (i), x(i,j) ) =g=b(j);
        



Model model1 /all/ ;
option mip=CPLEX
Solve model1 using mip minimizing z;

Display x.l;
Display z.l;

