clc
clear

bits_recibidos_izq_a_der=[ 01 10 11 00 00 ];

## diagrama
## estados segun tiempo
##      1   2   3   4
##      00  10  01  11
##t1 -  1
##t2 -  2   3
##t3 -  4   5   6   7
##t4 -  8   9   10  11
##t5 -  12  13  14  15
##t6 -  16  17  18  19
## matriz del diagrama segun bit conector (no conectan 16 17 18 19 a nada)
##  00  00  10  00  10  01  11  00  10  01  11  00  10  01  11
##  1   2   3   4   5   6   7   8   9   10  11  12  13  14  15
##1 -   -   -   -   -   -   -   -   -   -   -   -   -   -   -
##2 0   -   -   -   -   -   -   -   -   -   -   -   -   -   -
##3 1   -   -   -   -   -   -   -   -   -   -   -   -   -   -
##4 -   0   -   -   -   -   -   -   -   -   -   -   -   -   -
##5 -   1   -   -   -   -   -   -   -   -   -   -   -   -   -
##6 -   -   0   -   -   -   -   -   -   -   -   -   -   -   -
##7 -   -   1   -   -   -   -   -   -   -   -   -   -   -   -
##8 -   -   -   0   -   0   -   -   -   -   -   -   -   -   -
##9 -   -   -   1   -   1   -   -   -   -   -   -   -   -   -
##10-   -   -   -   0   -   0   -   -   -   -   -   -   -   -
##11-   -   -   -   1   -   1   -   -   -   -   -   -   -   -
##12-   -   -   -   -   -   -   0   -   0   -   -   -   -   -
##13-   -   -   -   -   -   -   1   -   1   -   -   -   -   -
##14-   -   -   -   -   -   -   -   0   -   0   -   -   -   -
##15-   -   -   -   -   -   -   -   1   -   1   -   -   -   -
##16-   -   -   -   -   -   -   -   -   -   -   0   -   0   -
##17-   -   -   -   -   -   -   -   -   -   -   1   -   1   -
##18-   -   -   -   -   -   -   -   -   -   -   -   0   -   0
##19-   -   -   -   -   -   -   -   -   -   -   -   1   -   1
## matriz del diagrama segun salida (no conectan 16 17 18 19 a nada)
##  00  00  10  00  10  01  11  00  10  01  11  00  10  01  11
##  1   2   3   4   5   6   7   8   9   10  11  12  13  14  15
##1 -   -   -   -   -   -   -   -   -   -   -   -   -   -   -
##2 00  -   -   -   -   -   -   -   -   -   -   -   -   -   -
##3 11  -   -   -   -   -   -   -   -   -   -   -   -   -   -
##4 -   00  -   -   -   -   -   -   -   -   -   -   -   -   -
##5 -   11  -   -   -   -   -   -   -   -   -   -   -   -   -
##6 -   -   01  -   -   -   -   -   -   -   -   -   -   -   -
##7 -   -   10  -   -   -   -   -   -   -   -   -   -   -   -
##8 -   -   -   00  -   11  -   -   -   -   -   -   -   -   -
##9 -   -   -   11  -   00  -   -   -   -   -   -   -   -   -
##10-   -   -   -   01  -   10  -   -   -   -   -   -   -   -
##11-   -   -   -   10  -   01  -   -   -   -   -   -   -   -
##12-   -   -   -   -   -   -   00  -   11  -   -   -   -   -
##13-   -   -   -   -   -   -   11  -   00  -   -   -   -   -
##14-   -   -   -   -   -   -   -   01  -   10  -   -   -   -
##15-   -   -   -   -   -   -   -   10  -   01  -   -   -   -
##16-   -   -   -   -   -   -   -   -   -   -   00  -   11  -
##17-   -   -   -   -   -   -   -   -   -   -   11  -   00  -
##18-   -   -   -   -   -   -   -   -   -   -   -   01  -   10
##19-   -   -   -   -   -   -   -   -   -   -   -   10  -   01

distancias = [0 0 0 0];

##t1 a t2
##caso 00
if bits_recibidos_izq_a_der( 1 ) == 0
  distancias( 1 ) = 0;##00
  distancias( 2 ) = 2;##11
##caso 11
elseif bits_recibidos_izq_a_der( 1 ) == 11
  distancias( 1 ) = 2;##00
  distancias( 2 ) = 0;##11
##caso 01 10
else
  distancias( 1 ) = 1;##00
  distancias( 2 ) = 1;##11
endif

##t2 a t3
prev_distancias = distancias;
nodos1 = [1,2,4];
nodos2 = [1,2,5];
nodos3 = [1,3,6];
nodos4 = [1,3,7];
##caso 11
if bits_recibidos_izq_a_der( 2 ) == 11
  distancias( 1 ) = prev_distancias( 1 ) + 2;##00
  distancias( 2 ) = prev_distancias( 1 ) + 0;##11
  distancias( 3 ) = prev_distancias( 2 ) + 1;##10
  distancias( 4 ) = prev_distancias( 2 ) + 1;##01
