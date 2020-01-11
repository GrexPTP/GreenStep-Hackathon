import React, {useState, useEffect} from 'react'
import {View,  ScrollView} from 'react-native'
import config from '../../constant';
import Carousel from 'react-native-snap-carousel'
import { Dimensions } from "react-native";
import { Pedometer } from "expo-sensors";
import {Card, Paragraph, Text, Button } from 'react-native-paper'
import Pedo from '../../components/Pedo';
import DescribedImageCard from '../../components/DescribedImageCard';
const DetailPage = ({navigation}) => {
    const [event, setEvent] = useState({images: "[]"})
    const [joined, setJoined] = useState(false)
    const [complete, setComplete] = useState(false)
    useEffect(() => {
        fetch(`http://13.76.100.205/api/event/${navigation.getParam('id',1)}`)
        .then(response => response.json())
        .then(results => {
            setEvent(results)
        })
    }, [])
    const RenderItem = ({item, index}) => (
    <DescribedImageCard style={{flex: 1, flexDirection: 'column'}} image={item}/>
  )

    return (
        <View style={{flex:1, flexDirection: "column"}}>
        <View style={{flex: 1}}>
        { <Carousel style={{flex: 1}} data={JSON.parse(event.images)} sliderWidth={Dimensions.get('window').width}
            itemWidth={250} layout={'default'} renderItem={RenderItem} loop={true}/>}
        </View>
        <View style={{flex: 2, marginTop: 5}}>
        <ScrollView>
        <Card style={{margin: 10}} >
                          <Card.Title title={'General Info'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                            <Paragraph style={{fontSize:18}}>{`Event: ${event.name ? event.name : 'Loading'}`}</Paragraph>
                            <Paragraph style={{fontSize:18}}>{`Start Date: ${event.start_date ? event.start_date : 'Loading' }`}</Paragraph>
                            <Paragraph style={{fontSize:18}}>{`Start Time: ${event.start_time ? event.start_time : 'Loading'}`}</Paragraph>
                            <Paragraph style={{fontSize:18}}>{`End Date: ${event.end_date ? event.end_date : 'Loading'}`}</Paragraph>
                            <Paragraph style={{fontSize:18}}>{`End Time: ${event.end_time ? event.end_time : 'Loading'}`}</Paragraph>
                          </Card.Content>
                        </Card>
                        <Card style={{height: 200,margin: 10}} >
                          <Card.Title title={'Detail Info'} titleStyle={{color: 'red'}} />
                          <Card.Content>
                                <Paragraph>
                                    {event.description ? event.description : 'Loading' }
                                </Paragraph>
                          </Card.Content>
                        </Card>
                        {joined && !complete ? 
                        <React.Fragment>
                          <Button icon="cancel" mode="text" onPress={() => setJoined(false)}>
                                            Cancel
                          </Button>
  <View style={{flex: 1, alignItems:'center'}}>
  
    {Pedometer.isAvailableAsync() ? <Pedo setComplete={setComplete}/> : <Text>This device is not supported</Text> }
    
  </View>
                        </React.Fragment>
                         :  <Button icon="door" mode="text" onPress={ complete ? () => console.log('a') : () => setJoined(true)}>
                         {complete ? 'Receive Coupon' : 'Participate'}
                       </Button> }
                        
  
        </ScrollView>
        </View>
    </View>
    )
}
    

export default DetailPage