class CharacterGraphService

  def self.characters_graph user
    {
      labels: self.graph_data(user).map{ |data| data[0] },
      datasets: [
        {
            label: self.graph_title,
            backgroundColor: "rgba(220,220,220,0.2)",
            borderColor: "rgba(220,220,220,1)",
            data: self.graph_data(user).map{ |data| data[1] }
        }]
    }
  end

  def self.graph_title
    "Série"
  end

  def self.graph_data user
    Character.owned_by(user).map { |character | [character.complete_name, character.sequences.count]}
  end

end