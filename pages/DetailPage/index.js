import React, {useState, useEffect} from 'react'
import {View,  ScrollView} from 'react-native'
import config from '../../constant';
import Carousel from 'react-native-snap-carousel'
import DescribedCard from '../../components/DescribedCard';
import { Dimensions } from "react-native";

import { Pedometer } from "expo-sensors";
import {Avatar, Card, Title, Paragraph, Text, Button } from 'react-native-paper'
import Pedo from '../../components/Pedo';
const DetailPage = () => {
    const [items, setItems] = useState(config.sampleItems)
    const [joined, setJoined] = useState(false)
    
    const RenderItem = ({item, index}) => (
    <DescribedCard style={{flex: 1, flexDirection: 'column'}} {...item}/>
  )

    return (
        <View style={{flex:1, flexDirection: "column"}}>
        <View style={{flex: 1}}>
        <Carousel style={{flex: 1}} data={items} sliderWidth={Dimensions.get('window').width}
            itemWidth={250} layout={'default'} renderItem={RenderItem} loop={true}/>
        </View>
        <View style={{flex: 2, marginTop: 5}}>
        <ScrollView>
        <Card style={{margin: 10}} >
                          <Card.Title title={'General Info'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                            <Paragraph style={{fontSize:18}}>{`Program: Name of program`}</Paragraph>
                            <Paragraph style={{fontSize:18}}>{`Date: 22/08/2020`}</Paragraph>
                          </Card.Content>
                        </Card>
                        <Card style={{height: 200,margin: 10}} >
                          <Card.Title title={'Detail Info'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                                <Paragraph>
                                    This is details of the events
                                </Paragraph>
                          </Card.Content>
                        </Card>
                        {joined ? 
                        <React.Fragment>
                          <Button icon="cancel" mode="text" onPress={() => setJoined(false)}>
    Cancel
  </Button>
  <View style={{flex: 1, alignItems:'center'}}>
  
    {Pedometer.isAvailableAsync() ? <Pedo/> : <Text>This device is not supported</Text> }
    
  </View>
                        </React.Fragment>
                         :  <Button icon="door" mode="text" onPress={() => setJoined(true)}>
                         Participate
                       </Button> }
                        
  
        </ScrollView>
        </View>
    </View>
    )
}
    

export default DetailPage