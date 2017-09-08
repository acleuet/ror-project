class InfiniteScrollBody extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      items: props.data
    }
  }

  componentWillReceiveProps(nextProps) {
    this.setState({
       items: nextProps.data
    });
  }

  render () {
    let itemComponents = this.state.items.map(this._getItemComponent, this);
    return <div>{itemComponents}</div>
  }

  _getItemComponent(item, i) {
    let key = item ? item.id : i;
    let ClassComponent = this.props.ClassComponent
    let itemLink = "dreams/"+item.id
    return <a key={key} href={itemLink}><ClassComponent key={key} data={item} /></a>;
  }
}
