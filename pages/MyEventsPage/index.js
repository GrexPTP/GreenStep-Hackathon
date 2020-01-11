import React, {useState} from 'react'
import {View, Dimensions} from 'react-native'
import { Searchbar } from 'react-native-paper';
import ProgramList from '../../components/ProgramList';
import config from '../../constant';
import {createAppContainer} from 'react-navigation'
import {createStackNavigator} from 'react-navigation-stack'
import DetailPage from '../DetailPage'
import Constants from 'expo-constants';
import { FAB } from 'react-native-paper';
import CreateEventPage from '../CreateEventPage';


const MyEventsPage = ({navigation}) => {
    const [query, setQuery] = useState('')
    const GoToDetail = () => {
        navigation.navigate('Detail')
    }
    const GoToAdd = () => {
      navigation.navigate('CreateEvent')
    }
    return(
        <View style={{ flex: 1,
            flexDirection: 'column', paddingTop: Constants.statusBarHeight }}>
            <Searchbar style={{marginBottom: 5}}
        placeholder="Search"
        onChangeText={query => {setQuery(query); }}
        value={query}
      />
      <ProgramList handler={GoToDetail} items={config.sampleItems} width={Dimensions.get('window').width}/>
      <FAB
    style={{
        position: 'absolute',
        margin: 16,
        right: 0,
        bottom: 0,
        backgroundColor: 'purple'
      }} 
    icon="plus"
    onPress={() => GoToAdd()}
  />
    </View>
    )
}
const AppNavigator = createStackNavigator({
    MyEvents: {
      screen: MyEventsPage,
      navigationOptions: {
        header: null,
      },
    },
    Detail: {
      screen: DetailPage
    },
    CreateEvent: {
      screen: CreateEventPage
    }
  },{
          initialRouteName: "MyEvents"
  });
export default createAppContainer(AppNavigator)