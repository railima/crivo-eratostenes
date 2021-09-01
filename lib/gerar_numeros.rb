require_relative '../lib/numero_maximo_exception'

class GerarNumeros

    MENOR_PRIMO = 2

    def initialize
        
    end

    def gerarPrimosAte(numero_maximo)
        if numero_maximo >= MENOR_PRIMO
            gerarNumeros(numero_maximo)
        else
            raise NumeroMaximoException
        end
    end

    def inicializar_lista_primos(numero_maximo)
        lista_primos = [false] * (numero_maximo + 1)
        lista_primos.each_with_index do |candidato, idx|
            lista_primos[idx] = true unless idx < MENOR_PRIMO
        end
    end

    private
    def gerarNumeros(numero_maximo)
        lista_primos = inicializar_lista_primos(numero_maximo)
        index = MENOR_PRIMO
        while index <= numero_maximo
            if lista_primos[index]
                nao_primos = MENOR_PRIMO*index
                while nao_primos <= numero_maximo
                    lista_primos[nao_primos] = false
                    nao_primos += index
                end
            end
            index += 1
        end

        formatar_resultado(numero_maximo, lista_primos)
    end

    def formatar_resultado(numero_maximo, lista_primos)
        resultado = MENOR_PRIMO.to_s
        for valor in (MENOR_PRIMO+1)..numero_maximo do
            if lista_primos[valor]
                resultado += "," + valor.to_s
            end
        end

        resultado
    end
end