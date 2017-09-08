class Item extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        item: props.data,
    }
  }
  _getMoodValue(){
    let iconFa = '';
    if (this.state.item.feeling == "happy"){
      iconFa = 'fa-smile'
    }else{
      iconFa = 'fa-'+this.state.item.feeling
    }
    let classIconFa = "fas "+iconFa+" fa-stack-1x fa-flip-horizontal"
    let mood = <i className={classIconFa}></i>
    
    return mood;
  }

  render () {
    let className = "item"
    let date = this.state.item.date || "2017-01-08"
    let sequencesCount = this.state.item.sequences_count
    let charactersCount = this.state.item.characters_count
    let placesCount = this.state.item.places_count
    let mood = this._getMoodValue()

    return <ReactBootstrap.ListGroupItem className={className}>
            <ReactBootstrap.Media>
              <ReactBootstrap.Media.Left align="middle" className="mood">
                <span className="fa-stack fa-2x">
                  <i className="fas fa-circle-notch fa-2x"></i>
                    { mood }
                </span>
              </ReactBootstrap.Media.Left>
              <ReactBootstrap.Media.Body className="details">
                <div className="title">
                  <span className="date">
                    <i className="fa fa-calendar-alt fa-1x"></i> {I18n.t("dream.date", {date: I18n.l("dates.formats.day_month_year_concise", date)}) }
                  </span>
                </div>
                <div className="additional-details">
                  <span className="characters">
                    <i className="far fa-users fa-1x"></i>
                    <span className="numerical-value">{ charactersCount }</span>
                  </span>
                  <span className="sequences">
                    <i className="fal fa-film fa-1x"></i>
                    <span className="numerical-value">{ sequencesCount }</span>
                  </span>
                  <span className="places">
                    <i className="fal fa-map-marker fa-1x"></i>
                    <span className="numerical-value">{ placesCount }</span>
                  </span>
                </div>
              </ReactBootstrap.Media.Body>
            </ReactBootstrap.Media>
           </ReactBootstrap.ListGroupItem>
  }
}


