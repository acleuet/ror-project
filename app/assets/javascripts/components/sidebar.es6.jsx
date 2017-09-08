class Sidebar extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        items: props.data,
        page: props.page
    }
  }

  render () {
    return  <Items data ={this.state.items} page={this.state.page}/>
  }
}


