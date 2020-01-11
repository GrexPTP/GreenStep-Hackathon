import React from 'react'
import {FlatList} from 'react-native'
import DescribedCard from './../DescribedCard'
const ProgramList = ({items, width, handler}) => (
    <FlatList
          style={{margin:10}}
          data={items}
          renderItem={({item}) => <DescribedCard  width={width} {...item} handler={handler}/>}
        />
)
export default ProgramList