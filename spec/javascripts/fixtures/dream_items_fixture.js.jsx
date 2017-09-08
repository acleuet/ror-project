class DreamItemFixture{
  static setUpItems(nb_items){
    let items = []
    for(var i=1; i<=nb_items; i++){
      {
      let item = { id: i,
                   date: "2017-08-08T00:00:00.000Z",
                   sequences_count: 1,
                   places_count: 2,
                   characters_count: 3
                  }
      items.push(item)
      }
    }
    return items
  }
}

window.DreamItemFixture = DreamItemFixture