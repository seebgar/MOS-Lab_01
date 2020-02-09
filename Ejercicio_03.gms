
$onText
 LABORATORIO 1 - EJERCICIO 3                             
Minimizar costo de tuta entre nodos, nodo inaliambricos moviles

SEBASTIAN GARCIA   -   201630047
NICOLAS SOLETO         -    2016      
$offText


Sets
  i 'nodos' / n1*n7 /
  alias(j, i);
  
Scalar MAX_DIST 'maxima distancia hasta donde se establece conexion entre nodos' / 20 /;

Parameter
        posX(i) 'posicion en el eje X de un nodo n'
        / n1 20
          n2 22
          n3 9
          n4 3
          n5 21
          n6 29
          n7 14 /
        
        posY(j) 'posicion en el eje Y de un nodo n'
        / n1 6
          n2 1
          n3 2
          n4 25
          n5 10
          n6 2
          n7 12 /
          
        c(i, j) 'costo';
        c(i, j) = sqrt( power((posX(i) - posX(j)),2) + power((posY(i) - posY(j)),2) ) $ ( sqrt( power((posX(i) - posX(j)),2) + power((posY(i) - posY(j)),2) ) > 0 ) + 999 $ (sqrt( power((posX(i) - posX(j)),2) + power((posY(i) - posY(j)),2) ) = 0) ;
**** EL COSTO ES 999 SI LA DISTANCIA ES 0 : EN CASO CONTRARIO, ES EL CUALCULO DE DISTANCIA ENTRE DOS PUNTOS (X, Y)          

Variables
  x(i,j)      'Indica si se toma el camino que conecta a los nodos i, j'
  z           'Objective function - minimizar costo camino'  ;

Binary Variable x;

Equations
objectiveFunction        'objective function'
limiteDistancia                       'no habrán nodos cuyas conexiones excedan el costo de 20'
sourceNode(i)            'source node'
destinationNode(j)      ' destination node'
intermediateNode         'intermediate node';

objectiveFunction                                                                    ..  z =e= sum((i,j), c(i,j) * x(i,j));

limiteDistancia                                                                  .. sum( (i, j), x(i, j) $ (  c(i, j) >= MAX_DIST ) )=e=0;                 
sourceNode(i)$(ord(i) = 4)                                                   ..  sum((j), x(i,j)) =e= 1;
destinationNode(j)$(ord(j) = 6)                                           ..  sum((i), x(i,j)) =e= 1;
intermediateNode(i)$(ord(i) <> 4 and ord(i) <> 6)           ..  sum((j), x(i,j)) - sum((j), x(j,i)) =e= 0;

Model model1 /all/ ;
option mip=CPLEX
Solve model1 using mip minimizing z;

Display c;
Display x.l;
Display z.l;
