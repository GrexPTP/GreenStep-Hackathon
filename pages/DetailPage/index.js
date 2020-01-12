import React, {useState, useEffect} from 'react'
import {View,  ScrollView} from 'react-native'
import config from '../../constant';
import * as Location from 'expo-location';
import * as Permissions from 'expo-permissions'

import Carousel from 'react-native-snap-carousel'
import { Dimensions } from "react-native";
import { Pedometer } from "expo-sensors";
import {Card, Paragraph, Text, Button, Dialog, Portal, Provider } from 'react-native-paper'
import Pedo from '../../components/Pedo';
import DescribedImageCard from '../../components/DescribedImageCard';
import {useGlobal} from 'reactn'
const DetailPage = ({navigation}) => {
    const [event, setEvent] = useState({images: "[]"})
    const [joined, setJoined] = useState(false)
    const [complete, setComplete] = useState(false)
    const [user, setUser] = useGlobal('user')
    const [visible, setVisible] = useState(false)
    const [message, setMessage] = useState('')
    const [location, setLocation] = useState(null)
  
    // const finishRace =  (eventID, userID) => {        
        
    //      getLocationAsync(eventID, userID)
        
    // }
    
    useEffect(() => {
        fetch(`http://13.76.100.205/api/event/${navigation.getParam('id',1)}?userID=${user.id}`)
        .then(response => response.json())
        .then(results => {
            setEvent(results)
            setJoined(results.joined)
        })
    }, [])
    const finishRace = async (eventID,userID) => {
        let { status } = await Permissions.askAsync(Permissions.LOCATION);
        let location = await Location.getCurrentPositionAsync({});
        fetch(`http://13.76.100.205/api/finish_race?user_id=${userID}&event_id=${eventID}&startLong=${location.coords.longitude}&startLat=${location.coords.latitude}`)
        .then(response => response.json())
        .then(results => {
            if(results.result) setMessage('Congratulation!, You complete the race')
            else setMessage(`Oops, something wrongs`)
            setVisible(true)
            })
        setLocation(location)
        
      };
      const finishStep = () => {
          setMessage('Congratulation!, You complete the race')
          setVisible(true)
      }
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
                        {event.company_name && <Card style={{margin: 10}}>
                            <Card.Title title={'Sponsor'} titleStyle={{color: 'red'}}/>
                            <Card.Content>
                        <Paragraph>{event.company_name}</Paragraph>
                            </Card.Content>
                        </Card> }
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
                            {event.step_amount && Pedometer.isAvailableAsync() ? <Pedo finishStep={finishStep} setComplete={setComplete} totalStep={event.step_amount}/>  : <Button icon="check" mode="text" onPress={() => finishRace(user.id, event.id)}>Finish</Button>  }
                            
                                
                            
                    </View>
                        </React.Fragment>
                         :  <Button icon="door" mode="text" onPress={ complete ? () => console.log('a') : () => setJoined(true)}>
                         {complete ? 'Receive Coupon' : 'Participate'}
                       </Button> } 
                       
                           
                       
                       
        </ScrollView>
                        <Provider>
                           <Portal>
                           <Dialog
                                visible={visible}
                                onDismiss={() => setVisible(false)}>
                                <Dialog.Title>Information</Dialog.Title>
                                <Dialog.Content>
                                <Paragraph>{message}</Paragraph>
                                </Dialog.Content>
                                <Dialog.Actions>
                                    <Button onPress={() => setVisible(false)}>Done</Button>
                                </Dialog.Actions>
                                </Dialog>
                           </Portal> 
                           </Provider>
        </View>
        
    </View>
    )
}
    

export default DetailPage