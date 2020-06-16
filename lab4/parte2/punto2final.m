clc
clear

bits_recibidos_izq_a_der=[ 11 01 00 01 11 ];

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
if bits_recibidos_izq_a_der( 1 ) == 0
  distancias( 1 ) = 0;
  distancias( 2 ) = 2;
elseif bits_recibidos_izq_a_der( 1 ) == 11
  distancias( 1 ) = 2;
  distancias( 2 ) = 0;
else
  distancias( 1 ) = 1;
  distancias( 2 ) = 1;
endif

##t2 a t3
prev_distancias = distancias;
if bits_recibidos_izq_a_der( 2 ) == 11
  distancias( 1 ) = prev_distancias( 1 ) + 2;
  distancias( 2 ) = prev_distancias( 1 ) + 0;
  distancias( 3 ) = prev_distancias( 2 ) + 1;
  distancias( 4 ) = prev_distancias( 2 ) + 1;
elseif bits_recibidos_izq_a_der( 2 ) == 10
  distancias( 1 ) = prev_distancias( 1 ) + 1;
  distancias( 2 ) = prev_distancias( 1 ) + 1;
  distancias( 3 ) = prev_distancias( 2 ) + 2;
  distancias( 4 ) = prev_distancias( 2 ) + 0;
elseif bits_recibidos_izq_a_der( 2 ) == 1
  distancias( 1 ) = prev_distancias( 1 ) + 1;
  distancias( 2 ) = prev_distancias( 1 ) + 1;
  distancias( 3 ) = prev_distancias( 2 ) + 0;
  distancias( 4 ) = prev_distancias( 2 ) + 2;
else
  distancias( 1 ) = prev_distancias( 1 ) + 0;
  distancias( 2 ) = prev_distancias( 1 ) + 2;
  distancias( 3 ) = prev_distancias( 2 ) + 1;
  distancias( 4 ) = prev_distancias( 2 ) + 1;
endif

nodos1 = [1,2,4];
nodos2 = [1,2,5];
nodos3 = [1,3,6];
nodos4 = [1,3,7];

##t3 a t4
prev_distancias = distancias;
nods1 = nodos1;
nods2 = nodos2;
nods3 = nodos3;
nods4 = nodos4;
##Caso 11
if bits_recibidos_izq_a_der( 3 ) == 11
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 2;
  opcion2 = prev_distancias( 3 ) + 0;
  if opcion1 < opcion2
    nodos1 = [ nods1, 8];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 8];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 0;
  opcion2 = prev_distancias( 3 ) + 2;
  if opcion1 < opcion2
    nodos2 = [ nods1, 9];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 9];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos3 = [ nods2, 10];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 10];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos4 = [ nods2, 11];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 11];
    distancias( 4 ) = opcion2;
  endif
##Caso 10
elseif bits_recibidos_izq_a_der( 3 ) == 10
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos1 = [ nods1, 8];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 8];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos2 = [ nods1, 9];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 9];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 2;
  opcion2 = prev_distancias( 4 ) + 0;
  if opcion1 < opcion2
    nodos3 = [ nods2, 10];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 10];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 0;
  opcion2 = prev_distancias( 4 ) + 2;
  if opcion1 < opcion2
    nodos4 = [ nods2, 11];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 11];
    distancias( 4 ) = opcion2;
  endif
##Caso 01
elseif bits_recibidos_izq_a_der( 3 ) == 1
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos1 = [ nods1, 8];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 8];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos2 = [ nods1, 9];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 9];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 0;
  opcion2 = prev_distancias( 4 ) + 2;
  if opcion1 < opcion2
    nodos3 = [ nods2, 10];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 10];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 2;
  opcion2 = prev_distancias( 4 ) + 0;
  if opcion1 < opcion2
    nodos4 = [ nods2, 11];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 11];
    distancias( 4 ) = opcion2;
  endif
##Caso 00
else
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 0;
  opcion2 = prev_distancias( 3 ) + 2;
  if opcion1 < opcion2
    nodos1 = [ nods1, 8];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 8];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 2;
  opcion2 = prev_distancias( 3 ) + 0;
  if opcion1 < opcion2
    nodos2 = [ nods1, 9];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 9];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos3 = [ nods2, 10];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 10];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos4 = [ nods2, 11];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 11];
    distancias( 4 ) = opcion2;
  endif
endif




##t4 a t5
prev_distancias = distancias;
nods1 = nodos1;
nods2 = nodos2;
nods3 = nodos3;
nods4 = nodos4;
##Caso 11
if bits_recibidos_izq_a_der( 4 ) == 11
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 2;
  opcion2 = prev_distancias( 3 ) + 0;
  if opcion1 < opcion2
    nodos1 = [ nods1, 12];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 12];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 0;
  opcion2 = prev_distancias( 3 ) + 2;
  if opcion1 < opcion2
    nodos2 = [ nods1, 13];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 13];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos3 = [ nods2, 14];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 14];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos4 = [ nods2, 15];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 15];
    distancias( 4 ) = opcion2;
  endif
