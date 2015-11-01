import * as React from "react"

class Product extends React.Component {
  render() {
    return (
      <div>
        <div>{this.props.name}</div>
        <img src={this.props.picture}/>
      </div>
    )
  }
}

export default Product
