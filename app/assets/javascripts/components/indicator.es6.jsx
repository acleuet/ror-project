class Indicator extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
    }
  }

  render () {
    return <div className="indicator">
            <ReactBootstrap.Media>
              <ReactBootstrap.Media.Left align="middle" className="logo">
                <span className="fa-stack fa-3x">
                  <i className="fa fa-badge fa-stack-2x" style={{color: this.props.color}}></i>
                  <i className= {this.props.logoClass+" fa-stack-1x fa-inverse"}></i>
                </span>
              </ReactBootstrap.Media.Left>
              <ReactBootstrap.Media.Body className="data">
                <span className="indicator-value">{ this.props.value }</span><br/>
                <span className="indicator-label">{ I18n.t(this.props.label) }</span>
              </ReactBootstrap.Media.Body>
            </ReactBootstrap.Media>
           </div>
  }
}