##Caso 10
elseif bits_recibidos_izq_a_der( 4 ) == 10
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos1 = [ nods1, 12];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 12];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos2 = [ nods1, 13];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 13];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 2;
  opcion2 = prev_distancias( 4 ) + 0;
  if opcion1 < opcion2
    nodos3 = [ nods2, 14];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 14];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 0;
  opcion2 = prev_distancias( 4 ) + 2;
  if opcion1 < opcion2
    nodos4 = [ nods2, 15];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 15];
    distancias( 4 ) = opcion2;
  endif
##Caso 01
elseif bits_recibidos_izq_a_der( 4 ) == 1
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos1 = [ nods1, 12];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 12];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos2 = [ nods1, 13];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 13];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 0;
  opcion2 = prev_distancias( 4 ) + 2;
  if opcion1 < opcion2
    nodos3 = [ nods2, 14];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 14];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 2;
  opcion2 = prev_distancias( 4 ) + 0;
  if opcion1 < opcion2
    nodos4 = [ nods2, 15];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 15];
    distancias( 4 ) = opcion2;
  endif
##Caso 00
else
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 0;
  opcion2 = prev_distancias( 3 ) + 2;
  if opcion1 < opcion2
    nodos1 = [ nods1, 12];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 12];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 2;
  opcion2 = prev_distancias( 3 ) + 0;
  if opcion1 < opcion2
    nodos2 = [ nods1, 13];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 13];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos3 = [ nods2, 14];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 14];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos4 = [ nods2, 15];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 15];
    distancias( 4 ) = opcion2;
  endif
endif




##t5 a t6
prev_distancias = distancias;
nods1 = nodos1;
nods2 = nodos2;
nods3 = nodos3;
nods4 = nodos4;
##Caso 11
if bits_recibidos_izq_a_der( 5 ) == 11
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 2;
  opcion2 = prev_distancias( 3 ) + 0;
  if opcion1 < opcion2
    nodos1 = [ nods1, 16];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 16];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 0;
  opcion2 = prev_distancias( 3 ) + 2;
  if opcion1 < opcion2
    nodos2 = [ nods1, 17];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 17];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos3 = [ nods2, 18];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 18];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos4 = [ nods2, 19];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 19];
    distancias( 4 ) = opcion2;
  endif
##Caso 10
elseif bits_recibidos_izq_a_der( 5 ) == 10
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos1 = [ nods1, 16];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 16];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos2 = [ nods1, 17];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 17];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 2;
  opcion2 = prev_distancias( 4 ) + 0;
  if opcion1 < opcion2
    nodos3 = [ nods2, 18];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 18];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 0;
  opcion2 = prev_distancias( 4 ) + 2;
  if opcion1 < opcion2
    nodos4 = [ nods2, 19];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 19];
    distancias( 4 ) = opcion2;
  endif
##Caso 01
elseif bits_recibidos_izq_a_der( 5 ) == 1
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos1 = [ nods1, 16];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 16];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 1;
  opcion2 = prev_distancias( 3 ) + 1;
  if opcion1 < opcion2
    nodos2 = [ nods1, 17];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 17];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 0;
  opcion2 = prev_distancias( 4 ) + 2;
  if opcion1 < opcion2
    nodos3 = [ nods2, 18];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 18];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 2;
  opcion2 = prev_distancias( 4 ) + 0;
  if opcion1 < opcion2
    nodos4 = [ nods2, 19];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 19];
    distancias( 4 ) = opcion2;
  endif
##Caso 00
else
  ##prev_distancias 00
  opcion1 = prev_distancias( 1 ) + 0;
  opcion2 = prev_distancias( 3 ) + 2;
  if opcion1 < opcion2
    nodos1 = [ nods1, 16];
    distancias( 1 ) = opcion1;
  else
    nodos1 = [ nods3, 16];
    distancias( 1 ) = opcion2;
  endif
  ##prev_distancias 10
  opcion1 = prev_distancias( 1 ) + 2;
  opcion2 = prev_distancias( 3 ) + 0;
  if opcion1 < opcion2
    nodos2 = [ nods1, 17];
    distancias( 2 ) = opcion1;
  else
    nodos2 = [ nods3, 17];
    distancias( 2 ) = opcion2;
  endif
  ##prev_distancias 01
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos3 = [ nods2, 18];
    distancias( 3 ) = opcion1;
  else
    nodos3 = [ nods4, 18];
    distancias( 3 ) = opcion2;
  endif
  ##prev_distancias 11
  opcion1 = prev_distancias( 2 ) + 1;
  opcion2 = prev_distancias( 4 ) + 1;
  if opcion1 < opcion2
    nodos4 = [ nods2, 19];
    distancias( 4 ) = opcion1;
  else
    nodos4 = [ nods4, 19];
    distancias( 4 ) = opcion2;
  endif
endif

lista = [];

switch( find( min( distancias ) == distancias ) )
  case 1
    lista = nodos1;
  case 2
    lista = nodos2;
  case 3
    lista = nodos3;
  otherwise
    lista = nodos4;
endswitch
printf("Estados recorridos.\n");
lista

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
  bits( i ) = trellis( lista( i +1 ), lista( i ) );
endfor
printf("Cadena original.\n");
bits



