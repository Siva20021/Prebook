import React from 'react'
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome'
const Seat = ({index, isAvaliable = true, setAvail, isSelected = false}) => {
  return (
    <div>
        <FontAwesomeIcon icon="fa-solid fa-chair" />
        <i class="fa-solid fa-chair"></i>
    </div>
  )
}

export default Seat