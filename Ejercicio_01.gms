
$onText
 LABORATORIO 1 - EJERCICIO 1                           
Minimizar tiempo, una maquina por trabajo

SEBASTIAN GARCIA   -   201630047
NICOLAS SOLETO         -    2016      
$offText

Sets
  i   'maquinas' / m1*m4 /
  j   'trabajos' / t1*t4 /;
  

Table tiempo(i, j) 'tiempo que tarda una maquina <i> en realizar un trabajo <j>'
            t1      t2      t3      t4
  m1        14      5       8       7
  m2        2       12      6       5
  m3        7       8       3       9
  m4        2       4       6        10;


Variables
  x(i, j)        'Indica si la maquina es seleccionada para un trabajo o no'
  z              'Objective function'  ;


Binary Variable x(i, j);


Equations
objectiveFunction        'objective function'
selecionaCuatro           'selecciona solo cuatro maquinas'
limite(i)                           'limitacion de una maquina por trabajo';

objectiveFunction            ..  z =e= sum((i, j), tiempo(i, j) * x(i, j));

selecionaCuatro ..   sum((i, j), x(i, j)) =e= 4;
limite(i) .. sum( (j), x(i,j) ) =e=1;
        



Model model1 /all/ ;
option mip=CPLEX
Solve model1 using mip minimizing z;

Display x.l;
Display z.l;