##caso 10  
elseif bits_recibidos_izq_a_der( 2 ) == 10
  distancias( 1 ) = prev_distancias( 1 ) + 1;##00
  distancias( 2 ) = prev_distancias( 1 ) + 1;##11
  distancias( 3 ) = prev_distancias( 2 ) + 0;##10
  distancias( 4 ) = prev_distancias( 2 ) + 2;##01
##caso 01  
elseif bits_recibidos_izq_a_der( 2 ) == 1
  distancias( 1 ) = prev_distancias( 1 ) + 1;##00
  distancias( 2 ) = prev_distancias( 1 ) + 1;##11
  distancias( 3 ) = prev_distancias( 2 ) + 2;##10
  distancias( 4 ) = prev_distancias( 2 ) + 0;##01
##caso 00  
else
  distancias( 1 ) = prev_distancias( 1 ) + 0;##00
  distancias( 2 ) = prev_distancias( 1 ) + 2;##11
  distancias( 3 ) = prev_distancias( 2 ) + 1;##10
  distancias( 4 ) = prev_distancias( 2 ) + 1;##01
endif

for l=3:5 ##misma logica para t3 a t4 a t5 a t6
  prev_distancias = distancias;
  prev_nodos1 = nodos1;
  prev_nodos2 = nodos2;
  prev_nodos3 = nodos3;
  prev_nodos4 = nodos4;
  
  a00=99;
  a10=99;
  a01=99;
  a11=99;
  if bits_recibidos_izq_a_der( l ) == 11 ##distancias si recibe 11
    a00=2;
    a10=1;
    a01=1;
    a11=0;
  elseif bits_recibidos_izq_a_der( l ) == 10 ##distancias si recibe 10
    a00=1;
    a10=0;
    a01=2;
    a11=1;
  elseif bits_recibidos_izq_a_der( l ) == 1 ##distancias si recibe 01
    a00=1;
    a10=2;
    a01=0;
    a11=1;
  else ##distancias si recibe 00
    a00=0;
    a10=1;
    a01=1;
    a11=2;
  endif
  
  ##a estado 00
  opcion1 = prev_distancias( 1 ) + a00;##00
  opcion2 = prev_distancias( 3 ) + a11;##11
  if opcion1 < opcion2
    nodos1 = [ prev_nodos1, 8+(4*(l-3))];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ prev_nodos3, 8+(4*(l-3))];
    distancias( 1 ) = opcion2;
  endif
  ##a estado 10
  opcion1 = prev_distancias( 1 ) + a11;##11
  opcion2 = prev_distancias( 3 ) + a00;##00
  if opcion1 < opcion2
    nodos2 = [ prev_nodos1, 9+(4*(l-3))];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ prev_nodos3, 9+(4*(l-3))];
    distancias( 2 ) = opcion2;
  endif
  ##a estado 01
  opcion1 = prev_distancias( 2 ) + a01;##01
  opcion2 = prev_distancias( 4 ) + a10;##10
  if opcion1 < opcion2
    nodos3 = [ prev_nodos2, 10+(4*(l-3))];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ prev_nodos4, 10+(4*(l-3))];
    distancias( 3 ) = opcion2;
  endif
  ##a estado 11
  opcion1 = prev_distancias( 2 ) + a10;##10
  opcion2 = prev_distancias( 4 ) + a01;##01
  if opcion1 < opcion2
    nodos4 = [ prev_nodos2, 11+(4*(l-3))];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ prev_nodos4, 11+(4*(l-3))];
    distancias( 4 ) = opcion2;
  endif
endfor

camino_viterbi = [];

printf("Distancia minima\n");
switch( find( min( distancias ) == distancias ) )
case 1
  distancias(1)
  camino_viterbi = nodos1;
case 2
  distancias(2)
  camino_viterbi = nodos2;
case 3
  distancias(3)
  camino_viterbi = nodos3;
otherwise
  distancias(4)
  camino_viterbi = nodos4;
endswitch
printf("Estados recorridos\n");
camino_viterbi

trellis=[
  -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1
  0   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1
  1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1
  -1   0   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1
  -1   1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1
  -1   -1   0   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1
  -1   -1   1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1
  -1   -1   -1   0   -1   0   -1   -1   -1   -1   -1   -1   -1   -1   -1
  -1   -1   -1   1   -1   1   -1   -1   -1   -1   -1   -1   -1   -1   -1
  -1   -1   -1   -1   0   -1   0   -1   -1   -1   -1   -1   -1   -1   -1
  -1   -1   -1   -1   1   -1   1   -1   -1   -1   -1   -1   -1   -1   -1
  -1   -1   -1   -1   -1   -1   -1   0   -1   0   -1   -1   -1   -1   -1
  -1   -1   -1   -1   -1   -1   -1   1   -1   1   -1   -1   -1   -1   -1
  -1   -1   -1   -1   -1   -1   -1   -1   0   -1   0   -1   -1   -1   -1
  -1   -1   -1   -1   -1   -1   -1   -1   1   -1   1   -1   -1   -1   -1
  -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   0   -1   0   -1
  -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   1   -1   1   -1
  -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   0   -1   0
  -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   -1   1   -1   1
];

bits = [ -1 -1 -1 -1 -1 ];
for i = 1 : 5
  bits( i ) = trellis( camino_viterbi( i +1 ), camino_viterbi( i ) );
endfor
printf("Cadena original\n");
bits



