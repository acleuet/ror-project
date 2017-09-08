class SequenceGraphService
  
    def self.sequences_graph user
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
      Dream.owned_by(user).map { |dream| [I18n.localize(dream.date), dream.sequences.count]}
    end
  
  end