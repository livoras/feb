import {log} from "./common/util"
import React from "react"
import Product from "./components/product"

React.render(
  <Product name="John" picture="assets/chair.jpg" />, 
  document.getElementById("content")
);
