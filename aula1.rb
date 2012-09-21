# method_missing
#
#
#
class Pessoa
  attr_reader :nome, :idade

  def initialize(nome,idade)
    @nome = nome
    @idade = idade
  end

  def <=>(outra_pessoa)
    return @nome <=> outra_pessoa.nome
  end

  def method_missing(nome, *args)
    bateu = nome.to_s.match(/^procurar_por_/) != nil
    if bateu
      matched = nome.to_s.match(/^procurar_por_(.*)_e_(.*)/)
      puts "#{matched[1]} e #{matched[2]}"
    else
      super(nome, *args)
    end
  end
end
#
#pessoa = Pessoa.new("hugo", 19)
#
#pessoa.procurar_por_nome_e_idade("hugo", 19)
#
#pessoa.metodo_que_nao_existe
#pessoa.aksdjnfasjkdfn

# Blocos de codigo

p1 = Pessoa.new("hugo", 19)
p2 = Pessoa.new("gui", 24)

array = [p1, p2]

#by_name = proc do |pessoa|
#  pessoa.nome
#end
#
by_age = lambda do |pessoa|
  return pessoa.idade
end

#p array.sort_by(&:idade)
#
#p array.sort_by {|pessoa| pessoa.idade }
#
#p array.sort_by do |pessoa|
#  pessoa.idade
#end

#def aleatorio(&codigo)
#  p1 = Pessoa.new("hugo", 19)
#  puts codigo.call(p1)
#end
#
#aleatorio(&by_age)


#===========================================
# Proc             x          Lambda
#===========================================
# return usa o         return funciona como
# escopo em que        em um método
# foi definida
#
# aceita qualquer     tem quer ser os    
# número de           argumentos que foram
# argumentos          definidos
#
#
