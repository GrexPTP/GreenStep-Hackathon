import React, {useState, useEffect} from 'react'
import {View, Text, Dimensions} from 'react-native'
import { Searchbar } from 'react-native-paper';
import ProgramList from '../../components/ProgramList';
import config from '../../constant';
import {createAppContainer} from 'react-navigation'
import {createStackNavigator} from 'react-navigation-stack'
import DetailPage from '../DetailPage'
import Constants from 'expo-constants';

const EventsPage = ({navigation}) => {
    const [query, setQuery] = useState('')
    const [items, setItems] = useState([])
    const GoToDetail = (id) => {
        navigation.navigate('Detail',{
            id
        })
    }
    useEffect(() => {
        fetch('http://13.76.100.205/api/events')
        .then(response => response.json())
        .then(results => {
            setItems(results)
        })
    }, [])
    return(
        <View style={{ flex: 1,
            flexDirection: 'column', paddingTop: Constants.statusBarHeight }}>
            <Searchbar
            style={{marginBottom: 5}}
        placeholder="Search"
        onChangeText={query => {setQuery(query); }}
        value={query}
      />
      <ProgramList handler={GoToDetail} items={items} width={Dimensions.get('window').width}/>
        </View>
    )
}

const AppNavigator = createStackNavigator({
    Events: {
      screen: EventsPage,
      navigationOptions: {
        header: null,
      },
    },
    Detail: {
      screen: DetailPage
    }
  },{
          initialRouteName: "Events"
  });
export default createAppContainer(AppNavigator)