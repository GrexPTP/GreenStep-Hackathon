import React, {useState} from 'react'
import {View, Dimensions} from 'react-native'
import { Searchbar } from 'react-native-paper';
import ProgramList from '../../components/ProgramList';
import config from '../../constant';
import {createAppContainer} from 'react-navigation'
import {createStackNavigator} from 'react-navigation-stack'
import DetailPage from '../DetailPage'
import Constants from 'expo-constants';
const RewardsPage = ({navigation}) => {
    const [query, setQuery] = useState('')
    const GoToDetail = () => {
        navigation.navigate('Detail')
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
    </View>
    )
}
const AppNavigator = createStackNavigator({
    Rewards: {
      screen: RewardsPage,
      navigationOptions: {
        header: null,
      },
    },
    Detail: {
      screen: DetailPage
    }
  },{
          initialRouteName: "Rewards"
  });
export default createAppContainer(AppNavigator)