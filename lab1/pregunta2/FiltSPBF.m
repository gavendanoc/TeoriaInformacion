%Filtro suprime badas en frecuencia
%Vector resultado = FiltSPBF(Vector de las frefuencia,limite izquierda del filtro,limite derecha del filtro)
function X = FiltSPBF(frec, w01, w02)
    leng = length(frec);
    absy = abs(frec);
    X = ones(1, leng) + 1;
    for i = 1:leng
        if (absy(i) >= w01) && (absy(i) <= w02)
            X(i) = 0;
        end
    end
end
