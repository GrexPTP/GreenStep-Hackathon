import React, {useState, useEffect} from 'react'
import {View,Text} from 'react-native'
import Carousel from 'react-native-snap-carousel'
import DescribedCard from '../../components/DescribedCard';
import ProgramList from '../../components/ProgramList'
import { Dimensions} from "react-native";
import config from '../../constant';
import {createAppContainer} from 'react-navigation'
import {createStackNavigator} from 'react-navigation-stack'
import DetailPage from '../DetailPage'
import Constants from 'expo-constants';

const HomePage = ({navigation}) => {
    const [items, setItems] = useState({"newest":[],"feature":[]})
    useEffect(() => {
        fetch(`http://13.76.100.205/api/home`)
        .then(response => response.json())
        .then(result => {
            setItems(result)
        })
    }, [])
    const RenderItem = ({item, index}) => (
        <DescribedCard style={{flex: 1, flexDirection: 'column'}} handler={GoToDetail} {...item}/>
    )
    const GoToDetail = (id) => {
        navigation.navigate('Detail', {
            id
        })
    }
    return(
        <View style={{flex: 10, flexDirection: 'column', paddingTop: Constants.statusBarHeight}}>
            <Carousel style={{flex: 1}} data={items.feature} sliderWidth={Dimensions.get('window').width}
            itemWidth={250} layout={'default'} renderItem={RenderItem} loop={true}/>
            <View style={{flex: 9, justifyContent:'space-around', alignItems: 'center'}}>
                <ProgramList width={Dimensions.get('window').width} items={items.newest} handler={GoToDetail}/>
            </View>
        </View>
    )
}
const AppNavigator = createStackNavigator({
    Home: {
      screen: HomePage,
      navigationOptions: {
        header: null,
      },
    },
    Detail: {
      screen: DetailPage
    }
  },{
          initialRouteName: "Home"
  });
export default createAppContainer(AppNavigator) 