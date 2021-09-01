require_relative '../lib/gerar_numeros'
require_relative '../lib/numero_maximo_exception'

describe GerarNumeros do

    let(:gerador) { GerarNumeros.new }

    it 'deve gerar números primos até 2' do
        verificarPrimosGerados("2", 2)
    end
    
    it 'deve gerar números primos até 3' do
        verificarPrimosGerados("2,3", 3)
    end

    it 'deve lançar exceção quando valor máximo é menor do que 2' do
        expect{ gerador.gerarPrimosAte(-20) }.to raise_error(NumeroMaximoException)
    end

    it 'deve gerar números primos até 4' do
        verificarPrimosGerados("2,3", 4)
    end

    it 'deve gerar números primos até 5' do
        verificarPrimosGerados("2,3,5", 5)
    end
    
    it 'deve gerar números primos até 10' do
        verificarPrimosGerados("2,3,5,7", 10)
    end
    
    it 'deve gerar números primos até 20' do
        verificarPrimosGerados("2,3,5,7,11,13,17,19", 20)
    end

    it 'deve inicializar candidatos até número 5' do
        valor_maximo = 5
        MENOR_PRIMO = 2
        candidatos = gerador.inicializar_lista_primos(valor_maximo)

        expect(candidatos[0]).to be_falsy
        expect(candidatos[1]).to be_falsy

        candidatos.each_with_index do |candidato, idx|
            if idx >= MENOR_PRIMO
                expect(candidato).to be_truthy
            end
        end
    end

    private
    def verificarPrimosGerados(lista_esperada, numero_maximo)
        expect(gerador.gerarPrimosAte(numero_maximo)).to eq(lista_esperada)
    end
end