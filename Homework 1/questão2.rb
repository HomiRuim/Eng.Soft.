class ErroNumeroErPlayers < StandardError ; end
class ErroSemEstrategia < StandardError ; end

def ganhador_rps(game)
  raise ErroNumeroErPlayers unless game.length == 2
  
  estrat_validas = ["R", "P", "S"]
  
  game.each do |jog|
    raise ErroSemEstrategia unless estrat_validas.include?(jog[1].upcase)
  end
  
  jog1, jog2 = game
  
  if jog1[1].upcase == jog2[1].upcase
    return jog1
  elsif (jog1[1].upcase == "R" && jog2[1].upcase == "S") || 
        (jog1[1].upcase == "S" && jog2[1].upcase == "P") || 
        (jog1[1].upcase == "P" && jog2[1].upcase == "R")
    return jog1
  else
    return jog2
  end
end

puts ganhador_rps([["Kristen", "P"], ["Pam", "S"]])
# => ["Pam", "S"]

puts ganhador_rps([["Kristen", "P"], ["Pam", "P"]])
# => ["Kristen", "P"]

def ganhador_torneiorps(torneio)
  if torneio[0][0].is_a? String
    return ganhador_rps(torneio)
  end
  
  ganhador_esq = ganhador_torneiorps(torneio[0])
  ganhador_dir = ganhador_torneiorps(torneio[1])
  
  ganhador_rps([ganhador_esq, ganhador_dir])
end

torneio = [
  [
    [["Kristen", "P"], ["Dave", "S"]],
    [["Richard", "R"], ["Michael", "S"]],
  ],
  [
    [["Allen", "S"], ["Omer", "P"]],
    [["David E.", "R"], ["Richard X.", "P"]]
  ]
]

puts ganhador_torneiorps(torneio)
# => ["Richard", "R"]
