class RememberedGraphService
  
    def self.remembered_graph user
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
      [[I18n.t("graphs.remembered_diagram_rememberred"), Dream.owned_by(user).where(remembered: true).count], 
       [I18n.t("graphs.remembered_diagram_forgotten"), Dream.owned_by(user).where(remembered: false).count]]
    end
  
  end