class AnalisadorLinha
    attr_accessor :palavras
    def initialize (numeroDaLinha, conteudoLinha)
        @numeroDaLinha = numeroDaLinha
        @conteudoLinha = conteudoLinha
        @palavras = gerarAnalise(conteudoLinha)
    end

    def gerarAnalise(conteudoLinha)
        return conteudoLinha.split.each_with_object(Hash.new(0)) { |palavra, hash| hash[palavra] += 1 }
    end

    def to_str
        return "#{@numeroDaLinha} - #{@conteudoLinha}"
    end
    def to_freq
        return @palavras.max_by { |key, value| value }
    end
end

ary = Array.new
count = 0
File.foreach("teste.txt") do |linha|
    ary.insert(count, AnalisadorLinha.new(count+1, linha))
    count += 1
end
ary.each do |a|
    puts "O conteúdo dessa linha é: #{a.to_str} #{puts}"
    puts "A frequência de palavras é: #{a::palavras}"
    puts "A palavra que tem maior frequência é: #{a.to_freq}"
end
